import Foundation
import Combine

// PassthroughSubject
let relay = PassthroughSubject<String, Never>() // Never : 실패 할 일이 없다.
let subscription1 = relay.sink { value in
    print("subscription1 recevied value : \(value)")
}

relay.send("Hello")
relay.send("World !")

// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial Text")

let subscription2 = variable.sink { value in
    print("subscription2 recevied value : \(value)")
}

variable.send("More Text")
variable.value // 현재 데이터 값을 알 수 있다.

let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay) // 배출된 데이터가 relay가 받는다.
