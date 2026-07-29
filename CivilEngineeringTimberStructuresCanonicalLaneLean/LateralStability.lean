import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure LateralStabilityParameters where
  effectiveLength : ℝ
  torsionConstant : ℝ
  warpingConstant : ℝ
  bendingStiffness : ℝ
  lateralLoad : ℝ

def criticalBucklingMoment (l : LateralStabilityParameters) : ℝ :=
  (π/l.effectiveLength) * Real.sqrt (l.bendingStiffness * l.torsionConstant * (1 + (π^2 * l.warpingConstant)/(l.effectiveLength^2 * l.torsionConstant)))

structure LateralStabilityEvidence (l : LateralStabilityParameters) where
  effectiveLengthClosed : l.effectiveLength > 0
  torsionConstantClosed : l.torsionConstant > 0
  warpingConstantClosed : l.warpingConstant > 0
  bendingStiffnessClosed : l.bendingStiffness > 0
  lateralLoadClosed : l.lateralLoad > 0

def LateralStabilityClosed (l : LateralStabilityParameters) : Prop :=
  l.effectiveLength > 0 ∧ l.torsionConstant > 0 ∧ l.warpingConstant > 0 ∧
  l.bendingStiffness > 0 ∧ l.lateralLoad > 0

theorem lateral_stability_closed_from_evidence (l : LateralStabilityParameters) (E : LateralStabilityEvidence l) : LateralStabilityClosed l :=
  And.intro E.effectiveLengthClosed (And.intro E.torsionConstantClosed (And.intro E.warpingConstantClosed (And.intro E.bendingStiffnessClosed E.lateralLoadClosed)))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse