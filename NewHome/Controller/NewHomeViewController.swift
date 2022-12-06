import UIKit

class NewHomeViewController: UIViewController {
    
    var newHomeView: NewHomeView?
    var newpokemons: [NewPokemon] = []

    override func loadView() {
        self.newHomeView = NewHomeView()
        self.view = self.newHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        RestRepository.load()
    }
}

extension NewHomeViewController: UITableViewDelegate, UITableViewDataSource  {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "teste"
        return  cell
    }
}
