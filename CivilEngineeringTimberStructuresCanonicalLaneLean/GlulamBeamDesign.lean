import HautevilleHouse.CivilEngineeringTimberStructuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure GlulamBeamDesign where
  beamWidth : Float
  beamDepth : Float
  span : Float
  load : Float
  bendingCapacity : Float
  shearCapacity : Float
  designCheckOK : Prop

structure GlulamBeamEvidence (D : GlulamBeamDesign) where
  bendingCheckClosed : D.bendingCapacity ≥ D.load * D.span / 8.0
  shearCheckClosed : D.shearCapacity ≥ D.load * 0.5
  designCheckOKClosed : D.designCheckOK

def GlulamBeamDesignClosed (D : GlulamBeamDesign) : Prop :=
  D.bendingCapacity ≥ D.load * D.span / 8.0 ∧
  D.shearCapacity ≥ D.load * 0.5 ∧
  D.designCheckOK

theorem glulam_beam_design_closed_from_evidence
    (D : GlulamBeamDesign) (E : GlulamBeamEvidence D) :
    GlulamBeamDesignClosed D := by
  exact And.intro E.bendingCheckClosed
    (And.intro E.shearCheckClosed E.designCheckOKClosed)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse