import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure BeamDesign where
  width : ℝ
  depth : ℝ
  span : ℝ
  uniformLoad : ℝ
  characteristicStrength : ℝ
  modulusOfElasticity : ℝ

def bendingMoment (b : BeamDesign) : ℝ := b.uniformLoad * (b.span)^2 / 8
def shearForce (b : BeamDesign) : ℝ := b.uniformLoad * b.span / 2
def sectionModulus (b : BeamDesign) : ℝ := b.width * (b.depth)^2 / 6
def bendingStress (b : BeamDesign) : ℝ := bendingMoment b / sectionModulus b
def shearStress (b : BeamDesign) : ℝ := (3 * shearForce b) / (2 * b.width * b.depth)

structure BeamEvidence (b : BeamDesign) where
  widthClosed : b.width > 0
  depthClosed : b.depth > 0
  spanClosed : b.span > 0
  uniformLoadClosed : b.uniformLoad > 0
  characteristicStrengthClosed : b.characteristicStrength > 0
  modulusOfElasticityClosed : b.modulusOfElasticity > 0

def BeamDesignClosed (b : BeamDesign) : Prop :=
  b.width > 0 ∧ b.depth > 0 ∧ b.span > 0 ∧ b.uniformLoad > 0 ∧
  b.characteristicStrength > 0 ∧ b.modulusOfElasticity > 0

theorem beam_design_closed_from_evidence (b : BeamDesign) (E : BeamEvidence b) : BeamDesignClosed b :=
  And.intro E.widthClosed (And.intro E.depthClosed (And.intro E.spanClosed (And.intro E.uniformLoadClosed (And.intro E.characteristicStrengthClosed E.modulusOfElasticityClosed))))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse