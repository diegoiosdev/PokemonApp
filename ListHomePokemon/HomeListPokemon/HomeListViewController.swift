
import UIKit

class HomeListViewController: UIViewController {
    
    var listHomeView: ListHomeView?
    
    override func loadView() {
        self.listHomeView = ListHomeView()
        self.view = listHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
