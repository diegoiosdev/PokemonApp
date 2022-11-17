import UIKit

class TabBarProjetoBase: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let pokemonListViewController = UINavigationController(rootViewController: PokemonListViewController())
        self.setViewControllers([pokemonListViewController], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = true
        guard let items = tabBar.items else {return}
        items[0].title = "Pokedex"
        items[0].image = UIImage(systemName: "pawprint")
    }
}
