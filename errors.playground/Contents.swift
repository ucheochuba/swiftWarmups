import Cocoa
import Foundation

enum rootError: Error {
    case out_of_bounds, no_root
}

func rooter(_ number: Int) throws -> Int {
    if (number > 10_000 || number < 1) {
        throw rootError.out_of_bounds
    }
    for i in 1...10_000 {
        if i*i == number {
            return i
        }
        if i*i > number {
            break
        }
    }
    
    throw rootError.no_root
}

do {
    try print(rooter(159))
} catch rootError.out_of_bounds {
    print("Number is out of bounds.")
} catch rootError.no_root {
    print("Number is not a perfect square.")
}
