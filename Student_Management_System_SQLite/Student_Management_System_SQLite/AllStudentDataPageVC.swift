//
//  AllStudentDataPageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 30/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class AllStudentDataPageVC: UIViewController {

    var Sql = SQLhandler.sh
    
    var studArr:[Student] = []
    
    private let myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(myTableView)
        
        setup()
        studArr = Sql.FetchStudent()
         
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = CGRect(x: 0, y: 40, width: view.width, height: view.height)
        
    }
 
}

extension AllStudentDataPageVC: UITableViewDelegate, UITableViewDataSource {
    
    func setup()
    {
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Student")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = " \(studArr[indexPath.row].id) | \(studArr[indexPath.row].spid) | \(studArr[indexPath.row].name) | \(studArr[indexPath.row].course) | \(studArr[indexPath.row].password)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            myTableView.beginUpdates()
            studArr.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
            myTableView.endUpdates()
            
            let index = Sql.deleteStudent(id: studArr[indexPath.row].id)
                        
            //print(studArr[indexPath.row].id)
            if index == 0
            {
                print("Record Deleted Successfully...")
            }
            else
            {
                print("Error While Deleting Record...")
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = AddNewStudentPageVC()
        vc.id = studArr[indexPath.row].id
    
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
