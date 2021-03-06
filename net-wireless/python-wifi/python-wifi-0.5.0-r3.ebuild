# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/python-wifi/python-wifi-0.5.0-r3.ebuild,v 1.1 2015/04/03 20:53:28 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Provides r/w access to a wireless network card's capabilities using the Linux Wireless Extensions"
HOMEPAGE="http://pypi.python.org/pypi/python-wifi"
SRC_URI="mirror://sourceforge/${PN}.berlios/${P}.tar.bz2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"
LICENSE="LGPL-2.1 examples? ( GPL-2 )"
IUSE="examples"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( docs/AUTHORS docs/BUGS docs/DEVEL.txt docs/TODO )

src_install() {
	distutils-r1_src_install
	use examples && dodoc -r examples
	rm -rv "${ED}"/usr/{docs,examples,INSTALL,README} || die
	if use examples; then
		mv -v "${ED}"/usr{,/share}/man || die
	else
		rm -rv "${ED}"/usr/man || die
	fi
}
