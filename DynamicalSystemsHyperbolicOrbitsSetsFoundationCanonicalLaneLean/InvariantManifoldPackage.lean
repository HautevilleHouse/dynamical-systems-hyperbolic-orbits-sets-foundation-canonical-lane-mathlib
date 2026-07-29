import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure InvariantManifoldPackage (H : HyperbolicSetPackage) where
  stableManifold : H.phaseSpace → Set H.phaseSpace
  unstableManifold : H.phaseSpace → Set H.phaseSpace
  invarianceUnderDynamics : Prop
  tangentSpaceCharacterization : Prop
  localProductStructure : Prop

structure InvariantManifoldEvidence {H : HyperbolicSetPackage}
    (I : InvariantManifoldPackage H) where
  invarianceUnderDynamicsClosed : I.invarianceUnderDynamics
  tangentSpaceCharacterizationClosed : I.tangentSpaceCharacterization
  localProductStructureClosed : I.localProductStructure

def InvariantManifoldClosed {H : HyperbolicSetPackage}
    (I : InvariantManifoldPackage H) : Prop :=
  I.invarianceUnderDynamics ∧ I.tangentSpaceCharacterization ∧ I.localProductStructure

theorem invariant_manifold_closed_from_evidence
    {H : HyperbolicSetPackage} (I : InvariantManifoldPackage H)
    (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.invarianceUnderDynamicsClosed
    (And.intro E.tangentSpaceCharacterizationClosed E.localProductStructureClosed)

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
