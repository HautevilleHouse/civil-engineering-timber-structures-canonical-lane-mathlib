import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure TimberAdmittedObject where
  space : TimberSpace
  glueLaminatedBeam : Prop
  momentConnection : Prop
  loadPathModel : Prop
  conclusion : loadPathModel

structure TimberEndgameState where
  object : TimberAdmittedObject

def TimberWitnessClosed (O : TimberAdmittedObject) : Prop :=
  O.loadPathModel

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse