import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure StableUnstableManifold {M : Type} [TopologicalSpace M] (H : HyperbolicInvariantSet M) where
  stableManifold : Set M
  unstableManifold : Set M
  stableTangentDistribution : Prop
  unstableTangentDistribution : Prop
  stableContractionDominates : Prop
  unstableExpansionDominates : Prop
  localProductStructure : Prop

structure StableUnstableManifoldEvidence {M : Type} [TopologicalSpace M] {H : HyperbolicInvariantSet M} 
    (S : StableUnstableManifold H) where
  stableTangentDistributionClosed : S.stableTangentDistribution
  unstableTangentDistributionClosed : S.unstableTangentDistribution
  stableContractionDominatesClosed : S.stableContractionDominates
  unstableExpansionDominatesClosed : S.unstableExpansionDominates
  localProductStructureClosed : S.localProductStructure

def StableUnstableManifoldClosed {M : Type} [TopologicalSpace M] {H : HyperbolicInvariantSet M}
    (S : StableUnstableManifold H) : Prop :=
  S.stableTangentDistribution ∧ S.unstableTangentDistribution ∧
  S.stableContractionDominates ∧ S.unstableExpansionDominates ∧
  S.localProductStructure

theorem stable_unstable_manifold_closed_from_evidence
    {M : Type} [TopologicalSpace M] {H : HyperbolicInvariantSet M}
    (S : StableUnstableManifold H) (E : StableUnstableManifoldEvidence S) :
    StableUnstableManifoldClosed S := by
  exact And.intro E.stableTangentDistributionClosed
    (And.intro E.unstableTangentDistributionClosed
      (And.intro E.stableContractionDominatesClosed
        (And.intro E.unstableExpansionDominatesClosed
          E.localProductStructureClosed)))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
