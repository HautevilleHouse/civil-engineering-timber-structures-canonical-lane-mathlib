import HautevilleHouse.CivilEngineeringTimberStructuresCanonicalLaneLean.TimberPerelmanEntropy

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure NoncollapsingPackage {G : TimberCurvaturePackage}
    {F : TimberRicciFlowPDEPackage G} (Epkg : TimberPerelmanEntropyPackage F) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {G : TimberCurvaturePackage}
    {F : TimberRicciFlowPDEPackage G} {Epkg : TimberPerelmanEntropyPackage F} (N : NoncollapsingPackage Epkg) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {G : TimberCurvaturePackage}
    {F : TimberRicciFlowPDEPackage G} {Epkg : TimberPerelmanEntropyPackage F} (N : NoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : TimberCurvaturePackage} {F : TimberRicciFlowPDEPackage G}
    {Epkg : TimberPerelmanEntropyPackage F}
    (N : NoncollapsingPackage Epkg) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse