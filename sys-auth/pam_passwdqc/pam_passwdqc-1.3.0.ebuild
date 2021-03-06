# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/pam_passwdqc/pam_passwdqc-1.3.0.ebuild,v 1.1 2015/07/07 08:17:49 vapier Exp $

EAPI="5"

DESCRIPTION="Stub ebuild to help migrate to newer package name"
HOMEPAGE="http://www.openwall.com/passwdqc/"

LICENSE="Openwall BSD public-domain"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux"

DEPEND="sys-auth/passwdqc[pam]"
RDEPEND="${DEPEND}"
