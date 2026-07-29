import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraStructure
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.DivisionAlgebra

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

def ConstrainedJordanDivisionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_jordan_division_endgame (A : AdmissibleClass) : ConstrainedJordanDivisionClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse