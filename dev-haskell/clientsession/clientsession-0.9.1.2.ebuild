# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Securely store session data in a client-side cookie"
HOMEPAGE="https://github.com/yesodweb/clientsession/tree/master"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="test"

RDEPEND=">=dev-haskell/base64-bytestring-0.1.1.1:=[profile?]
	>=dev-haskell/cereal-0.3:=[profile?]
	>=dev-haskell/cipher-aes-0.1.7:=[profile?]
	>=dev-haskell/cprng-aes-0.2:=[profile?]
	>=dev-haskell/crypto-api-0.8:=[profile?]
	dev-haskell/crypto-random:=[profile?]
	>=dev-haskell/entropy-0.2.1:=[profile?]
	dev-haskell/setenv:=[profile?]
	>=dev-haskell/skein-1.0:=[profile?] <dev-haskell/skein-1.1:=[profile?]
	>=dev-haskell/tagged-0.1:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/hunit
		>=dev-haskell/quickcheck-2 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag test test)
}
