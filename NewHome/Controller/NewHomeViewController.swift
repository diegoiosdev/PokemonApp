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
        newHomeView?.configTableViewProtocol(delegate: self, dataSouse: self)
        restRepository.delegate = self
        restRepository.GetNewPokemons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
   }
}

extension NewHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Pokemon com mais força de ataque"
        }
        return "Pokemon"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewHomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NewHomeTableViewCell.identifier, for: indexPath) as? NewHomeTableViewCell
        cell?.name.text = "Bulbasaur"
        cell?.imagePokemon.image = UIImage(named: "Bulbasaur")
        cell?.accessoryType = .disclosureIndicator
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
