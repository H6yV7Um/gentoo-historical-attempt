# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/importing/importing-1.10.ebuild,v 1.6 2015/04/08 08:05:11 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

MY_PN="Importing"

DESCRIPTION="Import objects dynamically, lazily, "weakly", and more"
HOMEPAGE=" http://peak.telecommunity.com/DevCenter/Importing"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.zip -> ${P}.zip"

KEYWORDS="amd64 x86"
IUSE=""
LICENSE="ZPL"
SLOT="0"

RDEPEND=""
DEPEND="app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}"/${MY_PN}-${PV}
