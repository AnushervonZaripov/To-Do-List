//
//  LoginVC.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 19/09/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let mainView  = RegistrationView(registrationType: .signIn)
    private let viewModel = RegistrationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        let customBackButton = UIBarButtonItem(
            title: "< Back",
            style: .plain,
            target: self,
            action: #selector(customBackAction))
        customBackButton.tintColor = .mainTextLabelColor
        
        self.navigationItem.leftBarButtonItem = customBackButton
        mainView.registrationButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(){
        guard let login = mainView.regisrationEmailTextField.text, !login.isEmpty,
              let password = mainView.registrationPasswordTextField.text, !password.isEmpty else { return }
        
        if viewModel.authUser(login: login , password: password) {
            let listViewController = ListViewController()
            self.navigationController?.pushViewController(listViewController, animated: true)
        }
    }
    
    @objc func customBackAction() {
        print("Нажата кнопка 'Назад'")
        self.navigationController?.popViewController(animated: true)
        mainView.haveAlreadyAccountButton.isHidden = false
    }
    
    private func setUpView() {
        view.backgroundColor = .mainBackGroundColor
        view.addSubview(mainView)
        mainView.snp.makeConstraints {
            make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            mainView.haveAlreadyAccountButton.isHidden = true
        }
    }
}
