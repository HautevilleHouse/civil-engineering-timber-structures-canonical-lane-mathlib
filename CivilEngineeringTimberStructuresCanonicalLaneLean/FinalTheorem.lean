import civilEngineeringTimberStructuresCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

def ConstrainedTimberClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_timber_endgame (A : AdmissibleClass) :
    ConstrainedTimberClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse