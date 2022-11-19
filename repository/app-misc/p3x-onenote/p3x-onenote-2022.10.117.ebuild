# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="📚 P3X OneNote Linux"
HOMEPAGE="https://corifeus.com/onenote"
SRC_URI="https://github.com/patrikx3/onenote/releases/download/v2022.10.117/p3x-onenote_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-crypt/libsecret
		x11-misc/xdg-utils
		x11-libs/libXtst
		x11-libs/libnotify
		x11-libs/gtk+
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
        default
		rm control.tar.gz
		rm debian-binary
		mkdir p3x-onenote-${PV}/ -p
		tar -xJvf data.tar.xz -C p3x-onenote-${PV}/
		rm data.tar.xz
		cp p3x-onenote-${PV}/usr/share/icons/hicolor/128x128/apps/p3x-onenote.png p3x-onenote-${PV}/usr/share/icons/
		rm -r p3x-onenote-${PV}/usr/share/icons/hicolor
}


src_install() {
        insinto /
		doins -r usr opt
		fperms 0755 /opt/P3X\ OneNote/p3x-onenote
}

src_test() {
        ewarn "package has no tests"
}


