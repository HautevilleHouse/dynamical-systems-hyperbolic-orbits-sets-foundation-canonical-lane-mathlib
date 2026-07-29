import DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean.ShadowingLemma

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure SpectralDecompositionPackage {M : Type} [TopologicalSpace M] [MetricSpace M]
  {H : HyperbolicOrbitPackage M} {S : StableUnstableManifoldPackage H}
  (L : ShadowingLemmaPackage S) where
  basicSets : List (Set M)
  decompositionIntoBasicSets : Prop
  denseOrbitInEach : Prop
  periodicOrbitsDense : Prop
  topologicalTransitivity : Prop

structure SpectralDecompositionEvidence {M : Type} [TopologicalSpace M] [MetricSpace M]
  {H : HyperbolicOrbitPackage M} {S : StableUnstableManifoldPackage H}
  {L : ShadowingLemmaPackage S} (D : SpectralDecompositionPackage L) where
  decompositionIntoBasicSetsClosed : D.decompositionIntoBasicSets
  denseOrbitInEachClosed : D.denseOrbitInEach
  periodicOrbitsDenseClosed : D.periodicOrbitsDense
  topologicalTransitivityClosed : D.topologicalTransitivity

def SpectralDecompositionClosed {M : Type} [TopologicalSpace M] [MetricSpace M]
  {H : HyperbolicOrbitPackage M} {S : StableUnstableManifoldPackage H}
  {L : ShadowingLemmaPackage S} (D : SpectralDecompositionPackage L) : Prop :=
  D.decompositionIntoBasicSets ∧ D.denseOrbitInEach ∧ D.periodicOrbitsDense ∧ D.topologicalTransitivity

theorem spectral_decomposition_closed_from_evidence {M : Type} [TopologicalSpace M] [MetricSpace M]
  {H : HyperbolicOrbitPackage M} {S : StableUnstableManifoldPackage H}
  {L : ShadowingLemmaPackage S} (D : SpectralDecompositionPackage L)
  (E : SpectralDecompositionEvidence D) : SpectralDecompositionClosed D :=
  And.intro E.decompositionIntoBasicSetsClosed
    (And.intro E.denseOrbitInEachClosed
      (And.intro E.periodicOrbitsDenseClosed E.topologicalTransitivityClosed))

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
