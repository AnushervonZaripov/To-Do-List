//
//  ViewController.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 19/09/24.
//

import UIKit
import SnapKit
import KeychainSwift

class RegistrationViewController: UIViewController {
    
    private let viewModel = RegistrationViewModel()
    private let mainView = RegistrationView(registrationType: .signUp)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        mainView.haveAlreadyAccountButton.addTarget(self, action: #selector (haveAccountTapped), for: .touchUpInside)
        mainView.registrationButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setUpView() {
        view.backgroundColor = .mainBackGroundColor
        view.addSubview(mainView)
        mainView.snp.makeConstraints {
            make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func haveAccountTapped() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func registerButtonTapped(){
        print("Register button tapped")
        
        guard let login = mainView.regisrationEmailTextField.text, !login.isEmpty,
              let password = mainView.registrationPasswordTextField.text, !password.isEmpty else { return }
    
        if viewModel.registerUser(login: login, password: password) {
            print("User successfully registered")
            let listViewController = ListViewController()
            self.navigationController?.pushViewController(listViewController, animated: true)
        } else {
            print("Registration failed")
        }
    }
}


