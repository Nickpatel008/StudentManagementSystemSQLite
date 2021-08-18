//
//  StudentHomePageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 30/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class StudentHomePageVC: UIViewController {
    
    var studArr:[Student] = []
    
     private let mylabel:UILabel = {
         let lbl = UILabel()
         lbl.text = "Welcome Student"
         lbl.font = UIFont.boldSystemFont(ofSize: 20)
         lbl.textColor = .black
         return lbl
     } ()
     
     private let logOutBtn:UIButton = {
         let btn = UIButton()
         btn.backgroundColor = .red
         btn.setTitle("Log out", for: .normal)
        btn.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
         btn.tintColor = .black
         return btn
     } ()
     
     private let noticeBoardBTN:UIButton = {
         let btn = UIButton()
         btn.backgroundColor = .systemGreen
         btn.setTitle("Profile", for: .normal)
         btn.addTarget(self, action: #selector(handleProfileBtn), for: .touchUpInside)
         btn.tintColor = .black
         return btn
     } ()
     
     private let databaseBTN:UIButton = {
         let btn = UIButton()
         btn.backgroundColor = .purple
         btn.setTitle("New Notices", for: .normal)
         btn.addTarget(self, action: #selector(handleNoticeBtn), for: .touchUpInside)
         btn.tintColor = .black
         return btn
     } ()
     
     private let addStudBtn:UIButton = {
         let btn = UIButton()
         btn.backgroundColor = .blue
         btn.setTitle("Chnage Password", for: .normal)
         btn.addTarget(self, action: #selector(handleChangePasswordBtn), for: .touchUpInside)
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
     
    @objc func handleProfileBtn(_ sender: UIButton)
     {
        let vc = StudentProfilePageVC()
        navigationController?.pushViewController(vc, animated: true)
     }
     
     @objc func handleNoticeBtn()
     {
         let vc = StudentNoticeBoardVC()
         navigationController?.pushViewController(vc, animated: true)
     }
     
     @objc func handleChangePasswordBtn()
     {
         let vc = StudentChnagePasswordVC()
         navigationController?.pushViewController(vc, animated: true)
     }
    
    @objc func handleLogout(){
        print("LogOut btn clicked...")
        UserDefaults.standard.set(nil, forKey: "user")
        UserDefaults.standard.set(nil, forKey: "TokenKey")
    }

    func checkAuth()
    {
        if let token = UserDefaults.standard.string(forKey: "TokenKey"),
            let user = UserDefaults.standard.string(forKey: "user") {
            print("token = \(token) user = \(user)")
            print("logged in...")
        }
        else
        {
            let vc = Student_Login_PageVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
