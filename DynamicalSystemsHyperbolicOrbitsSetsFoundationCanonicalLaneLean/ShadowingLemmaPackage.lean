import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure ShadowingLemmaPackage {H : HyperbolicSetPackage}
    (I : InvariantManifoldPackage H) where
  epsilonShadowing : Prop
  deltaPseudoOrbit : Prop
  uniqueShadowing : Prop
  linearShadowingEstimate : Prop

structure ShadowingLemmaEvidence {H : HyperbolicSetPackage}
    {I : InvariantManifoldPackage H} (S : ShadowingLemmaPackage I) where
  epsilonShadowingClosed : S.epsilonShadowing
  deltaPseudoOrbitClosed : S.deltaPseudoOrbit
  uniqueShadowingClosed : S.uniqueShadowing
  linearShadowingEstimateClosed : S.linearShadowingEstimate

def ShadowingLemmaClosed {H : HyperbolicSetPackage}
    {I : InvariantManifoldPackage H} (S : ShadowingLemmaPackage I) : Prop :=
  S.epsilonShadowing ∧ S.deltaPseudoOrbit ∧ S.uniqueShadowing ∧ S.linearShadowingEstimate

theorem shadowing_lemma_closed_from_evidence
    {H : HyperbolicSetPackage} {I : InvariantManifoldPackage H}
    (S : ShadowingLemmaPackage I) (E : ShadowingLemmaEvidence S) :
    ShadowingLemmaClosed S := by
  exact And.intro E.epsilonShadowingClosed
    (And.intro E.deltaPseudoOrbitClosed
      (And.intro E.uniqueShadowingClosed E.linearShadowingEstimateClosed))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
