# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop prefix xdg

DESCRIPTION="Visual Understanding Environment"
HOMEPAGE="https://vue.tufts.edu/"
SRC_URI="https://github.com/VUE/VUE/releases/download/3.3.0/VUE.jar"
LICENSE="ECL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="
		virtual/jdk
		dev-util/desktop-file-utils
"

RESTRICT="test"

#It does not need unpack

src_unpack() {
	mkdir ${WORKDIR}/${PF}/${PN} -p
	cp -vd ${DISTDIR}/VUE* ${WORKDIR}/${PF}/${PN} || die
}

#src_prepare() {
#        default
#}

src_install() {
        insinto /opt
        doins -r vue
        newbin "$(prefixify_ro "${FILESDIR}"/vue.sh)" vue
        fperms 0755 /opt/vue/
        doicon "${FILESDIR}/vue.png"
        make_desktop_entry vue vue vue Office
}

src_test() {
        ewarn "package has no tests"
}

