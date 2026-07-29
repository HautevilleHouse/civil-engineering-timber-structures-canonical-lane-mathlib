import civilEngineeringTimberStructuresCanonicalLaneLean.TimberConnectionShearDesign

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberLateralSysPackage {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    (Con : TimberConnectionEvidence C) where
  shearWalls : Prop
  diaphragmAction : Prop
  seismicPerformance : Prop
  windResistance : Prop

structure TimberLateralSysEvidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} (L : TimberLateralSysPackage Con) where
  shearWallsClosed : L.shearWalls
  diaphragmActionClosed : L.diaphragmAction
  seismicPerformanceClosed : L.seismicPerformance
  windResistanceClosed : L.windResistance

def TimberLateralSysClosed {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} (L : TimberLateralSysPackage Con) : Prop :=
  L.shearWalls ∧ L.diaphragmAction ∧ L.seismicPerformance ∧ L.windResistance

theorem timber_lateral_sys_closed_from_evidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} {C : TimberConnectionPackage E}
    {Con : TimberConnectionEvidence C} (L : TimberLateralSysPackage Con)
    (Ev : TimberLateralSysEvidence L) : TimberLateralSysClosed L := by
  exact And.intro Ev.shearWallsClosed (And.intro Ev.diaphragmActionClosed
    (And.intro Ev.seismicPerformanceClosed Ev.windResistanceClosed))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse