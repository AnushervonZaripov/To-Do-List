//
//  ListView.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 20/09/24.
//

import UIKit
import SnapKit

class ListView: UIView {
    
    var toDoListLabel = UILabel()
    var tableView     = UITableView()
    var addTaskButton = UIButton()
    
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
        
        self.addSubview(toDoListLabel)
        toDoListLabel.text          = "To-Do-List"
        toDoListLabel.textAlignment = .center
        toDoListLabel.textColor     = .mainTextLabelColor
        toDoListLabel.font          = .systemFont(ofSize: 30)
        
        self.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.addSubview(addTaskButton)
        addTaskButton.setTitle("+", for: .normal)
        addTaskButton.setTitleColor(.mainTextLabelColor, for: .normal)
        addTaskButton.titleLabel?.font   = .systemFont(ofSize: 20)
        addTaskButton.backgroundColor    = UIColor(red: 103/255.0, green: 125/255.0, blue: 106/255.0, alpha: 1.0)
        addTaskButton.layer.cornerRadius = 10
    }
    
    func setUpConstraints(){
        toDoListLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.left.right.equalToSuperview().inset(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(toDoListLabel.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        addTaskButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.right.equalToSuperview().inset(20)
            make.width.height.equalTo(50)
        }
    }
}
