import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure DurabilityConditions where
  moistureContent : ℝ
  temperatureRange : ℝ × ℝ
  biologicalHazardClass : ℕ
  preservativeTreatment : Bool

def moistureAsServiceClass (d : DurabilityConditions) : ℕ :=
  if d.moistureContent ≤ 0.12 then 1 else if d.moistureContent ≤ 0.20 then 2 else 3

structure DurabilityEvidence (d : DurabilityConditions) where
  moistureContentClosed : d.moistureContent ≥ 0
  temperatureRangeClosed : d.temperatureRange.1 < d.temperatureRange.2
  biologicalHazardClassClosed : d.biologicalHazardClass ≥ 1 ∧ d.biologicalHazardClass ≤ 5

def DurabilityClosed (d : DurabilityConditions) : Prop :=
  d.moistureContent ≥ 0 ∧ d.temperatureRange.1 < d.temperatureRange.2 ∧
  d.biologicalHazardClass ≥ 1 ∧ d.biologicalHazardClass ≤ 5

theorem durability_closed_from_evidence (d : DurabilityConditions) (E : DurabilityEvidence d) : DurabilityClosed d :=
  And.intro E.moistureContentClosed (And.intro E.temperatureRangeClosed E.biologicalHazardClassClosed)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse