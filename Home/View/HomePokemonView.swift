import UIKit

protocol HomePokemonViewProtocol: AnyObject {
    func actionBagasButton()
    func actionfavoretsButton()
}

class HomePokemonView: UIView {
    
    var delegate: HomePokemonViewProtocol?
    func delegate(delegate: HomePokemonViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var titleHome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "Pokedex"
        return label
    }()
    
    lazy var homeImageView: UIImageView = {
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Charmander")
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
         addSubview(titleHome)
         addSubview(homeImageView)
         addSubview(tableView)
         setConstraints()
    }

    public func configTableViewProtocol(delegate:UITableViewDelegate, dataSouse: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSouse
    }
    
    func addSubview(){
        addSubview(tableView)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleHome.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:15),
            self.titleHome.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 2),
            
            self.homeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.homeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 320),
            self.homeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.homeImageView.heightAnchor.constraint(equalToConstant: 80),
            self.homeImageView.widthAnchor.constraint(equalToConstant: 80),

            self.tableView.topAnchor.constraint(equalTo:homeImageView.topAnchor, constant: 65),
            self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

