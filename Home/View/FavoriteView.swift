//
//  FavoriteView.swift
//  PokemonStudy
//
//  Created by Diego Fernando Siqueira Silva on 03/10/22.
//

import UIKit

protocol FavoriteViewControllerProtocol: AnyObject {
    func tappedFavorite() 
}

class FavoriteView: UIView {
    var delegate: FavoriteViewControllerProtocol?
    
    func delegate(delegate: FavoriteViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    var favoriteViewController = FavoriteViewController()
     
    lazy var favorite: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Favorito", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.4
        button.addTarget(self, action: #selector(self.tappedFavorite), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(favorite)
         setConstraints()
    }
    
    @objc func tappedFavorite() {
        self.delegate?.tappedFavorite()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            self.favorite.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.favorite.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 250),
            self.favorite.heightAnchor.constraint(equalToConstant: 25),
            self.favorite.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
