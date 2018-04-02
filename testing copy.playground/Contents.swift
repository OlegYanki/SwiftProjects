func someFunctionThatTakesAClosure(closure: () -> Void,str: String) {
    print(1)
    closure()
    print(2)
}

// Вот как вы вызываете эту функцию без использования последующего замыкания:

someFunctionThatTakesAClosure(closure: {
    print("myFunc")
},str: "string")

// Вот как вы вызываете эту функцию с использованием последующего замыкания:

someFunctionThatTakesAClosure(str: "string2") {
    // тело последующего замыкания
    print("myFUnc2")
}

