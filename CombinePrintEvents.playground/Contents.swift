import UIKit
import Combine


//let subscriber = (1...10).publisher
//
//subscriber.print("Debugging").sink { value in
//    print(value)
//}

guard let url = URL(string: "https://jsonplaceholder.typicode.com/post") else {
    fatalError("URL Failure")
}

let request = URLSession.shared.dataTaskPublisher(for: url)


let subscription = request.handleEvents(receiveSubscription: { subscriptionValue in
    print(subscriptionValue)
}, receiveOutput: { _ in
    
    print("Receive Output")
    
}, receiveCancel: {
    
    print("Receive cancel")
    
}, receiveRequest: { _ in
    
    print("Recieve Request")
    
}).sink { completion in
    print(completion)
} receiveValue: { data ,response in
    print(data)
}


