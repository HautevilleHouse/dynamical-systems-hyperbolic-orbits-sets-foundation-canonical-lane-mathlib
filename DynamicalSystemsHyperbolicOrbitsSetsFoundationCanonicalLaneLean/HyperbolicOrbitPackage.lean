import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicOrbitPackage where
  phaseSpace : Type u
  dynamics : phaseSpace -> phaseSpace
  fixedPoint : phaseSpace
  hyperbolicCondition : Prop
  stableManifold : Set phaseSpace
  unstableManifold : Set phaseSpace
  hyperbolicityConstants : Prop
  stableUnstableTransverse : Prop

structure HyperbolicOrbitEvidence (H : HyperbolicOrbitPackage) where
  hyperbolicConditionClosed : H.hyperbolicCondition
  stableManifoldClosed : H.stableManifold ≠ ∅
  unstableManifoldClosed : H.unstableManifold ≠ ∅
  transverseIntersectionClosed : H.stableUnstableTransverse

def HyperbolicOrbitClosed (H : HyperbolicOrbitPackage) : Prop :=
  H.hyperbolicCondition ∧ H.stableUnstableTransverse

theorem hyperbolic_orbit_closed_from_evidence (H : HyperbolicOrbitPackage) (E : HyperbolicOrbitEvidence H) :
    HyperbolicOrbitClosed H := by
  exact And.intro E.hyperbolicConditionClosed E.transverseIntersectionClosed

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse