import UIKit
import Combine

// https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty

guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
    fatalError("Bad Request")
}


let subscriber = URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: [Int].self, decoder: JSONDecoder()).sink { _ in
    print("Finished")
} receiveValue: { result in
    print(result)
}

