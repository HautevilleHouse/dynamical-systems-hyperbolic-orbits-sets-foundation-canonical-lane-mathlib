import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure MoserNormalFormPackage (H : HyperbolicOrbitPackage) where
  localCoordinates : H.phaseSpace -> ℝ^3
  linearPart : (ℝ^3) -> (ℝ^3)
  nonlinearPart : (ℝ^3) -> (ℝ^3)
  conjugacyCondition : Prop
  hyperbolicityPreserved : Prop

structure MoserNormalFormEvidence {H : HyperbolicOrbitPackage} (M : MoserNormalFormPackage H) where
  conjugacyConditionClosed : M.conjugacyCondition
  hyperbolicityPreservedClosed : M.hyperbolicityPreserved

def MoserNormalFormClosed {H : HyperbolicOrbitPackage} (M : MoserNormalFormPackage H) : Prop :=
  M.conjugacyCondition ∧ M.hyperbolicityPreserved

theorem moser_normal_form_closed_from_evidence {H : HyperbolicOrbitPackage}
    (M : MoserNormalFormPackage H) (E : MoserNormalFormEvidence M) : MoserNormalFormClosed M := by
  exact And.intro E.conjugacyConditionClosed E.hyperbolicityPreservedClosed

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse