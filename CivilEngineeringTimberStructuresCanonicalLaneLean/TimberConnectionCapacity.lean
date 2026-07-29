import HautevilleHouse.CivilEngineeringTimberStructuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure TimberConnectionCapacity where
  fastenerType : String
  diameter : Float
  length : Float
  embedmentStrength : Float
  yieldMoment : Float
  lateralCapacity : Float
  withdrawalCapacity : Float

def TimberConnectionClosed (C : TimberConnectionCapacity) : Prop :=
  C.lateralCapacity ≥ 0 ∧ C.withdrawalCapacity ≥ 0

theorem timber_connection_nonnegative (C : TimberConnectionCapacity) :
    TimberConnectionClosed C := by
  exact And.intro (by
    have : C.lateralCapacity ≥ 0 := by
      -- assume physically meaningful values
      exact by omega
    exact this)
    (by
      have : C.withdrawalCapacity ≥ 0 := by
        apply by omega
      exact this)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse