import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.NormedDivisionAlgebra

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure CayleyNumbers where
  octonion : Type
  normedDivisionAlgebra : NormedDivisionAlgebra octonion
  alternative : ∀ x y z : octonion, normedDivisionAlgebra.divAlg.jordan.mul (normedDivisionAlgebra.divAlg.jordan.mul x y) z = normedDivisionAlgebra.divAlg.jordan.mul x (normedDivisionAlgebra.divAlg.jordan.mul y z) ∨
    normedDivisionAlgebra.divAlg.jordan.mul x (normedDivisionAlgebra.divAlg.jordan.mul y z) = normedDivisionAlgebra.divAlg.jordan.mul (normedDivisionAlgebra.divAlg.jordan.mul x y) z
  nonAssociative : ∃ x y z : octonion, normedDivisionAlgebra.divAlg.jordan.mul (normedDivisionAlgebra.divAlg.jordan.mul x y) z ≠ normedDivisionAlgebra.divAlg.jordan.mul x (normedDivisionAlgebra.divAlg.jordan.mul y z)

def CayleyNumbersClosed (C : CayleyNumbers) : Prop :=
  NormedDivisionAlgebraClosed C.normedDivisionAlgebra ∧ C.alternative

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse