# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-webalizer/selinux-webalizer-2.20141203-r8.ebuild,v 1.1 2015/08/04 17:42:08 perfinion Exp $
EAPI="5"

IUSE=""
MODS="webalizer"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for webalizer"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi

DEPEND="${DEPEND}
	sec-policy/selinux-apache
"
RDEPEND="${RDEPEND}
	sec-policy/selinux-apache
"
