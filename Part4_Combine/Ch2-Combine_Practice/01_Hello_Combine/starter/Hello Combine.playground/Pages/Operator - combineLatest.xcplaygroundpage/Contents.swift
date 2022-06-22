//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest

let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}

strPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}

//strPublisher.send("A")
//strPublisher.send("B")
//strPublisher.send("C")
//
//numPublisher.send(1)
//numPublisher.send(2)
//numPublisher.send(3)

strPublisher.send("A")
numPublisher.send(1)
strPublisher.send("B")
strPublisher.send("C")

numPublisher.send(2)
numPublisher.send(3)

// Advanced CombineLatest

let userNamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let vaildatedCrendetialsSubscription = userNamePublisher.combineLatest(passwordPublisher)
    .map { (userName, password) -> Bool in
        return !userName.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential valid? : \(valid)")
    }
    
userNamePublisher.send("jasonlee")
passwordPublisher.send("123")
passwordPublisher.send("PasswordValidationSuccess")

// Merge
// 2개의 타입이 같아야 merge가 가능하다.
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

Publishers.Merge(publisher1, publisher2)
    .sink { value in
        print("Merge: Subscription recevied value: \(value)")
    }

let mergedPublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: Subscription recevied value: \(value)")
    }


//: [Next](@next)
