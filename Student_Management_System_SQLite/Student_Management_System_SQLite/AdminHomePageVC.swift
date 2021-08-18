//
//  AdminHomePageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 28/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class AdminHomePageVC: UIViewController {

    private let mylabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome Admin"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .black
        return lbl
    } ()
    
    private let logOutBtn:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitle("Log out", for: .normal)
        btn.addTarget(self, action: #selector(logoutBtn), for: .touchUpInside)
        btn.tintColor = .black
        return btn
    } ()
    
    private let noticeBoardBTN:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.setTitle("Notice Board", for: .normal)
        btn.addTarget(self, action: #selector(handleNoticeBoardPage), for: .touchUpInside)
        btn.tintColor = .black
        return btn
    } ()
    
    private let databaseBTN:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .purple
        btn.setTitle("Fetch All Student Data", for: .normal)
        btn.addTarget(self, action: #selector(handleDatabasePage), for: .touchUpInside)
        btn.tintColor = .black
        return btn
    } ()
    
    private let addStudBtn:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Add New Student", for: .normal)
        btn.addTarget(self, action: #selector(handleAddStudentPage), for: .touchUpInside)
        return btn
    } ()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(mylabel)
        view.addSubview(logOutBtn)
        view.addSubview(noticeBoardBTN)
        view.addSubview(databaseBTN)
        view.addSubview(addStudBtn)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         checkAuth()
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mylabel.frame = CGRect(x: 40, y: 80, width: 300, height: 40)
        logOutBtn.frame = CGRect(x: 230, y: 80, width: 100, height: 40)
        noticeBoardBTN.frame = CGRect(x: 40, y: 180, width: 300, height: 80)
        databaseBTN.frame = CGRect(x: 40, y: noticeBoardBTN.bottom + 40, width: 300, height: 80)
        addStudBtn.frame = CGRect(x: 40, y: databaseBTN.bottom + 40, width: 300, height: 80)

    }
    
    @objc func handleNoticeBoardPage()
    {
        let vc = NoticeBoardPageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleDatabasePage()
    {
        let vc = AllStudentDataPageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleAddStudentPage()
    {
        let vc = AddNewStudentPageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logoutBtn()
    {
        UserDefaults.standard.set(nil, forKey:"username")
        UserDefaults.standard.set(nil, forKey:"Tokenkey")
    }
    
    @objc func checkAuth(){
           if let token = UserDefaults.standard.string(forKey: "Tokenkey"),
               let name  = UserDefaults.standard.string(forKey: "username"){
               print("\(token) ,name :- \(name)")
           }else{
                let vc = Admin_Login_PageVC ()
                navigationController?.pushViewController(vc, animated: true)
           }
       }
    
}
