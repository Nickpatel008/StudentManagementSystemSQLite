//
//  StudentChnagePasswordVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 30/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class StudentChnagePasswordVC: UIViewController {

       var Sql = SQLhandler.sh
       
       var id = Int32(UserDefaults.standard.string(forKey: "id")!)
      
       var studArr:[Student] = []
    
    
    
        private let mylabel:UILabel = {
            let lbl = UILabel()
            lbl.text = "Change Password"
            lbl.font = UIFont.boldSystemFont(ofSize: 25)
            lbl.textColor = .black
            return lbl
        } ()
        
        private let logOutBtn:UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .black
            btn.setTitle("Home", for: .normal)
            btn.addTarget(self, action: #selector(handleHomeBtn), for: .touchUpInside)
            btn.tintColor = .black
            return btn
        } ()
        
        private let myNamelbl:UILabel = {
            let lbl = UILabel()
            lbl.text = "Old Password"
            lbl.font = UIFont.boldSystemFont(ofSize: 20)
            lbl.textColor = .black
            return lbl
        } ()
        
        private let myNameTxt:UITextField = {
            let txt = UITextField()
            txt.textColor = .blue
            txt.backgroundColor = .white
            txt.borderStyle = .line
            txt.layer.cornerRadius = 5
            txt.placeholder = "Enter Old PAssword"
            txt.textAlignment = .center
            return txt
        } ()
        
        private let mySpidLbl:UILabel = {
            let lbl = UILabel()
            lbl.text = "New Password"
            lbl.font = UIFont.boldSystemFont(ofSize: 20)
            lbl.textColor = .black
            return lbl
        } ()
        
        private let mySpidTxt:UITextField = {
            let txt = UITextField()
            txt.textColor = .blue
            txt.backgroundColor = .white
            txt.borderStyle = .line
            txt.layer.cornerRadius = 5
            txt.placeholder = "Enter New Password"
            txt.textAlignment = .center
            return txt
        } ()
        
        private let myCourseLbl:UILabel = {
            let lbl = UILabel()
            lbl.text = "Re-Type New Password"
            lbl.font = UIFont.boldSystemFont(ofSize: 20)
            lbl.textColor = .black
            return lbl
        } ()
        
        private let myCoursetxt:UITextField = {
            let txt = UITextField()
            txt.textColor = .blue
            txt.backgroundColor = .white
            txt.borderStyle = .line
            txt.layer.cornerRadius = 5
            txt.placeholder = "Enter Re-type Password"
            txt.textAlignment = .center
            return txt
        } ()
        
        private let addStudbtn:UIButton = {
            let btn = UIButton()
            btn.setTitle("Update Password", for: .normal)
            btn.backgroundColor = .purple
            btn.addTarget(self, action: #selector(handleUpdatePassworBtn), for: .touchUpInside)
            return btn
        } ()
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            
            view.backgroundColor = .white
            
            view.addSubview(mylabel)
            view.addSubview(logOutBtn)
            view.addSubview(myNamelbl)
            view.addSubview(myNameTxt)
            view.addSubview(mySpidLbl)
            view.addSubview(mySpidTxt)
            view.addSubview(myCourseLbl)
            view.addSubview(myCoursetxt)
            view.addSubview(addStudbtn)
            
            print(id)
            
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            
            mylabel.frame = CGRect(x: 40, y: 80, width: 300, height: 40)
            logOutBtn.frame = CGRect(x: 280, y: 80, width: 50, height: 40)
            myNamelbl.frame = CGRect(x: 40, y: 200, width: 150, height: 40)
            myNameTxt.frame = CGRect(x: 40, y: 240, width: 270, height: 40)
            mySpidLbl.frame = CGRect(x: 40, y: 280, width: 150, height: 40)
            mySpidTxt.frame = CGRect(x: 40, y: 320, width: 270, height: 40)
            myCourseLbl.frame = CGRect(x: 40, y: 360, width: 150, height: 40)
            myCoursetxt.frame = CGRect(x: 40, y: 400, width: 270, height: 40)
            addStudbtn.frame = CGRect(x: 90, y: 500, width: 200, height: 40)
            
            
        }
     
         @objc func handleHomeBtn()
         {
             navigationController?.popViewController(animated: true)
         }
        
         @objc func handleUpdatePassworBtn()
         {
            let password = mySpidTxt.text
                       
            print(id)
            
            /*let index = Sql.updateStudPassword(stud: Student(id: Int(id!), spid: studArr[0].spid, name: studArr[0].name, course: studArr[0].course, password: password!))
                       
                       if index == 0 {
                               print("password update Successfully...")
                       }
                       else
                       {
                           print("error")
                       }
                       */
            let vc = StudentHomePageVC()
            navigationController?.pushViewController(vc, animated: true)
         }

}
