import Foundation

struct NewPokemon: Decodable {
    var results: [results]
}

struct results: Decodable {
    var name: String
}
