import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  timberConstrainedStatement : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "civil-engineering-timber-structures-canonical-lane",
  theoremName := "Timber Structures Ultimate and Serviceability Limit State Closure",
  theoremObject := "TimberAdmittedObject with ultimateLimitState and serviceabilityLimitState",
  classicalBoundary := "Material and load partial factors; load-duration effects; moisture content adjustments",
  timberConstrainedStatement := "manifold-constrained theorem certificate internalized through admissible class, bridge, gate, and classical boundary",
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse