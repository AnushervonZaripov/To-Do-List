//
//  EditTaskViewController.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 20/09/24.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    private var mainView = EditTaskView()
    var saveTask:((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        mainView.saveTaskButton.addTarget(self, action: #selector(saveTaskTapped), for: .touchUpInside)
    }
    
    func setUpView(){
        view.backgroundColor = .mainBackGroundColor
        view.addSubview(mainView)
        mainView.snp.makeConstraints {
            make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func saveTaskTapped(){
        guard let textField = mainView.taskTextField.text, !textField.isEmpty else { return }
        saveTask?(textField)
        navigationController?.popViewController(animated: true)
    }
}
