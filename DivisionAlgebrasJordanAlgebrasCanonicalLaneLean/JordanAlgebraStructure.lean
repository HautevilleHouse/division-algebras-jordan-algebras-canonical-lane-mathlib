import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure JordanAlgebra (A : Type u) where
  carrier : AddCommMonoid A
  mul : A → A → A
  jordanIdentity : ∀ a b : A, mul a (mul (mul a a) b) = mul (mul a a) (mul a b)
  commLaw : ∀ a b : A, mul a b = mul b a

structure DivisionAlgebra (A : Type u) extends JordanAlgebra A where
  hasInverse : ∀ (a : A), a ≠ 0 → ∃ b : A, mul a b = 1 ∧ mul b a = 1
  zeroNotOne : (0 : A) ≠ 1

structure AdmittedObject where
  algType : Type u
  jordan : JordanAlgebra algType
  division : DivisionAlgebra algType

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse