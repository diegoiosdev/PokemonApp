
import UIKit
protocol RestRepositoryProtocol {
    func getNewPokemon(list: [NewPokemon])
}

class RestRepository {
    var delegate: RestRepositoryProtocol?
    
      func GetNewPokemons(){

          guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else { return }
          let dataTask = URLSession.shared.dataTask(with: url) { [self] data, response,  error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let pokemons = try JSONDecoder().decode(NewPokemon.self, from: data)
                        self.delegate?.getNewPokemon(list: [pokemons])
                        print("Nomes dos Pokemons: \(pokemons)")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
