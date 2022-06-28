//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
}

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    
}

// network 담당 NetworkService
// NetworkService 이용한 네트워크 작업





//: [Next](@next)
