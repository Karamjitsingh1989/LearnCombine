import UIKit
import Combine

var dataList = ["A", "B", "C", "D", "E"]

dataList.publisher.collect(8).sink { value in
    print("The value: \(value)")
}



let priceListInNumbers = [123, 432, 4000, 120]

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

let priceListInWords = priceListInNumbers.publisher.map { value in
    formatter.string(from: NSNumber(integerLiteral: value))
}.sink { words in
    print(words)
}


/**
    **MAP KeyPath**
 
 */

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("The X value is :\(x) and Y Value is: \(y)")
}

publisher.send(Point(x: 23, y: 22))




/*
 
 Replace Nil
 
 */

let priceList2 = [23, 22, nil, 5443, nil]

let publisherReplace =  priceList2.publisher.replaceNil(with: 0).sink { value in
     print(value)
}


//remove the optional Value

let publisherReplace1 =  priceList2.publisher.replaceNil(with: 0).map({ value in
    value!
}).sink { newValue in
      print(newValue)
}



// Empty Operator

let empty = Empty<Int, Never>()

empty.sink {
    print($0)
} receiveValue: {
  print($0)
}



// Scan Operator


let publisher1 = (1...10).publisher

publisher1.scan([]) { number , value -> [Int]  in
    number + [value]
}.sink { data in
    print(data)
}

