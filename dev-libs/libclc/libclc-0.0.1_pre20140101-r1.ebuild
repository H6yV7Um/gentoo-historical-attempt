# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libclc/libclc-0.0.1_pre20140101-r1.ebuild,v 1.3 2015/04/08 17:51:55 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

EGIT_REPO_URI="http://llvm.org/git/${PN}.git"

if [[ ${PV} = 9999* ]]; then
	GIT_ECLASS="git-2"
	EXPERIMENTAL="true"
fi

inherit base python-any-r1 $GIT_ECLASS

DESCRIPTION="OpenCL C library"
HOMEPAGE="http://libclc.llvm.org/"

if [[ $PV = 9999* ]]; then
	SRC_URI="${SRC_PATCHES}"
else
	SRC_URI="mirror://gentoo/${P}.tar.xz ${SRC_PATCHES}"
fi

LICENSE="|| ( MIT BSD )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="
	>=sys-devel/clang-3.4
	>=sys-devel/llvm-3.4
	<sys-devel/clang-3.6
	<sys-devel/llvm-3.6"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}"

src_unpack() {
	if [[ $PV = 9999* ]]; then
		git-2_src_unpack
	else
		default
		mv ${PN}-*/ ${P} || die
	fi
}

src_prepare() {
	epatch "${FILESDIR}/libclc-llvm-3.5-compat.patch"
}

src_configure() {
	./configure.py \
		--with-llvm-config="${EPREFIX}/usr/bin/llvm-config" \
		--prefix="${EPREFIX}/usr" || die
}

src_compile() {
	emake VERBOSE=1
}
