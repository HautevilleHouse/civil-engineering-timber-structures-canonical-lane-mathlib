import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberAdmittedObject where
  timberType : String
  stressGrade : String
  serviceClass : Nat
  moistureContent : Rat
  conclusion : designCheckPassed
  designCheckPassed : Prop

structure AdmissibleClass where
  object : TimberAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TimberDesignCheckClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def TimberDesignCheckClosed (O : TimberAdmittedObject) : Prop :=
  O.designCheckPassed

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse