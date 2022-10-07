import UIKit

class HomePokemonTableViewCell: UITableViewCell {

    static let identifier: String = "HomePokemonTableViewCell"
    
    lazy var pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pokemon1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var pokemonHome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35)
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
        self.contentView.addSubview(pokemonImageView)
        self.contentView.addSubview(pokemonHome)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.pokemonImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.pokemonImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.pokemonImageView.heightAnchor.constraint(equalToConstant: 100),
            self.pokemonImageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.pokemonHome.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.pokemonHome.leadingAnchor.constraint(equalTo: self.pokemonImageView.trailingAnchor, constant: 50),
        ])
    }
}
