@attached(member, names: arbitrary)
public macro Corecursive() = #externalMacro(
    module: "Corecursive_Macro_Plugin",
    type: "Macro"
)
