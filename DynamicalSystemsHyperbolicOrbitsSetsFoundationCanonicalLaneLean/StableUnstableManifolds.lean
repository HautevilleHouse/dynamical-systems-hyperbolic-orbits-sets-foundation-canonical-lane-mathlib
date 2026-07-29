import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure StableManifold (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) where
  stableSet : Set M
  unstableSet : Set M
  stableDimension : ℕ
  unstableDimension : ℕ
  stableManifoldEmbedding : stableSet → M
  unstableManifoldEmbedding : unstableSet → M
  invariance : Prop
  contractionAlongStable : Prop
  expansionAlongUnstable : Prop
  tangentSpaceSplitting : Prop
  manifoldSmoothness : Prop
  
structure StableUnstableEvidence (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) (S : StableManifold M O) where
  invarianceClosed : S.invariance
  contractionClosed : S.contractionAlongStable
  expansionClosed : S.expansionAlongUnstable
  splittingClosed : S.tangentSpaceSplitting
  smoothClosed : S.manifoldSmoothness

def StableUnstableClosed (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) (S : StableManifold M O) : Prop :=
  S.invariance ∧ S.contractionAlongStable ∧ S.expansionAlongUnstable ∧ S.tangentSpaceSplitting ∧ S.manifoldSmoothness

theorem stable_unstable_closed_from_evidence (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) (S : StableManifold M O) (E : StableUnstableEvidence M O S) : StableUnstableClosed M O S := by
  exact And.intro E.invarianceClosed (And.intro E.contractionClosed (And.intro E.expansionClosed (And.intro E.splittingClosed E.smoothClosed)))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse