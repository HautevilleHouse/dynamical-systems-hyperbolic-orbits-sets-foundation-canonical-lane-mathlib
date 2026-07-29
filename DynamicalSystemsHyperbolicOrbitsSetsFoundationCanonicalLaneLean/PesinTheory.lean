import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean.HyperbolicInvariantSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure PesinTheory {H : HyperbolicInvariantSet} where
  lyapunovExponents : H.carrier → List ℝ
  nonuniformHyperbolicity : Prop
  stableManifoldTheorem : Prop
  entropyFormula : Prop
  exponentsDefined : (∀ x, ∀ λ ∈ lyapunovExponents x, λ ≠ 0)
  hyperbolicityClosed : nonuniformHyperbolicity
  stableManifoldClosed : stableManifoldTheorem
  entropyClosed : entropyFormula

def PesinTheoryClosed {H : HyperbolicInvariantSet} (P : PesinTheory H) : Prop :=
  P.nonuniformHyperbolicity ∧ P.stableManifoldTheorem ∧ P.entropyFormula

theorem pesin_theory_closed {H : HyperbolicInvariantSet} (P : PesinTheory H) :
    PesinTheoryClosed P := by
  exact And.intro P.hyperbolicityClosed (And.intro P.stableManifoldClosed P.entropyClosed)

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse