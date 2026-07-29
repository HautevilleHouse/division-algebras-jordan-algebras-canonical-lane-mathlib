import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure DivisionAlgebra (F : Type) [Field F] (J : JordanAlgebra F) where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  smul : F → carrier → carrier
  inv : carrier → carrier
  nonZeroInvertible : ∀ a : carrier, a ≠ (0 : carrier) → mul a (inv a) = (1 : carrier) ∧ mul (inv a) a = (1 : carrier)
  addAssoc : ∀ a b c : carrier, a + b + c = a + (b + c)
  addComm : ∀ a b c : carrier, a + b = b + a
  mulAssoc : ∀ a b c : carrier, (a * b) * c = a * (b * c)
  distribLeft : ∀ a b c : carrier, a * (b + c) = a * b + a * c
  distribRight : ∀ a b c : carrier, (a + b) * c = a * c + b * c
  zero : carrier
  zeroAdd : ∀ a : carrier, zero + a = a
  addZero : ∀ a : carrier, a + zero = a
  one : carrier
  oneMul : ∀ a : carrier, one * a = a
  mulOne : ∀ a : carrier, a * one = a
  jordanCompat : ∀ a b : carrier, a * b = b * a

structure DivisionAlgebraEvidence (F : Type) [Field F] (J : JordanAlgebra F) (D : DivisionAlgebra F J) where
  nonZeroInvertibleClosed : ∀ a : D.carrier, a ≠ (0 : D.carrier) → D.mul a (D.inv a) = (1 : D.carrier) ∧ D.mul (D.inv a) a = (1 : D.carrier)
  addAssocClosed : ∀ a b c : D.carrier, D.add (D.add a b) c = D.add a (D.add b c)
  addCommClosed : ∀ a b c : D.carrier, D.add a b = D.add b a
  mulAssocClosed : ∀ a b c : D.carrier, (D.mul a b) * c = D.mul a (D.mul b c)
  distribLeftClosed : ∀ a b c : D.carrier, D.mul a (D.add b c) = D.add (D.mul a b) (D.mul a c)
  distribRightClosed : ∀ a b c : D.carrier, D.mul (D.add a b) c = D.add (D.mul a c) (D.mul b c)
  zeroAddClosed : ∀ a : D.carrier, D.add D.zero a = a
  addZeroClosed : ∀ a : D.carrier, D.add a D.zero = a
  oneMulClosed : ∀ a : D.carrier, D.mul D.one a = a
  mulOneClosed : ∀ a : D.carrier, D.mul a D.one = a
  jordanCompatClosed : ∀ a b : D.carrier, D.mul a b = D.mul b a

def DivisionAlgebraClosed (F : Type) [Field F] (J : JordanAlgebra F) (D : DivisionAlgebra F J) : Prop :=
  (∀ a : D.carrier, a ≠ (0 : D.carrier) → D.mul a (D.inv a) = (1 : D.carrier) ∧ D.mul (D.inv a) a = (1 : D.carrier)) ∧
  (∀ a b c : D.carrier, D.add (D.add a b) c = D.add a (D.add b c)) ∧
  (∀ a b c : D.carrier, D.add a b = D.add b a) ∧
  (∀ a b c : D.carrier, (D.mul a b) * c = D.mul a (D.mul b c)) ∧
  (∀ a b c : D.carrier, D.mul a (D.add b c) = D.add (D.mul a b) (D.mul a c)) ∧
  (∀ a b c : D.carrier, D.mul (D.add a b) c = D.add (D.mul a c) (D.mul b c)) ∧
  (∀ a : D.carrier, D.add D.zero a = a) ∧
  (∀ a : D.carrier, D.add a D.zero = a) ∧
  (∀ a : D.carrier, D.mul D.one a = a) ∧
  (∀ a : D.carrier, D.mul a D.one = a) ∧
  (∀ a b : D.carrier, D.mul a b = D.mul b a)

theorem division_algebra_closed_from_evidence (F : Type) [Field F] (J : JordanAlgebra F) (D : DivisionAlgebra F J) (E : DivisionAlgebraEvidence F J D) : DivisionAlgebraClosed F J D :=
  And.intro E.nonZeroInvertibleClosed (And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.mulAssocClosed (And.intro E.distribLeftClosed (And.intro E.distribRightClosed (And.intro E.zeroAddClosed (And.intro E.addZeroClosed (And.intro E.oneMulClosed (And.intro E.mulOneClosed E.jordanCompatClosed)))))))))

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse