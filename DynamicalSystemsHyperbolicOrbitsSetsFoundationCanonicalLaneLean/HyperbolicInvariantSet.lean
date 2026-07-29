import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicInvariantSet where
  carrier : Type u
  topology : TopologicalSpace carrier
  diffeomorphism : carrier → carrier
  tangentBundle : Type v
  hyperbolicSplitting : carrier → Prop × Prop
  uniformExpansion : Prop
  uniformContraction : Prop
  invariantUnderFlow : (∀ x, diffeomorphism x ∈ carrier) ∧ (∀ x, ∃ y, diffeomorphism y = x)
  hyperbolicSplittingClosed : uniformExpansion ∧ uniformContraction

structure HyperbolicInvariantSetEvidence (H : HyperbolicInvariantSet) where
  uniformExpansionClosed : H.uniformExpansion
  uniformContractionClosed : H.uniformContraction
  invariantUnderFlowClosed : H.invariantUnderFlow

def HyperbolicInvariantSetClosed (H : HyperbolicInvariantSet) : Prop :=
  H.uniformExpansion ∧ H.uniformContraction ∧ H.invariantUnderFlow

theorem hyperbolic_invariant_set_closed_from_evidence (H : HyperbolicInvariantSet)
    (E : HyperbolicInvariantSetEvidence H) : HyperbolicInvariantSetClosed H := by
  exact And.intro E.uniformExpansionClosed (And.intro E.uniformContractionClosed E.invariantUnderFlowClosed)

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse