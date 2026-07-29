import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraDefinitions

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  JordanAlgebraClosed (A.object.jordan)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.jordanClosedProof

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse