//
//  ListViewController.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 20/09/24.
//

import UIKit

class ListViewController: UIViewController {
    
    private let listView = ListView()
    var tasks: [String]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.tableView.delegate   = self
        listView.tableView.dataSource = self
        setUpView()
        
        let customBackButton = UIBarButtonItem(
            title: "< Back",
            style: .plain,
            target: self,
            action: #selector(customBackAction))
        customBackButton.tintColor = .mainTextLabelColor
        
        self.navigationItem.leftBarButtonItem = customBackButton
        listView.addTaskButton.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
    }
    
    @objc func customBackAction() {
        print("Нажата кнопка 'Назад'")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpView(){
        view.backgroundColor = .mainBackGroundColor
        view.addSubview(listView)
        
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func addTaskButtonTapped() {
        let editTaskViewCcontroller      = EditTaskViewController()
        editTaskViewCcontroller.saveTask = {text in
            self.tasks.append(text)
            self.listView.tableView.reloadData()
        }
        navigationController?.pushViewController(editTaskViewCcontroller, animated: true)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
