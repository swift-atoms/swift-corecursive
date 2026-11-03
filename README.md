# swift-corecursive

Use this package when you need to build values of a recursive enum one layer at a time from its base functor, so that unfolds such as anamorphisms can construct it. Start from the `@Corecursive` macro: put it on the recursive enum next to `@FunctorBase`, and it adds a static `embed` that turns one `Base<Self>` layer into `Self`. To take a value apart instead, use swift-recursive; when an enum needs both directions, use swift-birecursive on its enclosing namespace.

## Laws

- `embed` wraps exactly one layer: each base case maps to the enum case of the same name, with the payloads passed through in order and their labels kept. Base cases without payloads map to the matching case without payloads.
- `@Corecursive` does not create `Base<Self>`; the enum must also carry `@FunctorBase`.
- `embed` has the enum's access level when that level is `public` or `package`, and is internal otherwise.
- The enum may only refer to itself directly, as a payload spelled `Self` or as its own name with its own type parameters unchanged. A payload such as an optional, array or tuple of `Self`, or the enum applied to other type arguments, is rejected with a compile error, and so are type parameters with constraints or a `where` clause. Such enums need a hand-written `embed`.
