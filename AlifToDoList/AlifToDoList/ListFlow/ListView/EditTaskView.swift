//
//  EditTaskView.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 20/09/24.
//

import UIKit

class EditTaskView: UIView {
    
    var taskLabel      = UILabel()
    var taskTextField  = UITextField()
    var saveTaskButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.backgroundColor = .mainBackGroundColor
        
        self.addSubview(taskLabel)
        taskLabel.text      = "Title"
        taskLabel.textColor = .mainTextLabelColor
        
        self.addSubview(taskTextField)
        taskTextField.placeholder        = "Task"
        taskTextField.layer.cornerRadius = 10
        taskTextField.backgroundColor    = .mainTextLabelColor
        
        self.addSubview(saveTaskButton)
        saveTaskButton.setTitle("Save", for: .normal)
        saveTaskButton.setTitleColor(.mainTextLabelColor, for: .normal)
        saveTaskButton.backgroundColor = UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0)
        saveTaskButton.layer.cornerRadius = 16
    }
    
    func setUpConstraints(){
        taskLabel.snp.makeConstraints(){
            make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().inset(10)}
        
        taskTextField.snp.makeConstraints(){
            make in
            make.top.equalTo(taskLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
        
        saveTaskButton.snp.makeConstraints(){
            make in
            make.top.equalTo(taskTextField.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
    }
}
