//
//  FavoriteViewController.swift
//  PokemonStudy
//
//  Created by Diego Fernando Siqueira Silva on 03/10/22.
//

import UIKit

class FavoriteViewController: UIViewController {

    var favoriteView: FavoriteView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func loadView() {
        self.favoriteView = FavoriteView()
        self.view = self.favoriteView
   
    }
}

extension FavoriteViewController:FavoriteViewControllerProtocol {
    func tappedFavorite() {
        let favoriteViewController = FavoriteViewController()
        self.navigationController?.pushViewController(favoriteViewController, animated: true)
    }
    
}

