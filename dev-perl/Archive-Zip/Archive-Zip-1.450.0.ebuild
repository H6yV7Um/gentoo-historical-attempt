# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Archive-Zip/Archive-Zip-1.450.0.ebuild,v 1.1 2015/02/19 01:06:19 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=PHRED
MODULE_VERSION=1.45
inherit perl-module

DESCRIPTION="A wrapper that lets you read Zip archive members as if they were files"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="
	>=virtual/perl-Compress-Raw-Zlib-2.17
	>=virtual/perl-File-Spec-0.800.0
"
RDEPEND="${DEPEND}"

SRC_TEST="do"
