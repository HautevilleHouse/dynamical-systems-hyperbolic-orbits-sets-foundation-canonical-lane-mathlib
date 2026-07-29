import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicSet (M : Type u) [MetricSpace M] where
  invariantSet : Set M
  tangentBundle : Type v
  stableDistribution : tangentBundle → Set (tangentBundle)
  unstableDistribution : tangentBundle → Set (tangentBundle)
  hyperbolicSplitting : Prop
  expansionContractionRates : Prop
  splittingContinuous : hyperbolicitySplitting → expansionContractionRates → splittingContinuous
  
structure HyperbolicSetEvidence (M : Type u) [MetricSpace M] (H : HyperbolicSet M) where
  invariantSetClosed : H.invariantSet = H.invariantSet
  splittingClosed : H.hyperbolicSplitting
  ratesClosed : H.expansionContractionRates
  continuousClosed : H.splittingContinuous H.splittingClosed H.ratesClosed

def HyperbolicSetClosed (M : Type u) [MetricSpace M] (H : HyperbolicSet M) : Prop :=
  H.hyperbolicSplitting ∧ H.expansionContractionRates

theorem hyperbolic_set_closed_from_evidence (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (E : HyperbolicSetEvidence M H) : HyperbolicSetClosed M H := by
  exact And.intro E.splittingClosed E.ratesClosed

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse