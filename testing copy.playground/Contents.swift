var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Выведет "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Выведет "5"

print("Now serving \(customerProvider())!")
// Выведет "Now serving Chris!"
print(customersInLine.count)
// Выведет "4"

let myFunc = {
//    customersInLine.append("Oleg")
//    print(customersInLine)
    return "12"
}


