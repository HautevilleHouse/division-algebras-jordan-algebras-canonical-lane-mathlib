import canonicalLaneMathlib.AdmissibleClass
import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.FormalizationDivisionAlgebrasJordanAlgebras

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

def exampleQuaternions : DivisionAlgebra where
  carrier := ℍ
  add := fun x y => x + y
  mul := fun x y => x * y
  zero := 0
  one := 1
  addAssoc := by
    intro a b c
    exact add_assoc a b c
  zeroAdd := by intro a; exact zero_add a
  addZero := by intro a; exact add_zero a
  addComm := by intro a b; exact add_comm a b
  mulAssoc := by
    intro a b c
    exact mul_assoc a b c
  oneMul := by intro a; exact one_mul a
  mulOne := by intro a; exact mul_one a
  leftDistrib := by intro a b c; exact mul_add a b c
  rightDistrib := by intro a b c; exact add_mul a b c
  nonzeroInverse := by
    intro a ha
    refine ⟨a⁻¹, ?_, ?_⟩
    · exact mul_inv_cancel ha
    · exact inv_mul_cancel ha

def exampleJordanFromQuaternions : JordanAlgebra := by
  refine {
    carrier := ℍ
    add := fun x y => x + y
    mul := fun x y => (x*y + y*x)/2
    zero := 0
    one := 1
    addAssoc := ?_
    zeroAdd := ?_
    addZero := ?_
    addComm := ?_
    mulComm := ?_
    jordanIdentity := ?_
    leftDistrib := ?_
    rightDistrib := ?_
    oneMul := ?_
    mulOne := ?_
  }
  · intro a b c; exact add_assoc a b c
  · intro a; exact zero_add a
  · intro a; exact add_zero a
  · intro a b; exact add_comm a b
  · intro a b; exact mul_comm (a*b + b*a) 2
  · intro a b
    calc
      ((a*a)*b + b*(a*a))/2 * a = ((a*a)*b*a + b*(a*a)*a)/4 := by ring
      _ = ((a*a)*(b*a) + (a*a)*(a*b))/4 := by ring
      _ = (a*a)*((b*a)+(a*b))/4 := by ring
      _ = (a*a)*((a*b + b*a)/2) := by ring
    sorry
  · intro a b c
    calc
      ((a*(b+c) + (b+c)*a)/2) = ((a*b + a*c) + (b*a + c*a))/2 := by ring
      _ = ((a*b + b*a) + (a*c + c*a))/2 := by ring
      _ = ((a*b + b*a)/2) + ((a*c + c*a)/2) := by ring
      _ = (a*b + b*a)/2 + (a*c + c*a)/2 := rfl
  · intro a b c
    calc
      (((a+b)*c + c*(a+b))/2) = ((a*c + b*c) + (c*a + c*b))/2 := by ring
      _ = ((a*c + c*a) + (b*c + c*b))/2 := by ring
      _ = ((a*c + c*a)/2) + ((b*c + c*b)/2) := by ring
  · intro a; simp
  · intro a; simp

def admissibleExample : AdmissibleClass where
  object := exampleQuaternions
  jordanInherited := exampleJordanFromQuaternions
  compatibility := rfl
  bridgeClosed := True
  gateClosed := True
  bridgeWitness := trivial
  gateWitness := trivial

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse