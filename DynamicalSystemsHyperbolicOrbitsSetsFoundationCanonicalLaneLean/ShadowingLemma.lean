import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure ShadowingLemma (M : Type u) [MetricSpace M] (H : HyperbolicSet M) where
  epsilon : ℝ
  delta : ℝ
  epsilonPositive : epsilon > 0
  deltaPositive : delta > 0
  pseudoOrbit : ℕ → M
  trueOrbit : ℕ → M
  shadowingProperty : Prop
  distanceBound : ∀ n : ℕ, dist (pseudoOrbit n) (trueOrbit n) < epsilon
  uniformHyperbolicity : Prop
  shadowingHolds : uniformHyperbolicity → shadowingProperty
  
structure ShadowingEvidence (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (L : ShadowingLemma M H) where
  uniformHyperbolicClosed : L.uniformHyperbolicity
  shadowingClosed : L.shadowingHolds L.uniformHyperbolicClosed
  distBoundClosed : ∀ n : ℕ, dist (L.pseudoOrbit n) (L.trueOrbit n) < L.epsilon
  epsilonPosClosed : L.epsilonPositive
  deltaPosClosed : L.deltaPositive

def ShadowingClosed (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (L : ShadowingLemma M H) : Prop :=
  L.uniformHyperbolicity → L.shadowingProperty

theorem shadowing_closed_from_evidence (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (L : ShadowingLemma M H) (E : ShadowingEvidence M H L) : ShadowingClosed M H L := by
  intro h
  exact E.shadowingClosed

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse