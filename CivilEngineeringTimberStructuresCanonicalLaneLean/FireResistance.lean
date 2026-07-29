import CivilEngineeringTimberStructuresCanonicalLaneLean.LateralStability

/-!
# Fire Resistance Package
-/

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure FireResistancePackage {M : TimberMaterialPackage} {C : ConnectionDesignPackage M} {L : LateralStabilityPackage C} where
  charringRate : Prop
  residualStrength : Prop
  connectorFireRating : Prop
  compartmentBoundary : Prop

structure FireResistanceEvidence {M : TimberMaterialPackage} {C : ConnectionDesignPackage M} {L : LateralStabilityPackage C} (F : FireResistancePackage L) where
  charringRateClosed : F.charringRate
  residualStrengthClosed : F.residualStrength
  connectorFireRatingClosed : F.connectorFireRating
  compartmentBoundaryClosed : F.compartmentBoundary

def FireResistanceClosed {M : TimberMaterialPackage} {C : ConnectionDesignPackage M} {L : LateralStabilityPackage C} (F : FireResistancePackage L) : Prop :=
  F.charringRate ∧ F.residualStrength ∧ F.connectorFireRating ∧ F.compartmentBoundary

theorem fire_resistance_closed_from_evidence {M : TimberMaterialPackage} {C : ConnectionDesignPackage M} {L : LateralStabilityPackage C} (F : FireResistancePackage L) (E : FireResistanceEvidence F) : FireResistanceClosed F := by
  exact And.intro E.charringRateClosed (And.intro E.residualStrengthClosed (And.intro E.connectorFireRatingClosed E.compartmentBoundaryClosed))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse
