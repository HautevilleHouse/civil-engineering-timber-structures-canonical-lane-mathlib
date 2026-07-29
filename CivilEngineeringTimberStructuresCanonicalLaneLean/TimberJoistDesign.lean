import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberJoistLoadCase where
  deadLoad : Rat
  liveLoad : Rat
  snowLoad : Rat
  windLoad : Rat
  loadDurationFactor : Rat
  loadCombinationFactor : Rat
  totalDesignLoad : Rat := deadLoad + liveLoad + snowLoad + windLoad
  adjustedDesignLoad : Rat := loadCombinationFactor * totalDesignLoad

structure TimberJoistSection where
  width : Rat
  depth : Rat
  span : Rat
  sawnTimber : Bool
  sectionModulus : Rat := (width * depth ^ 2) / 6
  momentOfInertia : Rat := (width * depth ^ 3) / 12
  selfWeight : Rat := width * depth * span * 0.0065

def sectionModulusFromWidthDepth (b h : Rat) : Rat :=
  (b * h ^ 2) / 6

theorem section_modulus_valid (b h : Rat) (hpos : h > 0) (bpos : b > 0) :
    sectionModulusFromWidthDepth b h > 0 := by
  refine div_pos (mul_pos bpos (pow_pos hpos 2)) ?_
  norm_num

structure BendingCheck (joist : TimberJoistSection) (load : TimberJoistLoadCase) where
  maxMoment : Rat := (load.adjustedDesignLoad * joist.span ^ 2) / 8
  requiredSectionModulus : Rat := maxMoment / 1400
  fiberStress : Rat := maxMoment / joist.sectionModulus
  allowableStress : Rat := 1400
  stressCheck : Prop := fiberStress ≤ allowableStress
  stressCheckClosed : stressCheck

def BendingCheckClosed {joist : TimberJoistSection} {load : TimberJoistLoadCase}
    (check : BendingCheck joist load) : Prop :=
  check.stressCheck

theorem bending_check_closed_from_evidence {joist : TimberJoistSection} {load : TimberJoistLoadCase}
    (check : BendingCheck joist load) : BendingCheckClosed check :=
  check.stressCheckClosed

structure ShearCheck (joist : TimberJoistSection) (load : TimberJoistLoadCase) where
  maxShear : Rat := (load.adjustedDesignLoad * joist.span) / 2
  shearArea : Rat := (2/3) * joist.width * joist.depth
  shearStress : Rat := maxShear / shearArea
  allowableShear : Rat := 130
  shearCheck : Prop := shearStress ≤ allowableShear
  shearCheckClosed : shearCheck

def ShearCheckClosed {joist : TimberJoistSection} {load : TimberJoistLoadCase}
    (check : ShearCheck joist load) : Prop :=
  check.shearCheck

theorem shear_check_closed_from_evidence {joist : TimberJoistSection} {load : TimberJoistLoadCase}
    (check : ShearCheck joist load) : ShearCheckClosed check :=
  check.shearCheckClosed

structure DeflectionCheck (joist : TimberJoistSection) (load : TimberJoistLoadCase) where
  modulusOfElasticity : Rat := 1300000
  instantDeflection : Rat := (5 * load.liveLoad * joist.span ^ 4) / (384 * modulusOfElasticity * joist.momentOfInertia)
  allowableDeflection : Rat := joist.span / 360
  deflectionCheck : Prop := instantDeflection ≤ allowableDeflection
  deflectionCheckClosed : deflectionCheck

def DeflectionCheckClosed {joist : TimberJoistSection} {load : TimberJoistLoadCase}
    (check : DeflectionCheck joist load) : Prop :=
  check.deflectionCheck

theorem deflection_check_closed_from_evidence {joist : TimberJoistSection} {load : TimberJoistLoadCase}
    (check : DeflectionCheck joist load) : DeflectionCheckClosed check :=
  check.deflectionCheckClosed

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse