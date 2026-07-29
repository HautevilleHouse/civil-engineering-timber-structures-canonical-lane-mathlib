import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure ConnectionStrength where
  dowelDiameter : ℝ
  timberThickness : ℝ
  characteristicYieldMoment : ℝ
  characteristicEmbedStrength : ℝ
  meanDensity : ℝ
  numberOfShearPlanes : ℕ

def lateralStrengthPerShearPlane (c : ConnectionStrength) : ℝ :=
  c.characteristicYieldMoment * c.timberThickness / 4  -- placeholder

structure ConnectionEvidence (c : ConnectionStrength) where
  dowelDiameterClosed : c.dowelDiameter > 0
  timberThicknessClosed : c.timberThickness > 0
  characteristicYieldMomentClosed : c.characteristicYieldMoment > 0
  characteristicEmbedStrengthClosed : c.characteristicEmbedStrength > 0
  numberOfShearPlanesClosed : c.numberOfShearPlanes ≥ 1

def ConnectionStrengthClosed (c : ConnectionStrength) : Prop :=
  c.dowelDiameter > 0 ∧ c.timberThickness > 0 ∧ c.characteristicYieldMoment > 0 ∧
  c.characteristicEmbedStrength > 0 ∧ c.numberOfShearPlanes ≥ 1

theorem connection_strength_closed_from_evidence (c : ConnectionStrength) (E : ConnectionEvidence c) : ConnectionStrengthClosed c :=
  And.intro E.dowelDiameterClosed (And.intro E.timberThicknessClosed (And.intro E.characteristicYieldMomentClosed (And.intro E.characteristicEmbedStrengthClosed E.numberOfShearPlanesClosed)))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse