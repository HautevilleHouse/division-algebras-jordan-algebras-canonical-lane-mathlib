import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure DivisionAlgebra where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addComm : ∀ a b : carrier, add a b = add b a
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : carrier, mul one a = a
  mulOne : ∀ a : carrier, mul a one = a
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  nonzeroInverse : ∀ a : carrier, a ≠ zero → ∃ b : carrier, mul a b = one ∧ mul b a = one

structure JordanAlgebra where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zeroAdd : ∀ a : carrier, add zero a = a
  addZero : ∀ a : carrier, add a zero = a
  addComm : ∀ a b : carrier, add a b = add b a
  mulComm : ∀ a b : carrier, mul a b = mul b a
  jordanIdentity : ∀ a b : carrier, mul (mul (mul a a) b) a = mul (mul a a) (mul b a)
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  oneMul : ∀ a : carrier, mul one a = a
  mulOne : ∀ a : carrier, mul a one = a

structure AdmissibleClass where
  object : DivisionAlgebra
  jordanInherited : JordanAlgebra
  compatibility : jordanInherited.carrier = object.carrier
  bridgeClosed : Prop
  gateClosed : Prop
  bridgeWitness : bridgeClosed
  gateWitness : gateClosed

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse