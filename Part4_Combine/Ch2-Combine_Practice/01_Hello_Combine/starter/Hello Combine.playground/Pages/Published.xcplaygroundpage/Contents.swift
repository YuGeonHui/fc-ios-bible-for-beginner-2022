//: [Previous](@previous)

import Foundation
import UIKit
import Combine

// MARK: @Published

// @Published로 선언된 프로퍼티를 퍼블리셔로 만들어 줌
// 클래스 한해서 사용이 가능하다.
// $를 이용해서 퍼블리셔에 접근할 수 있다.

final class SomeViewModel {
    
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let label = Label()
let viewModel = SomeViewModel()

// ViewModel의 값을 바꿀 때마다 label의 text의 값이 변경된다.
print("text : \(label.text)") // Empty String

viewModel.$name.assign(to: \.text, on: label)
print("text : \(label.text)") // Jack

viewModel.name = "Jason"
print("text : \(label.text)") // Jason

viewModel.name = "Hoo"
print("text : \(label.text)") // Hoo


viewModel.age = 40
label.text = "\(viewModel.age)"
print("text : \(label.text)")

//: [Next](@next)
