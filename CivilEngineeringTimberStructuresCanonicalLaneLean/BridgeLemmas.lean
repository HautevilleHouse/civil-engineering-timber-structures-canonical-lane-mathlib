import civilEngineeringTimberStructuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  TimberWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse