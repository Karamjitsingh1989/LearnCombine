import UIKit
import Combine


let subscriber = (1...10).publisher

subscriber.print("Debugging").sink { value in
    print(value)
}




