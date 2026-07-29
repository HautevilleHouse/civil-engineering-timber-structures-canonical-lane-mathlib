import civilEngineeringTimberStructuresCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse