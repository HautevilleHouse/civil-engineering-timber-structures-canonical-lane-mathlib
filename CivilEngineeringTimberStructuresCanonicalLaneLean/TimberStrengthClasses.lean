import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberStrengthClass where
  species : String
  grade : String
  characteristicStrength : ℝ
  meanElasticModulus : ℝ
  density : ℝ
  strengthClassCode : String
  bendingStrength : ℝ
  tensionParallelStrength : ℝ
  compressionParallelStrength : ℝ
  shearStrength : ℝ
  bearingStrengthPerp : ℝ

def bendingStrengthValid (t : TimberStrengthClass) : Prop :=
  t.characteristicStrength > 0 ∧ t.bendingStrength > 0

structure TimbergStrengthEvidence (t : TimberStrengthClass) where
  bendingStrengthClosed : t.bendingStrength > 0
  tensionParallelStrengthClosed : t.tensionParallelStrength > 0
  compressionParallelStrengthClosed : t.compressionParallelStrength > 0
  shearStrengthClosed : t.shearStrength > 0
  bearingStrengthPerpClosed : t.bearingStrengthPerp > 0

def TimberStrengthClassClosed (t : TimberStrengthClass) : Prop :=
  t.bendingStrength > 0 ∧ t.tensionParallelStrength > 0 ∧
  t.compressionParallelStrength > 0 ∧ t.shearStrength > 0 ∧
  t.bearingStrengthPerp > 0

theorem timber_strength_class_closed_from_evidence (t : TimberStrengthClass) (E : TimbergStrengthEvidence t) : TimberStrengthClassClosed t :=
  And.intro E.bendingStrengthClosed (And.intro E.tensionParallelStrengthClosed (And.intro E.compressionParallelStrengthClosed (And.intro E.shearStrengthClosed E.bearingStrengthPerpClosed)))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse