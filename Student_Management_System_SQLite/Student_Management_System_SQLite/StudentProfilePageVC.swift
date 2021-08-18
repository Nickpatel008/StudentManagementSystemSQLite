//
//  StudentProfilePageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 30/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class StudentProfilePageVC: UIViewController {

    var Sql = SQLhandler.sh
    
    var id = Int32(UserDefaults.standard.string(forKey: "id")!)
   
    var studArr:[Student] = []
      
       private let mylabel:UILabel = {
           let lbl = UILabel()
           lbl.text = "Profile"
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
           lbl.text = "Name"
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
           txt.placeholder = "Enter Name"
        txt.text = ""
           txt.textAlignment = .center
           return txt
       } ()
       
       private let mySpidLbl:UILabel = {
           let lbl = UILabel()
           lbl.text = "SPID"
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
           txt.placeholder = "Enter SPID"
        txt.text = ""
           txt.textAlignment = .center
           return txt
       } ()
       
       private let myCourseLbl:UILabel = {
           let lbl = UILabel()
           lbl.text = "Course"
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
           txt.placeholder = "Enter Course"
           txt.textAlignment = .center
           return txt
       } ()
       
       private let addStudbtn:UIButton = {
           let btn = UIButton()
           btn.setTitle("Update", for: .normal)
           btn.backgroundColor = .green
           btn.addTarget(self, action: #selector(handleAddStudBtn), for: .touchUpInside)
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
         
        
            studArr = Sql.fetchStudId(id: Int(id!))
            myNameTxt.text = studArr[0].name
            mySpidTxt.text = String(studArr[0].spid)
            myCoursetxt.text = studArr[0].course
        
            print(id)
            print(studArr)
        
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
           addStudbtn.frame = CGRect(x: 90, y: 580, width: 200, height: 40)
           
           
       }
    
        @objc func handleHomeBtn()
        {
            navigationController?.popViewController(animated: true)
        }
       
        @objc func handleAddStudBtn()
        {
            
            let name = myNameTxt.text
            let spid = mySpidTxt.text
            let course = myCoursetxt.text 
            
            
            let index = Sql.updateStud(stud: Student(id: Int(id!), spid: Int(spid!)!
                , name: name!, course: course!, password: studArr[0].password))
            
            if index == 0 {
                    print("Successfully...")
            }
            else
            {
                print("error")
            }
            
           let vc = StudentHomePageVC()
           navigationController?.pushViewController(vc, animated: true)
           // navigationController?.popViewController(animated: true)
        }

}
