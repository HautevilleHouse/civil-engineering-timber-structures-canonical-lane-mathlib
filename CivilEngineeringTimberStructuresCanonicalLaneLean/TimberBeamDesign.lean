import civilEngineeringTimberStructuresCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberBeamDesignPackage where
  span : ℝ
  crossSection : Type u
  bendingCapacity : Prop
  deflectionLimit : Prop
  fireResistance : Prop

structure TimberBeamDesignEvidence (P : TimberBeamDesignPackage) where
  bendingCapacityClosed : P.bendingCapacity
  deflectionLimitClosed : P.deflectionLimit
  fireResistanceClosed : P.fireResistance

def TimberBeamDesignClosed (P : TimberBeamDesignPackage) : Prop :=
  P.bendingCapacity ∧ P.deflectionLimit ∧ P.fireResistance

theorem timber_beam_design_closed_from_evidence (P : TimberBeamDesignPackage)
    (E : TimberBeamDesignEvidence P) : TimberBeamDesignClosed P := by
  exact And.intro E.bendingCapacityClosed (And.intro E.deflectionLimitClosed E.fireResistanceClosed)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse