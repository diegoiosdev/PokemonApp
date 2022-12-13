import UIKit

class NewHomeViewController: UIViewController {
    
    var newHomeView: NewHomeView?
    var restRepository = RestRepository()
    var newpokemons: [NewPokemon] = []

    override func loadView() {
        self.newHomeView = NewHomeView()
        self.view = self.newHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        newHomeView?.configTableViewProtocol(delegate: self, dataSouse: self)
        restRepository.delegate = self
        
        restRepository.GetNewPokemons()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
   }
    
}
extension NewHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewHomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NewHomeTableViewCell.identifier, for: indexPath) as? NewHomeTableViewCell
//        cell?.pokemonLabel.text =  "Ataque: \(newpokemons[indexPath.row])"
        cell?.imageView?.image = UIImage(named: "Bulbasaur")
        return cell ?? UITableViewCell()
    }
}

extension NewHomeViewController: RestRepositoryProtocol {
    func getNewPokemon(list: [NewPokemon]) {
        newpokemons = list
        DispatchQueue.main.async {
            self.newHomeView?.tableView.reloadData()
        }
    }
}
