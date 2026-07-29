import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicFoundation where
  hyperbolicSet : HyperbolicSetPackage
  hyperbolicSetEvidence : HyperbolicSetEvidence hyperbolicSet
  invariantManifold : InvariantManifoldPackage hyperbolicSet
  invariantManifoldEvidence : InvariantManifoldEvidence invariantManifold
  shadowing : ShadowingLemmaPackage invariantManifold
  shadowingEvidence : ShadowingLemmaEvidence shadowing

def HyperbolicFoundationClosed (F : HyperbolicFoundation) : Prop :=
  HyperbolicStructureClosed F.hyperbolicSet ∧
  InvariantManifoldClosed F.invariantManifold ∧
  ShadowingLemmaClosed F.shadowing

theorem hyperbolic_foundation_closed_from_evidence (F : HyperbolicFoundation) :
    HyperbolicFoundationClosed F := by
  exact And.intro
    (hyperbolic_structure_closed_from_evidence F.hyperbolicSet F.hyperbolicSetEvidence)
    (And.intro
      (invariant_manifold_closed_from_evidence F.invariantManifold F.invariantManifoldEvidence)
      (shadowing_lemma_closed_from_evidence F.shadowing F.shadowingEvidence))

theorem hyperbolic_foundation_supplies_shadowing (F : HyperbolicFoundation) :
    ShadowingLemmaClosed F.shadowing :=
  shadowing_lemma_closed_from_evidence F.shadowing F.shadowingEvidence

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
