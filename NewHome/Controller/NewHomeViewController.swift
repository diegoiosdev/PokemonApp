
import UIKit

class NewHomeViewController: UIViewController {

    var newHomeView: NewHomeView?
     
    var pokemons: [NewPokemon] = []
    
    override func loadView() {
        self.newHomeView = NewHomeView()
        self.view = self.newHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestRepository.load()
    }
}

extension NewHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath)
        cell.textLabel?.text = "teste table"
        return cell
    }
}
