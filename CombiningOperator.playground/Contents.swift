import UIKit
import Combine

print("****************************")
print("       Prepend\n")


let numberList = (1...10).publisher
let numberList2 = (60...70).publisher

numberList.prepend(20...25).prepend(-20,30).prepend(numberList2).sink { value in
    print(value)
}

print("****************************")
print("       Append\n")

let appnendNumberList = (1...5).publisher
let appendNumberList2 = (10...15).publisher

appnendNumberList.append(12,14).append(appendNumberList2).sink { value in
    print(value)
}


print("****************************")
print("       Swtich To Latest\n")



let publisher1 = PassthroughSubject<String, Never>()
let publisher2 = PassthroughSubject<String, Never>()

let publisher = PassthroughSubject<PassthroughSubject<String, Never>, Never>()


publisher.switchToLatest().sink { value in
    print(value)
}

publisher.send(publisher1)

publisher2.send("Publisher2 Value updated")

publisher1.send("Publisher1 Value updated")


publisher.send(publisher2)

print("Switch to Publisher 2")

publisher2.send("Publisher 2 Value updated")

publisher1.send("Publisher 1 Value updated")



print("****************************")
print(" Swtich To Latest Images\n")

let images = ["Fly1.JPG","Fly2.JPG","Fly3.JPG","Fly4.JPG"]

var index = 0

func getImage() -> AnyPublisher<UIImage?, Never> {
    
    return Future<UIImage?, Never> { promise in
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3)) {
            promise(.success(UIImage(named: images[index])))
        }
        
    }.map{$0}.receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}


let tap = PassthroughSubject<Void, Never>()

let subscriber  = tap.map { _ in getImage()}.switchToLatest().sink { image in
    print(image)
}


tap.send()

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)){
    index += 1
    tap.send()
}

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(8)){
    index += 1
    tap.send()
}


print("****************************")
print("       Merge\n")


let publisher12 = PassthroughSubject<Int, Never>()
let publisher23 = PassthroughSubject<Int, Never>()


publisher12.merge(with: publisher23).sink { value in
    print(value)
}


publisher12.send(3)
publisher23.send(4)

publisher12.send(8)
publisher12.send(5)

publisher23.send(7)
publisher12.send(6)



