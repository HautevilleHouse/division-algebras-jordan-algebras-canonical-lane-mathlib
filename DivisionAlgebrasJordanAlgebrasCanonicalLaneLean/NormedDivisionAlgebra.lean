import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraDefinitions

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure NormedDivisionAlgebra (A : Type) where
  divAlg : DivisionAlgebra A
  norm : A → ℝ
  normMultiplicative : ∀ x y : A, norm (divAlg.jordan.mul x y) = norm x * norm y
  normPositive : ∀ x : A, x ≠ divAlg.unit → norm x > 0

def NormedDivisionAlgebraClosed (N : NormedDivisionAlgebra A) : Prop :=
  DivisionAlgebraClosed N.divAlg ∧ N.normMultiplicative

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse