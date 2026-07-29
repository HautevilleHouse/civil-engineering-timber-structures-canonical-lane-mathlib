import civilEngineeringTimberStructuresCanonicalLaneLean.TimberLateralSys

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberMoistureDurabilityPackage {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    (Lv : TimberLateralSysEvidence L) where
  moistureContent : Prop
  decayProtection : Prop
  fungalResistance : Prop
  dimensionalStability : Prop

structure TimberMoistureDurabilityEvidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} (M : TimberMoistureDurabilityPackage Lv) where
  moistureContentClosed : M.moistureContent
  decayProtectionClosed : M.decayProtection
  fungalResistanceClosed : M.fungalResistance
  dimensionalStabilityClosed : M.dimensionalStability

def TimberMoistureDurabilityClosed {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} (M : TimberMoistureDurabilityPackage Lv) : Prop :=
  M.moistureContent ∧ M.decayProtection ∧ M.fungalResistance ∧ M.dimensionalStability

theorem timber_moisture_durability_closed_from_evidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} {L : TimberLateralSysPackage Con}
    {Lv : TimberLateralSysEvidence L} (M : TimberMoistureDurabilityPackage Lv)
    (Ev : TimberMoistureDurabilityEvidence M) : TimberMoistureDurabilityClosed M := by
  exact And.intro Ev.moistureContentClosed (And.intro Ev.decayProtectionClosed
    (And.intro Ev.fungalResistanceClosed Ev.dimensionalStabilityClosed))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse