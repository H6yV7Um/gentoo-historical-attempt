# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/reconfigure/reconfigure-0.1.72.ebuild,v 1.1 2015/06/15 14:58:36 mrueg Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="An ORM for config files"
HOMEPAGE="https://pypi.python.org/pypi/reconfigure/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="LGPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-python/chardet[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
