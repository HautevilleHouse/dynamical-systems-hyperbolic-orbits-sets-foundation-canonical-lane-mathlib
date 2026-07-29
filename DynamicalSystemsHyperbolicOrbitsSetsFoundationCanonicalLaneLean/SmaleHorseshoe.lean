import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure SmaleHorseshoe {M : Type} [TopologicalSpace M] where
  invariantSet : HyperbolicInvariantSet M
  topologicalTransitivity : Prop
  densePeriodicPoints : Prop
  sensitiveDependence : Prop
  symbolicDynamics : Prop
  shiftEquivalence : Prop

structure SmaleHorseshoeEvidence {M : Type} [TopologicalSpace M] (S : SmaleHorseshoe M) where
  invariantSetClosed : HyperbolicInvariantSetClosed S.invariantSet
  topologicalTransitivityClosed : S.topologicalTransitivity
  densePeriodicPointsClosed : S.densePeriodicPoints
  sensitiveDependenceClosed : S.sensitiveDependence
  symbolicDynamicsClosed : S.symbolicDynamics
  shiftEquivalenceClosed : S.shiftEquivalence

def SmaleHorseshoeClosed {M : Type} [TopologicalSpace M] (S : SmaleHorseshoe M) : Prop :=
  HyperbolicInvariantSetClosed S.invariantSet ∧ S.topologicalTransitivity ∧
  S.densePeriodicPoints ∧ S.sensitiveDependence ∧
  S.symbolicDynamics ∧ S.shiftEquivalence

theorem smale_horseshoe_closed_from_evidence
    {M : Type} [TopologicalSpace M] (S : SmaleHorseshoe M) (E : SmaleHorseshoeEvidence S) :
    SmaleHorseshoeClosed S := by
  exact And.intro E.invariantSetClosed
    (And.intro E.topologicalTransitivityClosed
      (And.intro E.densePeriodicPointsClosed
        (And.intro E.sensitiveDependenceClosed
          (And.intro E.symbolicDynamicsClosed
            E.shiftEquivalenceClosed))))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
