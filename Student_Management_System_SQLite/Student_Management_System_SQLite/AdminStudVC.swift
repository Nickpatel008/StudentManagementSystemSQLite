//
//  AdminStudVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 24/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class AdminStudVC: UIViewController {

    private let mylabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Choose Your Role"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 40)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let adminBtn:UIButton = {
        let btn = UIButton()
        //btn.setTitle("adminBtn", for: .normal)
        btn.setBackgroundImage(UIImage(named: "adminBtn"), for: .normal)
        //btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(handleAdminBtn), for: .touchUpInside)
        return btn
    } ()
    
    private let studentBtn:UIButton = {
        let btn = UIButton()
        //btn.setTitle("adminBtn", for: .normal)
        btn.setBackgroundImage(UIImage(named: "studentBtn"), for: .normal)
        //btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(handleStudentBtn), for: .touchUpInside)
        return btn
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(mylabel)
        view.addSubview(adminBtn)
        view.addSubview(studentBtn)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mylabel.frame = CGRect(x: 80, y: 80, width: 200, height: 40)
        adminBtn.frame = CGRect(x: 60, y: 150, width: 250, height: 200)
        studentBtn.frame = CGRect(x: 60, y: 350, width: 250, height: 200)
        
    }
    
    @objc func handleAdminBtn()
    {
        print("Admin Login Button clicked...")
        
        let vc = AdminHomePageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleStudentBtn()
    {
        print("Student Login Button clicked...")
        
        let vc = StudentHomePageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
   
}
