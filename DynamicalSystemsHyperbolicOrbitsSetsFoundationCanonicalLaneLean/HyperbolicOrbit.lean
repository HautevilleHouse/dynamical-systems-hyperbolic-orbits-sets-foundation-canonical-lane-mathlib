import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicOrbit (M : Type u) [MetricSpace M] where
  orbitPoint : M
  orbit : Set M
  periodic : Prop
  tangentMap : Type v
  spectrum : tangentMap → Set ℝ
  lyapunovExponents : List ℝ
  hyperbolicStructure : Prop
  noZeroLyapunovExponents : hyperbolicityStructure → (∀ λ ∈ lyapunovExponents, λ ≠ 0)
  
structure HyperbolicOrbitEvidence (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) where
  orbitClosed : O.hyperbolicStructure
  noZeroExponentsClosed : O.noZeroLyapunovExponents O.hyperbolicStructure

def HyperbolicOrbitClosed (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) : Prop :=
  O.hyperbolicStructure ∧ (∀ λ ∈ O.lyapunovExponents, λ ≠ 0)

theorem hyperbolic_orbit_closed_from_evidence (M : Type u) [MetricSpace M] (O : HyperbolicOrbit M) (E : HyperbolicOrbitEvidence M O) : HyperbolicOrbitClosed M O := by
  have h : ∀ λ ∈ O.lyapunovExponents, λ ≠ 0 := E.noZeroExponentsClosed
  exact And.intro E.orbitClosed h

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse