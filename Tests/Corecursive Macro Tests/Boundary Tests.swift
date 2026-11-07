import Corecursive_Macro
import Functor_Base_Macro
import Testing

@FunctorBase
@Corecursive
private indirect enum Count {
    case zero
    case successor(Count)
}

enum `Boundary Tests` {}

extension `Boundary Tests` {
    @Suite
    struct `Corecursive boundaries` {
        @Test
        func `the base layer embeds to the base case`() {
            guard case .zero = Count.embed(.zero) else {
                Issue.record("Expected the base case")
                return
            }
        }

        @Test
        func `embedding wraps exactly one layer`() {
            let inner = Count.successor(.successor(.zero))
            guard case .successor(.successor(.successor(.zero))) = Count.embed(.successor(inner)) else {
                Issue.record("Expected three layers")
                return
            }
        }
    }
}
