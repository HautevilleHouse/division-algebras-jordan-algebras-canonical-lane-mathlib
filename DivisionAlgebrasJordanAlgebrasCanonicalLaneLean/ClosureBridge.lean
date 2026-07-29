import canonicalLaneMathlib.AdmissibleClass
import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.FormalizationDivisionAlgebrasJordanAlgebras

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := A.bridgeClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.bridgeWitness

def gateClosed (A : AdmissibleClass) : Prop := A.gateClosed

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse