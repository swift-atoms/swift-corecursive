@attached(member, names: arbitrary)
public macro Corecursive() = #externalMacro(
    module: "Corecursive_Derivation_Macros",
    type: "Macro"
)
