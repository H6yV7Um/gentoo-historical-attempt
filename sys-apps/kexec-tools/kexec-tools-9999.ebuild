# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/kexec-tools/kexec-tools-9999.ebuild,v 1.13 2015/04/15 08:37:14 vapier Exp $

EAPI=5

AUTOTOOLS_AUTORECONF=true

inherit autotools-utils linux-info systemd git-r3

DESCRIPTION="Load another kernel from the currently executing Linux kernel"
HOMEPAGE="http://kernel.org/pub/linux/utils/kernel/kexec/"
SRC_URI=""
EGIT_REPO_URI="git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="booke lzma xen zlib"

REQUIRED_USE="lzma? ( zlib )"

DEPEND="
	lzma? ( app-arch/xz-utils )
	zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

CONFIG_CHECK="~KEXEC"

PATCHES=(
	"${FILESDIR}"/${PN}-2.0.4-disable-kexec-test.patch
	"${FILESDIR}"/${PN}-2.0.4-out-of-source.patch
	"${FILESDIR}"/${PN}-2.0.9-hardened.patch
)

pkg_setup() {
	# GNU Make's $(COMPILE.S) passes ASFLAGS to $(CCAS), CCAS=$(CC)
	export ASFLAGS="${CCASFLAGS}"
}

src_configure() {
	local myeconfargs=(
		$(use_with booke)
		$(use_with lzma)
		$(use_with xen)
		$(use_with zlib)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install

	dodoc "${FILESDIR}"/README.Gentoo

	newinitd "${FILESDIR}"/kexec.init-${PV} kexec
	newconfd "${FILESDIR}"/kexec.conf-${PV} kexec

	insinto /etc
	doins "${FILESDIR}"/kexec.conf

	insinto /etc/kernel/postinst.d
	doins "${FILESDIR}"/90_kexec

	systemd_dounit "${FILESDIR}"/kexec.service
}

pkg_postinst() {
	if systemd_is_booted || has_version sys-apps/systemd; then
		elog "For systemd support the new config file is"
		elog "   /etc/kexec.conf"
		elog "Please adopt it to your needs as there is no autoconfig anymore"
	fi
}
