import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure SpinFactor (V : Type) [InnerProductSpace ℝ V] where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  smul : ℝ → carrier → carrier
  jordanAlgebra : JordanAlgebra ℝ
  unit : carrier
  unitNorm : inner ' unit unit = 1
  idempotent : ∀ a : carrier, mul a a = a
  jordanIdentity : ∀ x y : carrier, (x * y) * (x * x) = x * (y * (x * x))
  addAssoc : ∀ a b c : carrier, a + b + c = a + (b + c)
  addComm : ∀ a b : carrier, a + b = b + a
  mulComm : ∀ a b : carrier, a * b = b * a
  distribLeft : ∀ a b c : carrier, a * (b + c) = a * b + a * c
  distribRight : ∀ a b c : carrier, (a + b) * c = a * c + b * c
  zero : carrier
  zeroAdd : ∀ a : carrier, zero + a = a
  addZero : ∀ a : carrier, a + zero = a
  one : carrier
  oneMul : ∀ a : carrier, one * a = a
  mulOne : ∀ a : carrier, a * one = a

structure SpinFactorEvidence (V : Type) [InnerProductSpace ℝ V] (S : SpinFactor V) where
  unitNormClosed : inner ' S.unit S.unit = 1
  idempotentClosed : ∀ a : S.carrier, S.mul a a = a
  jordanIdentityClosed : ∀ x y : S.carrier, (S.mul x y) * (S.mul x x) = S.mul x (S.mul y (S.mul x x))
  addAssocClosed : ∀ a b c : S.carrier, S.add (S.add a b) c = S.add a (S.add b c)
  addCommClosed : ∀ a b : S.carrier, S.add a b = S.add b a
  mulCommClosed : ∀ a b : S.carrier, S.mul a b = S.mul b a
  distribLeftClosed : ∀ a b c : S.carrier, S.mul a (S.add b c) = S.add (S.mul a b) (S.mul a c)
  distribRightClosed : ∀ a b c : S.carrier, S.mul (S.add a b) c = S.add (S.mul a c) (S.mul b c)
  zeroAddClosed : ∀ a : S.carrier, S.add S.zero a = a
  addZeroClosed : ∀ a : S.carrier, S.add a S.zero = a
  oneMulClosed : ∀ a : S.carrier, S.mul S.one a = a
  mulOneClosed : ∀ a : S.carrier, S.mul a S.one = a

def SpinFactorClosed (V : Type) [InnerProductSpace ℝ V] (S : SpinFactor V) : Prop :=
  (inner ' S.unit S.unit = 1) ∧
  (∀ a : S.carrier, S.mul a a = a) ∧
  (∀ x y : S.carrier, (S.mul x y) * (S.mul x x) = S.mul x (S.mul y (S.mul x x))) ∧
  (∀ a b c : S.carrier, S.add (S.add a b) c = S.add a (S.add b c)) ∧
  (∀ a b : S.carrier, S.add a b = S.add b a) ∧
  (∀ a b : S.carrier, S.mul a b = S.mul b a) ∧
  (∀ a b c : S.carrier, S.mul a (S.add b c) = S.add (S.mul a b) (S.mul a c)) ∧
  (∀ a b c : S.carrier, S.mul (S.add a b) c = S.add (S.mul a c) (S.mul b c)) ∧
  (∀ a : S.carrier, S.add S.zero a = a) ∧
  (∀ a : S.carrier, S.add a S.zero = a) ∧
  (∀ a : S.carrier, S.mul S.one a = a) ∧
  (∀ a : S.carrier, S.mul a S.one = a)

theorem spin_factor_closed_from_evidence (V : Type) [InnerProductSpace ℝ V] (S : SpinFactor V) (E : SpinFactorEvidence V S) : SpinFactorClosed V S :=
  And.intro E.unitNormClosed (And.intro E.idempotentClosed (And.intro E.jordanIdentityClosed (And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.mulCommClosed (And.intro E.distribLeftClosed (And.intro E.distribRightClosed (And.intro E.zeroAddClosed (And.intro E.addZeroClosed (And.intro E.oneMulClosed E.mulOneClosed))))))))))

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse