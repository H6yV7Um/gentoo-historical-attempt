# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-radius/selinux-radius-2.20141203-r8.ebuild,v 1.1 2015/08/04 17:42:01 perfinion Exp $
EAPI="5"

IUSE=""
MODS="radius"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for radius"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
