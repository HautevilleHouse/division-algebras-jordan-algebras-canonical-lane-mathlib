import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure AlbertAlgebra (F : Type) [Field F] where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  smul : F → carrier → carrier
  trace : carrier → F
  norm : carrier → F
  jordanAlgebra : JordanAlgebra F
  traceLinear : ∀ a b : carrier, trace (add a b) = trace a + trace b
  traceSymmetric : ∀ a b : carrier, trace (mul a b) = trace (mul b a)
  normQuadratic : ∀ a : carrier, norm a = trace (mul a a) - (trace a)^2
  nondegenerate : ∀ a : carrier, trace a = 0 ∧ norm a = 0 → a = (0 : carrier)
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

structure AlbertAlgebraEvidence (F : Type) [Field F] (A : AlbertAlgebra F) where
  traceLinearClosed : ∀ a b : A.carrier, A.trace (A.add a b) = A.trace a + A.trace b
  traceSymmetricClosed : ∀ a b : A.carrier, A.trace (A.mul a b) = A.trace (A.mul b a)
  normQuadraticClosed : ∀ a : A.carrier, A.norm a = A.trace (A.mul a a) - (A.trace a)^2
  nondegenerateClosed : ∀ a : A.carrier, A.trace a = 0 ∧ A.norm a = 0 → a = (0 : A.carrier)
  jordanIdentityClosed : ∀ x y : A.carrier, (A.mul x y) * (A.mul x x) = A.mul x (A.mul y (A.mul x x))
  addAssocClosed : ∀ a b c : A.carrier, A.add (A.add a b) c = A.add a (A.add b c)
  addCommClosed : ∀ a b : A.carrier, A.add a b = A.add b a
  mulCommClosed : ∀ a b : A.carrier, A.mul a b = A.mul b a
  distribLeftClosed : ∀ a b c : A.carrier, A.mul a (A.add b c) = A.add (A.mul a b) (A.mul a c)
  distribRightClosed : ∀ a b c : A.carrier, A.mul (A.add a b) c = A.add (A.mul a c) (A.mul b c)
  zeroAddClosed : ∀ a : A.carrier, A.add A.zero a = a
  addZeroClosed : ∀ a : A.carrier, A.add a A.zero = a
  oneMulClosed : ∀ a : A.carrier, A.mul A.one a = a
  mulOneClosed : ∀ a : A.carrier, A.mul a A.one = a

def AlbertAlgebraClosed (F : Type) [Field F] (A : AlbertAlgebra F) : Prop :=
  (∀ a b : A.carrier, A.trace (A.add a b) = A.trace a + A.trace b) ∧
  (∀ a b : A.carrier, A.trace (A.mul a b) = A.trace (A.mul b a)) ∧
  (∀ a : A.carrier, A.norm a = A.trace (A.mul a a) - (A.trace a)^2) ∧
  (∀ a : A.carrier, A.trace a = 0 ∧ A.norm a = 0 → a = (0 : A.carrier)) ∧
  (∀ x y : A.carrier, (A.mul x y) * (A.mul x x) = A.mul x (A.mul y (A.mul x x))) ∧
  (∀ a b c : A.carrier, A.add (A.add a b) c = A.add a (A.add b c)) ∧
  (∀ a b : A.carrier, A.add a b = A.add b a) ∧
  (∀ a b : A.carrier, A.mul a b = A.mul b a) ∧
  (∀ a b c : A.carrier, A.mul a (A.add b c) = A.add (A.mul a b) (A.mul a c)) ∧
  (∀ a b c : A.carrier, A.mul (A.add a b) c = A.add (A.mul a c) (A.mul b c)) ∧
  (∀ a : A.carrier, A.add A.zero a = a) ∧
  (∀ a : A.carrier, A.add a A.zero = a) ∧
  (∀ a : A.carrier, A.mul A.one a = a) ∧
  (∀ a : A.carrier, A.mul a A.one = a)

theorem albert_algebra_closed_from_evidence (F : Type) [Field F] (A : AlbertAlgebra F) (E : AlbertAlgebraEvidence F A) : AlbertAlgebraClosed F A :=
  And.intro E.traceLinearClosed (And.intro E.traceSymmetricClosed (And.intro E.normQuadraticClosed (And.intro E.nondegenerateClosed (And.intro E.jordanIdentityClosed (And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.mulCommClosed (And.intro E.distribLeftClosed (And.intro E.distribRightClosed (And.intro E.zeroAddClosed (And.intro E.addZeroClosed (And.intro E.oneMulClosed E.mulOneClosed))))))))))))

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse