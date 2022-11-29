
import Foundation

struct NewPokemon: Decodable {
    var count: Int
    var next: String
    var previous: Bool?
    var results: [results]
}

struct results: Decodable {
    var name: String
    var url: String
}
