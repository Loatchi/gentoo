# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999
#hackport: flags: +ofd-locking

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="File locking"
HOMEPAGE="https://hackage.haskell.org/package/lukko"
HACKAGE_REV="2"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz
	https://hackage.haskell.org/package/${P}/revision/${HACKAGE_REV}.cabal -> ${PF}.cabal"

LICENSE="GPL-2 BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( >=dev-haskell/async-2.2.2 <dev-haskell/async-2.3
		>=dev-haskell/singleton-bool-0.1.5 <dev-haskell/singleton-bool-0.2
		>=dev-haskell/tasty-1.4.0.1 <dev-haskell/tasty-1.5
		>=dev-haskell/tasty-hunit-0.10.0.2 <dev-haskell/tasty-hunit-0.11
		>=dev-haskell/temporary-1.3 <dev-haskell/temporary-1.4
		>=dev-haskell/tasty-expected-failure-0.11.1.2 <dev-haskell/tasty-expected-failure-0.13 )
"
BDEPEND="app-text/dos2unix"

src_prepare() {
	# pull revised cabal from upstream
	cp "${DISTDIR}/${PF}.cabal" "${S}/${PN}.cabal" || die

	# Convert to unix line endings
	dos2unix "${S}/${PN}.cabal" || die

	# Apply patches *after* pulling the revised cabal
	default
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=ofd-locking
}
