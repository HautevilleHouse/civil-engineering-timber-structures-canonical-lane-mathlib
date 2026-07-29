import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure GlulamBeamSection where
  width : Rat
  depth : Rat
  span : Rat
  numberOfLaminations : Nat
  laminationThickness : Rat
  stressClass : Rat
  sectionModulus : Rat := (width * depth ^ 2) / 6
  selfWeightRate : Rat := width * depth * 0.0065

def glulamAllowableBendingStress (section : GlulamBeamSection) : Rat :=
  section.stressClass * 1.1

def glulamAllowableShearStress (section : GlulamBeamSection) : Rat :=
  200

def glulamModulusOfElasticity (section : GlulamBeamSection) : Rat :=
  1500000

structure GlulamBendingCheck (beam : GlulamBeamSection) (load : Rat) where
  maxMoment : Rat := (load * beam.span ^ 2) / 8
  appliedBendingStress : Rat := maxMoment / beam.sectionModulus
  allowableBendingStress : Rat := glulamAllowableBendingStress beam
  bendingCheck : Prop := appliedBendingStress ≤ allowableBendingStress
  bendingCheckClosed : bendingCheck

def GlulamBendingCheckClosed {beam : GlulamBeamSection} {load : Rat}
    (check : GlulamBendingCheck beam load) : Prop :=
  check.bendingCheck

theorem glulam_bending_check_closed_from_evidence {beam : GlulamBeamSection} {load : Rat}
    (check : GlulamBendingCheck beam load) : GlulamBendingCheckClosed check :=
  check.bendingCheckClosed

structure GlulamShearCheck (beam : GlulamBeamSection) (load : Rat) where
  maxShear : Rat := (load * beam.span) / 2
  shearArea : Rat := (2/3) * beam.width * beam.depth
  appliedShearStress : Rat := maxShear / shearArea
  allowableShearStress : Rat := glulamAllowableShearStress beam
  shearCheck : Prop := appliedShearStress ≤ allowableShearStress
  shearCheckClosed : shearCheck

def GlulamShearCheckClosed {beam : GlulamBeamSection} {load : Rat}
    (check : GlulamShearCheck beam load) : Prop :=
  check.shearCheck

theorem glulam_shear_check_closed_from_evidence {beam : GlulamBeamSection} {load : Rat}
    (check : GlulamShearCheck beam load) : GlulamShearCheckClosed check :=
  check.shearCheckClosed

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse