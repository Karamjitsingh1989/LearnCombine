import UIKit
import Combine

var dataList = ["A", "B", "C", "D", "E"]

dataList.publisher.collect(8).sink { value in
    print("The value: \(value)")
}

print("\n***********************************")
print("            MAP\n")

let priceListInNumbers = [123, 432, 4000, 120]

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

let priceListInWords = priceListInNumbers.publisher.map { value in
    formatter.string(from: NSNumber(integerLiteral: value))
}.sink { words in
    print(words)
}

print("\n***********************************")
print("        MAP KEYPATH\n")
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

print("\n***********************************")
print("        REPLACE NIL\n")

/*
 
 Replace Nil
 
 */

let priceList2 = [23, 22, nil, 5443, nil]

let publisherReplace =  priceList2.publisher.replaceNil(with: 0).sink { value in
     print(value)
}
print("\n***********************************")
print(" REPLACE NIL and Optional Handle\n")
//remove the optional Value

let publisherReplace1 =  priceList2.publisher.replaceNil(with: 0).map({ value in
    value!
}).sink { newValue in
      print(newValue)
}

print("\n***********************************")
print("        EMPTY OPERATOR\n")
// Empty Operator

let empty = Empty<Int, Never>()

empty.sink {
    print($0)
} receiveValue: {
  print($0)
}

print("\n***********************************")
print("        SCAN OPERATOR\n")
// Scan Operator


let publisher1 = (1...10).publisher

publisher1.scan([]) { number , value -> [Int]  in
    number + [value]
}.sink { data in
    print(data)
}




print("\n***********************************")
print("        FILTER\n")
// Filter

let numbers = (1...10).publisher

numbers.filter { $0 % 2 == 0
}.sink { value in
    print(value)
}

print("\n***********************************")
print("        REMOVE DUPLICATE\n")
// Remove Duplicate


let words = "apple apple orange manago mango apple  orange orange"
words.components(separatedBy: " ").publisher.removeDuplicates().sink { value in
    print(value)
}



print("\n***********************************")
print("        COMPACT MAP\n")

// Compact Map


let stringList = ["a", "1.24", "b", "34.54","6.7","c", "1","5", "6"].publisher.compactMap{Float($0)}.sink { value in
    print(value)
}
print("\n***********************************")
print("        IGNORE OUTPUT\n")

let numberList = (1...100).publisher

numberList.ignoreOutput().sink { finalresult in
    print(finalresult)
} receiveValue: { value in
    print(value)
}

print("\n***********************************")
print("   First Number and LAST NUMBER\n")

let secondNumberList = (1...10).publisher
secondNumberList.first { $0 % 2 == 0}.sink { value in
    print("The First Even number : \(value)")
}

secondNumberList.last { $0 % 2 == 0}.sink { value in
    print("The last Even number : \(value)")
}

print("\n***********************************")
print("   DROP FIRST\n")


let thirdNumberList = (1...10).publisher
thirdNumberList.dropFirst(8).sink { value in
    print(value)
}

thirdNumberList.drop(while:{ $0 % 3 != 0}).sink { value in
    print(value)
}



print("\n***********************************")
print("           Prefix\n")

let fourthNumbers = (1...10).publisher

fourthNumbers.prefix(8).sink { value in
   // print(value)
}

fourthNumbers.prefix(while: {$0 < 5}).sink { value in
    //print(value)
}



// Resovle the question


let questionNumbers = (1...100).publisher

questionNumbers.dropFirst(50).prefix(20).filter { $0 % 2 == 0 }.sink { value in
    print(value)
}
