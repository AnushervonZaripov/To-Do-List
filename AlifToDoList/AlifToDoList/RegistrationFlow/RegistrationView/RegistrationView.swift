//
//  RegistrationView.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 19/09/24.
//

import UIKit
import SnapKit

enum RegistrationType {
    case signUp
    case signIn
}

class RegistrationView: UIView {
    
    var registrationLabel = UILabel()
    var regisrationEmailTextField = UITextField()
    var registrationPasswordTextField = UITextField()
    var registrationButton = UIButton()
    var haveAlreadyAccountButton = UIButton()
    
    convenience init(registrationType: RegistrationType?){
        self.init()
        fillContent(type: registrationType)
        setUpView()
        setUpConstraints()
    }
    
    private func fillContent(type: RegistrationType?) {
        switch type {
        case .signUp:
            registrationLabel.text = "Registration"
        case .signIn:
            registrationLabel.text = "Log In"
            haveAlreadyAccountButton.isHidden = true
            registrationButton.setTitle("Log in", for: .normal)
        case .none:
            break
        }
    }
    
    private func setUpView(){
        self.backgroundColor = .mainBackGroundColor
        
        self.addSubview(registrationLabel)
        
        registrationLabel.textAlignment = .center
        registrationLabel.textColor = .mainTextLabelColor
        registrationLabel.font = .systemFont(ofSize: 30)
        
        self.addSubview(regisrationEmailTextField)
        regisrationEmailTextField.attributedPlaceholder = NSAttributedString(string: " Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0)])
        regisrationEmailTextField.backgroundColor = .mainTextLabelColor
        regisrationEmailTextField.layer.cornerRadius = 10
        regisrationEmailTextField.layer.borderColor = UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0).cgColor // Цвет границы
        regisrationEmailTextField.layer.borderWidth = 2 // Толщина границы
        
        self.addSubview(registrationPasswordTextField)
        registrationPasswordTextField.isSecureTextEntry = true
        registrationPasswordTextField.attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0)])
        registrationPasswordTextField.backgroundColor = .mainTextLabelColor
        registrationPasswordTextField.layer.cornerRadius = 10
        registrationPasswordTextField.layer.borderColor = UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0).cgColor // Цвет границы
        registrationPasswordTextField.layer.borderWidth = 2
        
        
        self.addSubview(registrationButton)
        registrationButton.setTitle("Register", for: .normal)
        registrationButton.setTitleColor(.mainTextLabelColor, for: .normal)
        registrationButton.backgroundColor = UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0)
        registrationButton.layer.cornerRadius = 10
        
        self.addSubview(haveAlreadyAccountButton)
        haveAlreadyAccountButton.setTitle("I already have an account", for: .normal)
        haveAlreadyAccountButton.setTitleColor(UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0), for: .normal)
    }
    
    
    private func setUpConstraints() {
        registrationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(230)
            make.left.right.equalToSuperview().inset(16)}
        
        regisrationEmailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(280)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(30)
        }
        
        registrationPasswordTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(330)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(30)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(380)
            make.left.right.equalToSuperview().inset(150)
        }
        
        haveAlreadyAccountButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(430)
            make.left.right.equalToSuperview().inset(40)
        }
    }
}
