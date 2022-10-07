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
    
 
    lazy var searchbarHome: UISearchBar = {
       let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .minimal
        search.barTintColor = .darkGray
        search.placeholder = "Busca pokemon ?"
        search.showsBookmarkButton = false
        return search
    }()
    
    lazy var homeImageView: UIImageView = {
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Charmander")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
//    lazy var FrutasButton:UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Frutas", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        button.setTitleColor(.black, for: .normal)
//        button.clipsToBounds = true
//        button.layer.cornerRadius = 10.5
//        button.backgroundColor = .systemTeal
//        button.addTarget(self, action: #selector(self.tappedBagasButton), for: .touchUpInside)
//        return button
//    }()
//    lazy var favorets:UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Favoritos", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        button.setTitleColor(.black, for: .normal)
//        button.clipsToBounds = true
//        button.layer.cornerRadius = 7.5
//        button.backgroundColor = .systemTeal
//        button.addTarget(self, action: #selector(self.tappedFavoretsButton), for: .touchUpInside)
//        return button
//    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
         addSubview(titleHome)
         addSubview(searchbarHome)
         addSubview(homeImageView)
//         addSubview(FrutasButton)
         addSubview(tableView)
//         addSubview(favorets)
         setConstraints()
    }
    
//    @objc  func tappedBagasButton() {
//        self.delegate?.actionBagasButton()
//    }
//
//    @objc private func tappedFavoretsButton() {
//        self.delegate?.actionfavoretsButton()
//    }
//
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
            
            self.searchbarHome.topAnchor.constraint(equalTo: self.titleHome.bottomAnchor, constant: 0),
            self.searchbarHome.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.searchbarHome.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.homeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.homeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 320),
            self.homeImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.homeImageView.heightAnchor.constraint(equalToConstant: 80),
            self.homeImageView.widthAnchor.constraint(equalToConstant: 80),
//
//            self.FrutasButton.topAnchor.constraint(equalTo: searchbarHome.topAnchor, constant: 60),
//            self.FrutasButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
//            self.FrutasButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -300),
//            self.FrutasButton.heightAnchor.constraint(equalToConstant: 25),
//            self.FrutasButton.widthAnchor.constraint(equalToConstant: 25),
//
//            self.favorets.topAnchor.constraint(equalTo: searchbarHome.topAnchor, constant: 60),
//            self.favorets.leadingAnchor.constraint(equalTo: self.FrutasButton.leadingAnchor, constant: 250),
//            self.favorets.heightAnchor.constraint(equalToConstant: 25),
//            self.favorets.widthAnchor.constraint(equalToConstant: 80),
            
            self.tableView.topAnchor.constraint(equalTo:searchbarHome.topAnchor, constant: 65),
            self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

