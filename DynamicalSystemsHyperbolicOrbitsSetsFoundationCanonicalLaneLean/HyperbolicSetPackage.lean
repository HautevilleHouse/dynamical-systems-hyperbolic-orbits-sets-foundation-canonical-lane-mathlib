import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean

structure HyperbolicSetPackage where
  phaseSpace : Type
  dynamics : phaseSpace → phaseSpace
  hyperbolicSet : Set phaseSpace
  splitting : Prop
  expansionContractionRates : Prop
  shadowingProperty : Prop

structure HyperbolicSetEvidence (H : HyperbolicSetPackage) where
  splittingClosed : H.splitting
  expansionContractionRatesClosed : H.expansionContractionRates
  shadowingPropertyClosed : H.shadowingProperty

def HyperbolicStructureClosed (H : HyperbolicSetPackage) : Prop :=
  H.splitting ∧ H.expansionContractionRates ∧ H.shadowingProperty

theorem hyperbolic_structure_closed_from_evidence
    (H : HyperbolicSetPackage) (E : HyperbolicSetEvidence H) :
    HyperbolicStructureClosed H := by
  exact And.intro E.splittingClosed
    (And.intro E.expansionContractionRatesClosed E.shadowingPropertyClosed)

end DynamicalSystemsHyperbolicOrbitsSetsFoundationCanonicalLaneLean
end HautevilleHouse
