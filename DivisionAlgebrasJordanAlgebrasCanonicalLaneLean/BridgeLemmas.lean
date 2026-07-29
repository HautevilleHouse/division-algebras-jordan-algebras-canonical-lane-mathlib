import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DivisionAlgebraWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
