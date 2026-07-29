import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringTimberStructuresCanonicalLaneLean

structure BoltConnection where
  boltDiameter : Rat
  boltCount : Nat
  timberThickness : Rat
  dowelBearingStrength : Rat
  boltYieldStrength : Rat

def boltShearCapacity (conn : BoltConnection) : Rat :=
  (Nat.cast conn.boltCount : Rat) * (conn.boltDiameter ^ 2) * conn.boltYieldStrength * 0.65 / 4

def boltBearingCapacity (conn : BoltConnection) : Rat :=
  conn.dowelBearingStrength * conn.boltDiameter * conn.timberThickness * (Nat.cast conn.boltCount : Rat)

theorem bolt_capacity_nonneg (conn : BoltConnection) :
    boltShearCapacity conn ≥ 0 ∧ boltBearingCapacity conn ≥ 0 := by
  constructor
  · apply div_nonneg ?_ (by norm_num)
    nlinarith? [Nat.cast_nonneg conn.boltCount, pow_two_nonneg conn.boltDiameter]
    sorry
  · apply mul_nonneg (mul_nonneg ?_ (by positivity)) (Nat.cast_nonneg _)
    apply mul_nonneg (by positivity) conn.boltDiameter
  sorry

structure NailConnection where
  nailDiameter : Rat
  nailLength : Rat
  nailCount : Nat
  timberDensity : Rat
  nailYieldStrength : Rat
  nailSpacing : Rat
  edgeDistance : Rat

def nailLateralCapacity (conn : NailConnection) : Rat :=
  (Nat.cast conn.nailCount : Rat) * (conn.nailDiameter ^ 2) * conn.nailYieldStrength * 0.45 / 4

def nailWithdrawalCapacity (conn : NailConnection) : Rat :=
  (Nat.cast conn.nailCount : Rat) * conn.nailLength * conn.timberDensity * 0.1

theorem nail_capacity_nonneg (conn : NailConnection) :
    nailLateralCapacity conn ≥ 0 ∧ nailWithdrawalCapacity conn ≥ 0 := by
  constructor
  · apply div_nonneg ?_ (by norm_num)
    nlinarith [Nat.cast_nonneg conn.nailCount, sq_nonneg conn.nailDiameter]
  · apply mul_nonneg (Nat.cast_nonneg _) (by positivity)

end CivilEngineeringTimberStructuresCanonicalLaneLean
end HautevilleHouse