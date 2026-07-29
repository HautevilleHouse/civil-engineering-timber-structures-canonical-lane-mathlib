import HautevilleHouse.CivilEngineeringTimberStructuresCanonicalLaneLean.TimberPerelmanAnalyticProof

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure LoadPathAnalyticEvidenceTerms {G : TimberCurvaturePackage}
    (C : LoadPathAnalyticCertificate G) where
  loadCombinationClosed : C.loadCombinationClosed
  stressDistributionClosed : C.stressDistributionClosed
  deflectionCriteriaClosed : C.deflectionCriteriaClosed
  stabilityCheckClosed : C.stabilityCheckClosed
  connectionCapacityClosed : C.connectionCapacityClosed

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse