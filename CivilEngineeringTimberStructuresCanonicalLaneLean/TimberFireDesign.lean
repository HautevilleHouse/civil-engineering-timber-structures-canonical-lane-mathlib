import civilEngineeringTimberStructuresCanonicalLaneLean.TimberMoistureDurability

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberFireDesignPackage {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} {M : TimberMoistureDurabilityPackage Lv}
    (Mv : TimberMoistureDurabilityEvidence M) where
  charringRate : Prop
  residualCapacity : Prop
  fireSeparation : Prop
  sprinklerIntegration : Prop

structure TimberFireDesignEvidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} {M : TimberMoistureDurabilityPackage Lv}
    {Mv : TimberMoistureDurabilityEvidence M} (F : TimberFireDesignPackage Mv) where
  charringRateClosed : F.charringRate
  residualCapacityClosed : F.residualCapacity
  fireSeparationClosed : F.fireSeparation
  sprinklerIntegrationClosed : F.sprinklerIntegration

def TimberFireDesignClosed {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} {M : TimberMoistureDurabilityPackage Lv}
    {Mv : TimberMoistureDurabilityEvidence M} (F : TimberFireDesignPackage Mv) : Prop :=
  F.charringRate ∧ F.residualCapacity ∧ F.fireSeparation ∧ F.sprinklerIntegration

theorem timber_fire_design_closed_from_evidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} {M : TimberMoistureDurabilityPackage Lv}
    {Mv : TimberMoistureDurabilityEvidence M} (F : TimberFireDesignPackage Mv)
    (Ev : TimberFireDesignEvidence F) : TimberFireDesignClosed F := by
  exact And.intro Ev.charringRateClosed (And.intro Ev.residualCapacityClosed
    (And.intro Ev.fireSeparationClosed Ev.sprinklerIntegrationClosed))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse