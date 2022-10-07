import UIKit
import SnapKit
import SwiftUI

class PokemonTableViewCell: UITableViewCell {

    static let identifier:String = "PokemonTableViewCell"
    
    lazy var imagePokemon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    lazy var pokemonFavorite: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "love")
        return image
    }()
    
//        lazy var pokemonFavorite:UIButton = {
//            let button = UIButton()
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.setTitle("Favorito", for: .normal)
////            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//            button.setTitleColor(.black, for: .normal)
//            button.layer.shadowRadius = 1
//            button.layer.borderWidth = 1
//            button.layer.cornerRadius = 15
//            button.layer.shadowColor = UIColor.black.cgColor
//            button.layer.masksToBounds = false
//            button.clipsToBounds = true
//            //            button.addTarget(self, action: #selector(self.tappedBagasButton), for: .touchUpInside)
//            return button
//        }()
    
    lazy var namePokemon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    lazy var attackTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var defenseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func addSubview() {
         self.contentView.addSubview(imagePokemon)
         self.contentView.addSubview(namePokemon)
         self.contentView.addSubview(attackTitle)
         self.contentView.addSubview(defenseTitle)
         self.contentView.addSubview(pokemonFavorite)
    }
    
private func setUpConstraints() {
    NSLayoutConstraint.activate([
        
        self.imagePokemon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        self.imagePokemon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        self.imagePokemon.heightAnchor.constraint(equalToConstant: 150),
        
        self.pokemonFavorite.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
        self.pokemonFavorite.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        self.pokemonFavorite.heightAnchor.constraint(equalToConstant: 15),
        self.pokemonFavorite.widthAnchor.constraint(equalToConstant: 15),

        self.namePokemon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        self.namePokemon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        self.namePokemon.leadingAnchor.constraint(equalTo: self.imagePokemon.trailingAnchor),
    
        self.defenseTitle.leadingAnchor.constraint(equalTo: self.imagePokemon.leadingAnchor, constant: 150),
        self.defenseTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        
        self.attackTitle.leadingAnchor.constraint(equalTo: self.imagePokemon.leadingAnchor,constant: 150),
        self.attackTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        self.attackTitle.bottomAnchor.constraint(equalTo: self.imagePokemon.bottomAnchor,constant: 10),
      ])
   }
}
