# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/logstalgia/logstalgia-1.0.6.ebuild,v 1.1 2015/04/23 10:09:34 pinkbyte Exp $

EAPI=5

inherit eutils

DESCRIPTION="Replays or streams an access_log as a retro arcade game-like simulation"
HOMEPAGE="http://code.google.com/p/logstalgia/"
SRC_URI="https://github.com/acaudwell/Logstalgia/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/libpcre
	media-libs/freetype:2
	media-libs/glew:0=
	media-libs/libsdl2[opengl,threads]
	media-libs/libpng:0=
	media-libs/sdl2-image[jpeg,png]
	virtual/glu
	virtual/opengl"
DEPEND="${DEPEND}
	dev-libs/boost
	media-libs/glm
	virtual/pkgconfig"

DOCS=( ChangeLog INSTALL README THANKS )

src_prepare() {
	epatch_user
}
