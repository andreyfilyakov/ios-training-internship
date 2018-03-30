
import Foundation

public func simulatedErrorDidOccur() -> Bool {
    return arc4random_uniform(2) == 1
}

let errorA = simulatedErrorDidOccur()
let errorB = simulatedErrorDidOccur()


