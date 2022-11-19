# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop prefix xdg

MY_PV="${PV//./-}"

DESCRIPTION="Mathematics software for geometry"
HOMEPAGE="https://www.geogebra.org"
SRC_URI="https://download.geogebra.org/installers/6.0/GeoGebra-Linux64-Portable-${MY_PV}.zip
	https://dev.gentoo.org/~gyakovlev/distfiles/Geogebra.svg"

LICENSE="Geogebra CC-BY-NC-SA-3.0 GPL-3 Apache-2.0 BSD-2 BSD BSD-4 colt EPL-1.0 icu LGPL-2.1 LGPL-2.1+ MIT W3C || ( GPL-2 CDDL )"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"
IUSE=""

RDEPEND="
	!sci-mathematics/geogebra
"

# no tests
RESTRICT="test"

src_unpack() {
	default
	mkdir -p "${P}/geogebra"
	mv -v GeoGebra-linux* ${P}/geogebra || die
#	rm -rf "${P}/jre"* || die
#	rm -f "${P}/geogebra-portable" || die
}

src_prepare() {
	eapply_user
}

src_install() {
	insinto /opt
	doins -r geogebra
#	newbin $("${FILESDIR}"/geogebra.sh) geogebra
	newbin "$(prefixify_ro "${FILESDIR}"/geogebra.sh)" geogebra
	fperms 0755 /opt/geogebra/GeoGebra-linux-x64/GeoGebra
	doicon "${DISTDIR}/Geogebra.svg"
	make_desktop_entry "/bin/sh -c /usr/bin/geogebra" Geogebra Geogebra Science
}

src_test() {
	ewarn "package has no tests"
}

