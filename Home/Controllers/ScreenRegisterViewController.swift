import UIKit

class ScreenRegisterViewController: UIViewController {

    var screenRegisterView: ScreenRegisterView?
    
    override func loadView() {
        self.screenRegisterView = ScreenRegisterView()
        self.view = self.screenRegisterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenRegisterView?.configTextFieldDelegate(delegate: self)
        self.screenRegisterView?.delegate(delegate: self)
    }
}

extension ScreenRegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.screenRegisterView?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

extension ScreenRegisterViewController:ScreenRegisterViewProtocol {
    func actionButtonRegister() {
        self.navigationController?.popViewController(animated: true) // retorna a tela antetior
    }
}
