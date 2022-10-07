//
//  LoginScreenHome.swift
//  PokemonStudy
//
//  Created by Diego Fernando Siqueira Silva on 21/09/22.
//

import UIKit
import SnapKit

protocol LoginScreenHomeProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreenHome: UIView {
    
    weak var delegate: LoginScreenHomeProtocol?
    
    func delegate(delegate:LoginScreenHomeProtocol?) {
        self.delegate = delegate
    }

    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Bem Vindo"
       return label
    }()
    
    lazy var imageLoginHome:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pokemon1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField:UITextField = {
         let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu email:"
        textField.textColor = .black
        return textField
    }()
    
    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
       textField.translatesAutoresizingMaskIntoConstraints = false
       textField.autocorrectionType = .no
       textField.backgroundColor = .white
       textField.borderStyle = .roundedRect
       textField.keyboardType = .default
       textField.isSecureTextEntry = true
       textField.placeholder = "Digite sua senha:"
       textField.textColor = .black
       return textField
    }()

    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.4
        button.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 104/255, alpha: 0.5)
        button.addTarget(self, action: #selector(self.tappedloginButton), for: .touchUpInside)
       return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tappedregisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackGround()
        configSuperView()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 50/255, green: 120/255, blue: 104/255, alpha: 2.0)
    }
    
    private func configSuperView(){
        self.addSubview(loginLabel)
        self.addSubview(imageLoginHome)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegete(delegate:UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedloginButton(){
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedregisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    func configContraints(){
        NSLayoutConstraint.activate([
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.imageLoginHome.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 10),
            self.imageLoginHome.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.imageLoginHome.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            
            self.imageLoginHome.heightAnchor.constraint(equalToConstant: 200),
            self.imageLoginHome.widthAnchor.constraint(equalToConstant: 200),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.imageLoginHome.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            self.emailTextField.widthAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
}
