import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.TheoremStatement
import Mathlib.Algebra.Algebras.Basic

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure DivisionAlgebraObject where
  carrier : Type
  algebra : Algebra ℝ carrier
  division : DivisionRing carrier
  normed : NormedDivisionRing carrier

structure DivisionAlgebraAdmittedObject where
  object : DivisionAlgebraObject
  finiteDimensional : Prop
  alternativeAxiom : Prop
  jordanIdentity : Prop
  conclusion : finiteDimensional ∧ alternativeAxiom ∧ jordanIdentity

def DivisionAlgebraWitnessClosed (O : DivisionAlgebraAdmittedObject) : Prop :=
  O.finiteDimensional ∧ O.alternativeAxiom ∧ O.jordanIdentity

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
