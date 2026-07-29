import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure JordanAlgebra (A : Type) where
  mul : A → A → A
  commutative : ∀ x y : A, mul x y = mul y x
  jordanIdentity : ∀ x y : A, mul (mul x y) (mul x x) = mul x (mul y (mul x x))

structure DivisionAlgebra (A : Type) where
  jordan : JordanAlgebra A
  unit : A
  invertible : ∀ x : A, x ≠ unit → ∃ y : A, jordan.mul x y = unit ∧ jordan.mul y x = unit

def JordanAlgebraClosed (J : JordanAlgebra A) : Prop :=
  J.commutative ∧ J.jordanIdentity

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse