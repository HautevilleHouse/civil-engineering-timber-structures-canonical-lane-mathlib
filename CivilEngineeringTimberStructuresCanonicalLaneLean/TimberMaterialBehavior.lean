import CivilEngineeringTimberStructuresCanonicalLaneLean.AdmissibleClass

/-!
# Timber Material Behavior Package
-/

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberMaterialPackage where
  orthotropicElasticity : Prop
  moistureDependentStrength : Prop
  creepAndDurationOfLoad : Prop
  knotsAndSlopeOfGrain : Prop

structure TimberMaterialEvidence (M : TimberMaterialPackage) where
  orthotropicElasticityClosed : M.orthotropicElasticity
  moistureDependentStrengthClosed : M.moistureDependentStrength
  creepAndDurationOfLoadClosed : M.creepAndDurationOfLoad
  knotsAndSlopeOfGrainClosed : M.knotsAndSlopeOfGrain

def TimberMaterialClosed (M : TimberMaterialPackage) : Prop :=
  M.orthotropicElasticity ∧ M.moistureDependentStrength ∧ M.creepAndDurationOfLoad ∧ M.knotsAndSlopeOfGrain

theorem timber_material_closed_from_evidence (M : TimberMaterialPackage) (E : TimberMaterialEvidence M) : TimberMaterialClosed M := by
  exact And.intro E.orthotropicElasticityClosed (And.intro E.moistureDependentStrengthClosed (And.intro E.creepAndDurationOfLoadClosed E.knotsAndSlopeOfGrainClosed))

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse
