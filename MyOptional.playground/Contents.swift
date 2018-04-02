enum OptionalValue<Wrapped> {
    case null
    case some(Wrapped)
}
var my: OptionalValue<Int>? = .none
//my = .some(100)
print(my)

