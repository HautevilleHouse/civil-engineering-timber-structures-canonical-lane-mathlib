import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure ServiceabilityCriteria where
  deflectionLimit : ℝ
  vibrationLimit : ℝ
  creepFactor : ℝ
  moistureSeviceClass : ℕ

def deflectionSatisfied (s : ServiceabilityCriteria) (appliedLoad : ℝ) (span : ℝ) (E : ℝ) (I : ℝ) : Prop :=
  (5 * appliedLoad * span^4) / (384 * E * I) ≤ s.deflectionLimit

structure ServiceabilityEvidence (s : ServiceabilityCriteria) where
  deflectionLimitClosed : s.deflectionLimit > 0
  vibrationLimitClosed : s.vibrationLimit > 0
  creepFactorClosed : s.creepFactor ≥ 0
  moistureSeviceClassClosed : s.moistureSeviceClass ∈ {1,2,3}

def ServiceabilityClosed (s : ServiceabilityCriteria) : Prop :=
  s.deflectionLimit > 0 ∧ s.vibrationLimit > 0 ∧ s.creepFactor ≥ 0 ∧ s.moistureSeviceClass ∈ {1,2,3}

theorem serviceability_closed_from_evidence (s : ServiceabilityCriteria) (E : ServiceabilityEvidence s) : ServiceabilityClosed s :=
  And.intro E.deflectionLimitClosed (And.intro E.vibrationLimitClosed (And.intro E.creepFactorClosed E.moistureSeviceClassClosed))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse