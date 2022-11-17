import UIKit

class LoginViewController: UIViewController {
  
    var loginScreenHome: LoginScreenHome?
    var pokemonListViewController: PokemonListViewController?
    
    override func loadView() {
        self.loginScreenHome = LoginScreenHome()
        self.view = self.loginScreenHome
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreenHome?.delegate(delegate: self)
        self.loginScreenHome?.configTextFieldDelegete(delegate: self)
    }
}

extension LoginViewController:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: LoginScreenHomeProtocol {
    
    func actionLoginButton() {
        let pokemonListViewController = PokemonListViewController()
        self.navigationController?.pushViewController(pokemonListViewController, animated: true)
    }
    
    func actionRegisterButton() {
        let screenRegisterViewController = ScreenRegisterViewController()
        self.navigationController?.pushViewController(screenRegisterViewController, animated: true)
    }
}
