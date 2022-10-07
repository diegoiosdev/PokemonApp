import UIKit
import SnapKit

protocol ScreenRegisterViewProtocol: AnyObject {
    func actionButtonRegister()
}

class ScreenRegisterView: UIView {

     weak var delegate:ScreenRegisterViewProtocol?
    
    func delegate(delegate:ScreenRegisterViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var registeremailTextField:UITextField = {
         let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite um novo email:"
        textField.textColor = .black
        return textField
    }()
    lazy var registerPasswordTextField:UITextField = {
         let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Digite uma nova senha:"
        textField.textColor = .black
        return textField
    }()
    
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click para cadastrar!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 100/255, green: 150/255, blue: 150/255, alpha: 1)
        button.addTarget(self, action: #selector(self.tappedRegisteredButton), for: .touchUpInside)
        return button
    }()
    
    lazy var homeImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Charmander")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configBackGround()
        confighomeImageViewConstraints()
        configContraints()
        configButtonEnable(true)
    }
    
    private func configSuperView(){
        addSubview(registeremailTextField)
        addSubview(registerPasswordTextField)
        addSubview(registerButton)
        addSubview(homeImageView)
    }

    @objc private func tappedRegisteredButton(){
        self.delegate?.actionButtonRegister()
    }
    
    public func validateTextFields(){ // validação do campo email e senha
        
        let email:String = self.registeremailTextField.text ?? ""
        let password:String = self.registerPasswordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
            
        } else {
            self.configButtonEnable(true)
        }
    }
    
    private  func configButtonEnable(_ enable:Bool){ // logica
        
        if enable {
            self.registerButton.setTitleColor(.black, for: .normal)
            self.registerButton.isEnabled = true
            
        } else {
            
            self.registerButton.setTitleColor(.red, for: .normal)
            self.registerButton.isEnabled = true
        }
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 150/255, green: 200/255, blue: 200/255, alpha: 1)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.registeremailTextField.delegate = delegate
        self.registerPasswordTextField.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confighomeImageViewConstraints() {
        self.homeImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
    }
    
    func configContraints(){
        NSLayoutConstraint.activate([
        
            self.registeremailTextField.topAnchor.constraint(equalTo: self.homeImageView.topAnchor, constant: 150),
            self.registeremailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registeremailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registeremailTextField.heightAnchor.constraint(equalToConstant: 45),
            self.registeremailTextField.widthAnchor.constraint(equalToConstant: 45),
            
            self.registerPasswordTextField.topAnchor.constraint(equalTo: self.registeremailTextField.topAnchor, constant: 75),
            self.registerPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerPasswordTextField.heightAnchor.constraint(equalToConstant: 45),
            self.registerPasswordTextField.widthAnchor.constraint(equalToConstant: 45),
            
            self.registerButton.topAnchor.constraint(equalTo: self.registerPasswordTextField.topAnchor, constant: 80),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 45),
            self.registerButton.widthAnchor.constraint(equalToConstant: 45),
        ])
    }
}
