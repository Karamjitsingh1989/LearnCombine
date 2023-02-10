import UIKit
import Combine


print("\n****************************")
print("            CombineLatest\n")

let publisherInt = PassthroughSubject<Int, Never>()
let publisherString = PassthroughSubject<String, Never>()


publisherInt.combineLatest(publisherString).sink { intValue, stringValue in
    print("Interger Value: \(intValue) and String Value:\(stringValue)")
}



publisherInt.send(5)
publisherString.send("Karam")
publisherString.send("Harsimrat")

print("\n****************************")
print("           Min\n")


// SEQUENCE OPERATOR


let numberList = [1,3,4,-15,9,-25]


let publisher1 = numberList.publisher

publisher1.min().sink { value in
    print("Minimum value:\(value)")
}

print("\n****************************")
print("           Max\n")

publisher1.max().sink { value in
    print("Max value:\(value)")
}




// First Operator


let stringList = ["a", "b", "c", "d", "e"]


let publisher3 = stringList.publisher

print("\n****************************")
print("            First\n")

publisher3.first(where: { "cat".contains($0) }).sink { value in
    print("First \(value)")
}

print("\n****************************")
print("           Last\n")

publisher3.last().sink { value in
    print("Last \(value)")
}

print("\n****************************")
print("           Output\n")

publisher3.output(at: 2).sink { value in
    print("Output :\(value)")
}


print("\n****************************")
print("         Output Range\n")

publisher3.output(in: 0...2).sink { value in
    print("Output Range IN:\(value)")
}


print("\n****************************")
print("           Count\n")

publisher3.count().sink { value in
    print("\n Total Element count: \(value)")
}



//
print("\n****************************")
print("       Count using Pass\n")


let publisherCount = PassthroughSubject<Int, Never>()


publisherCount.count().sink { value in
    print("\n the count value : \(value)")
}

publisherCount.send(54)
publisherCount.send(2)
publisherCount.send(completion: .finished)


print("\n****************************")
print("           Contain\n")

publisher3.contains("B").sink { value in
    print(value)
}
publisher3.contains("c").sink { value in
    print(value)
}


print("\n****************************")
print("           allSatsify\n")

let publisher4 = [1,2,3,4,5,6,7,8].publisher

publisher4.allSatisfy({$0 % 2 == 0}).sink { value in
    print("Result:\(value)")
}

let publisher5 = [4,2,32,46,50,68,74,88].publisher

publisher5.allSatisfy({$0 % 2 == 0}).sink { value in
    print("Result:\(value)")
}

