
import UIKit

class RestRepository {
    
    private static let basePath = "https://pokeapi.co/api/v2/pokemon/"
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.timeoutIntervalForRequest = 30.0
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func load(){
        guard let url = URL(string: basePath) else { return }
        let dataTask = session.dataTask(with: url) { data, response,  error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let pokemons = try JSONDecoder().decode(NewPokemon.self, from: data)
                        print("Temos pokemons: \(pokemons)")
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print(error.debugDescription)
                }
                
            } else {
                print(error.debugDescription)
            }
        }
        dataTask.resume()
    }
}

