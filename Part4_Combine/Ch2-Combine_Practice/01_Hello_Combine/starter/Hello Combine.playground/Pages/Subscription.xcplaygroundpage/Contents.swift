//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]") // 관계를 보여주는 operate
    .sink { value in
    print("Subscriber recevied value: \(value)")
}

subject.send("Hello")
subject.send("Hello Again!")
subject.send("Hello for the last time!")
//subject.send(completion: .finished) // 관계가 완료되었다.
subscription.cancel() // 구독자가 끝는 방법
subject.send("Hello ?? : (") // 데이터 전달되지 않는다.


//: [Next](@next)
