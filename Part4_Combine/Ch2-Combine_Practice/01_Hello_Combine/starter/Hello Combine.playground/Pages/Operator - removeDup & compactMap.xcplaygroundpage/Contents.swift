//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words.removeDuplicates() // 중복된 값 제거
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// compactMap
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings.compactMap { Float($0) } // nil값 제거하고 내려온다.
    .sink { value in
        print(value) // 1.24, 3, 45, 0.23
    }.store(in: &subscriptions)

// ignoreOutput

let numbers = (1...10_000).publisher

numbers.ignoreOutput() // 10000개의 데이터 무시
    .sink(receiveCompletion: { print("Completion with: \($0)")}) { value in
        print(value)
    }.store(in: &subscriptions)

// prefix

let tens = (1...10).publisher

tens.prefix(5) // 1 2 3 4 5
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: {
        print($0)
    }).store(in: &subscriptions)

//: [Next](@next)
