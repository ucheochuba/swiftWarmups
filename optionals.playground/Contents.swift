import Cocoa

func magic (_ array: [Int]) -> Int { return array.randomElement() ?? Int.random(in: 1...100) }


print(magic([]))
