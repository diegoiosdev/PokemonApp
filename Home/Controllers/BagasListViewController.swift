import UIKit

class BagasListViewController: UIViewController {
    
    var bagasView: BagasView?
    
    var data:[ModelTest] = [ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas"),
                            ModelTest(name: "Bagas", nameImage: "bagas")]
    
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
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BagasTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BagasTableViewCell.identifier, for: indexPath) as? BagasTableViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
