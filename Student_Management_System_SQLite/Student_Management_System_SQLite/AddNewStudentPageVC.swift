//
//  AddNewStudentPageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 30/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class AddNewStudentPageVC: UIViewController {

    var Sql = SQLhandler.sh
    
    var id:Int = 0
    
    var studArr:[Student] = []
     
    private let mylabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Add Student"
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
        btn.setTitle("Add Student", for: .normal)
        btn.backgroundColor = .purple
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
        
        if id != 0 {
            studArr = Sql.fetchStudId(id: id)
            myNameTxt.text = studArr[0].name
            mySpidTxt.text = String(studArr[0].spid)
            myCoursetxt.text = studArr[0].course
            
            addStudbtn.setTitle("Update Student", for: .normal)
            
        }
    
        
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
    
     @objc func handleAddStudBtn()
     {
        //let vc = AdminHomePageVC()
        //navigationController?.pushViewController(vc, animated: true)
        // navigationController?.popViewController(animated: true)
        
        let spid = Int(mySpidTxt.text!)
        let name = myNameTxt.text
        let course = myCoursetxt.text
        let password = "pass"
        
        if id != 0 {
            let index = Sql.updateStud(stud: Student(id: id, spid: spid!, name: name!, course: course!, password: password))
              
            if index == 0 {
                print("Update Successfully...")
                let vc = AdminHomePageVC()
                navigationController?.pushViewController(vc, animated: true)
                
            }
            else
            {
                print("Error in Updatetion...")
            }
        }
        else
        {
            let index = Sql.studInsert(stud: Student(id: 0, spid: spid!, name: name!, course: course!, password: password))
              
            if index == 0 {
                print("Insertion Successfully...")
                navigationController?.popViewController(animated: true)
            }
            else
            {
                print("Error in Insertion...")
            }
        }
     }
        
}
