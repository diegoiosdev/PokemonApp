//
//  TabBarProjetoBase.swift
//  PokemonStudy
//
//  Created by Diego Fernando Siqueira Silva on 07/10/22.
//

import UIKit

class TabBarProjetoBase: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let pokemonListViewController = UINavigationController(rootViewController: PokemonListViewController())
        let bagasListViewController = UINavigationController(rootViewController: BagasListViewController())
        let favoriteViewController = UINavigationController(rootViewController: FavoriteViewController())
        
        self.setViewControllers([pokemonListViewController,bagasListViewController, favoriteViewController], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = true
        guard let items = tabBar.items else {return}
        items[0].title = "Pokedex"
        items[0].image = UIImage(systemName: "pawprint")
        items[1].title = "Frutas"
        items[1].image = UIImage(systemName: "drop")
        items[2].title = "Meu pokemon"
        items[2].image = UIImage(systemName: "heart")
    }
}






