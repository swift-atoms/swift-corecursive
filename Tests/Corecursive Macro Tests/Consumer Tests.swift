import Functor_Base_Macro
import Corecursive_Macro
import Testing

@FunctorBase
@Corecursive
private indirect enum Natural {
    case zero
    case successor(Natural)
}

@Test
func `corecursive derivation embeds one layer`() {
    let value = Natural.embed(.successor(.zero))
    guard case .successor(.zero) = value else {
        Issue.record("Expected embedded successor")
        return
    }
}
