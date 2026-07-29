import civilEngineeringTimberStructuresCanonicalLaneLean.FinalTheorem
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TimberSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure TimberAdmittedObject where
  space : TimberSpace
  loadBearingStructure : Prop
  codeCompliance : Prop
  jointModel : Type
  connectionValid : Prop
  conclusion : connectionValid

def TimberWitnessClosed (O : TimberAdmittedObject) : Prop :=
  O.connectionValid

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse