import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean.HyperbolicSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure AnosovFlow (M : Type u) [MetricSpace M] (H : HyperbolicSet M) where
  flowMap : ℝ → M → M
  infinitesimalGenerator : M → M
  flowHyperbolic : H.invariantSet = Set.univ
  splittingUnderFlow : Prop
  exponentialDichotomy : Prop
  topologicalAnosov : Prop
  flowInvariance : Prop
  structuralStability : Prop
  
structure AnosovFlowEvidence (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (A : AnosovFlow M H) where
  flowInvariantClosed : A.flowInvariance
  dichotomyClosed : A.exponentialDichotomy
  splittingClosed : A.splittingUnderFlow
  anosovClosed : A.topologicalAnosov
  stabilityClosed : A.structuralStability
  hyperbolicFullClosed : A.flowHyperbolic

def AnosovFlowClosed (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (A : AnosovFlow M H) : Prop :=
  A.flowInvariance ∧ A.exponentialDichotomy ∧ A.splittingUnderFlow ∧ A.topologicalAnosov ∧ A.structuralStability ∧ A.flowHyperbolic

theorem anosov_flow_closed_from_evidence (M : Type u) [MetricSpace M] (H : HyperbolicSet M) (A : AnosovFlow M H) (E : AnosovFlowEvidence M H A) : AnosovFlowClosed M H A := by
  exact And.intro E.flowInvariantClosed (And.intro E.dichotomyClosed (And.intro E.splittingClosed (And.intro E.anosovClosed (And.intro E.stabilityClosed E.hyperbolicFullClosed))))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse