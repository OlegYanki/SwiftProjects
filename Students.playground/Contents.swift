
let allStudents = ["stud1","stud2","stud3","stud4","stud5","stud6","stud7","stud8","stud9","stud10"]

let monday = ["stud1","stud2","stud5","stud6","stud7"]
let tuesday = ["stud3","stud6","stud8","stud10"]
let wednesday = ["stud1","stud3","stud7","stud9","stud10"]

let journal = ["monday" : monday, "tuesday" : tuesday, "wednesday" : wednesday]

func allDays() -> Set<String> {
//    var students: Set<String> = [];
//    for day in [monday,tuesday,wednesday] {
//        for student in day {
//            students.insert(student)
//        }
//    }
//    return students
    
    return Set(monday).union(tuesday).union(wednesday)
}

func twoDays() -> Set<String> {
    let monTues = Set(monday).intersection(tuesday)
    let monWedn = Set(monday).intersection(wednesday)
    let tuesWedn = Set(tuesday).intersection(wednesday)

    return monTues.union(monWedn).union(tuesWedn)
}

func monAndWednes() -> Set<String> {
//    var students: Set<String> = [];
//
//    for day in [monday,wednesday] {
//        for student in day {
//            students.insert(student)
//        }
//    }
//    return students
    let monAndWed = Set(monday).intersection(wednesday)
    let noTues = monAndWed.intersection(tuesday)
    
    return monAndWed.subtracting(noTues)
}

func absent() -> Set<String> {
    let studentsWereAllDays: Set<String> = allDays();
//    var result: Set<String> = []
    
//    for student in Array(allStudents) {
//        if !studentsWereAllDays.contains(student) {
//                result.insert(student)
//        }
//    }
     return studentsWereAllDays.symmetricDifference(allStudents)

}

print(monAndWednes())



