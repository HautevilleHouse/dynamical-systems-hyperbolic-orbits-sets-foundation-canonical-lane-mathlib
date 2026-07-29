import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicInvariantSet (M : Type) [TopologicalSpace M] where
  carrier : Set M
  dynamics : M → M
  hyperbolicStructure : Prop
  invariant : ∀ x ∈ carrier, dynamics x ∈ carrier
  uniformHyperbolicity : Prop
  exponentialContraction : Prop
  exponentialExpansion : Prop

structure HyperbolicInvariantSetEvidence {M : Type} [TopologicalSpace M] (H : HyperbolicInvariantSet M) where
  carrierClosed : H.hyperbolicStructure
  dynamicsInvariantClosed : H.invariant
  uniformHyperbolicityClosed : H.uniformHyperbolicity
  exponentialContractionClosed : H.exponentialContraction
  exponentialExpansionClosed : H.exponentialExpansion

def HyperbolicInvariantSetClosed {M : Type} [TopologicalSpace M] (H : HyperbolicInvariantSet M) : Prop :=
  H.hyperbolicStructure ∧ H.invariant ∧ H.uniformHyperbolicity ∧ H.exponentialContraction ∧ H.exponentialExpansion

theorem hyperbolic_invariant_set_closed_from_evidence
    {M : Type} [TopologicalSpace M] (H : HyperbolicInvariantSet M) (E : HyperbolicInvariantSetEvidence H) :
    HyperbolicInvariantSetClosed H := by
  exact And.intro E.carrierClosed
    (And.intro E.dynamicsInvariantClosed
      (And.intro E.uniformHyperbolicityClosed
        (And.intro E.exponentialContractionClosed
          E.exponentialExpansionClosed)))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
