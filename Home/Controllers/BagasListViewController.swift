import UIKit

class BagasListViewController: UIViewController {
    
    var bagasView: BagasView?

    
    override func loadView() {
        self.bagasView = BagasView()
        self.view = self.bagasView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bagasView?.configTableViewProtocol(delegate: self, dataSource: self)
    }
}

extension BagasListViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1
    }
}
