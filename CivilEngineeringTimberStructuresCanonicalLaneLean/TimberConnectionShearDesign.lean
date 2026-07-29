import civilEngineeringTimberStructuresCanonicalLaneLean.TimberBeamDesign

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberConnectionPackage {P : TimberBeamDesignPackage}
    (E : TimberBeamDesignEvidence P) where
  fastenerType : Type u
  shearStrength : Prop
  slipModulus : Prop
  embedmentCapacity : Prop

structure TimberConnectionEvidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} (C : TimberConnectionPackage E) where
  shearStrengthClosed : C.shearStrength
  slipModulusClosed : C.slipModulus
  embedmentCapacityClosed : C.embedmentCapacity

def TimberConnectionClosed {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} (C : TimberConnectionPackage E) : Prop :=
  C.shearStrength ∧ C.slipModulus ∧ C.embedmentCapacity

theorem timber_connection_closed_from_evidence {P : TimberBeamDesignPackage}
    {E : TimberBeamDesignEvidence P} (C : TimberConnectionPackage E)
    (Ev : TimberConnectionEvidence C) : TimberConnectionClosed C := by
  exact And.intro Ev.shearStrengthClosed (And.intro Ev.slipModulusClosed Ev.embedmentCapacityClosed)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse