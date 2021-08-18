//
//  Admin_Login_PageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 25/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class Admin_Login_PageVC: UIViewController {
    
    private let mainLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Log in As Admin"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 40)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let fplbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "Forgot Password?"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 20)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let malbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "Wanna Make New Admin?"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 18)
        return lbl
    } ()
    
    private let adlbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "New Admin"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 40)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let usernameTxt:UITextField = {
       let txt = UITextField()
        txt.placeholder = "Enter Your Username or E-mail"
        txt.textAlignment = .center
        txt.textColor = .black
        txt.backgroundColor = .gray
        return txt
    } ()
    
    private let passwordTxt:UITextField = {
       let txt = UITextField()
        txt.placeholder = "Enter Your Password"
        txt.textAlignment = .center
        txt.textColor = .black
        txt.isSecureTextEntry = true
        txt.backgroundColor = .gray
        return txt
    } ()
    
    private let adminLoginBtn:UIButton = {
       let btn = UIButton()
        btn.setTitle("Log in", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(handleAdminLogin), for: .touchUpInside)
        return btn
    } ()
    
    private let mybg:UIImageView = {
        let bg = UIImageView()
        bg.image = UIImage(named: "loginpageBG")
        return bg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        view.addSubview(mybg)
        view.addSubview(mainLabel)
         
        view.addSubview(adminLoginBtn)
        
        view.addSubview(fplbl)
        view.addSubview(malbl)
        view.addSubview(adlbl)
        view.addSubview(usernameTxt)
        view.addSubview(passwordTxt)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mybg.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        mainLabel.frame = CGRect(x: 40, y: 210, width: 300, height: 40)
        
        usernameTxt.frame = CGRect(x: 60, y: 260, width: 230, height: 40)
        passwordTxt.frame = CGRect(x: 60, y: 320, width: 230, height: 40)
        
        adminLoginBtn.frame = CGRect(x: 90, y: 400, width: 200, height: 40)
        
        fplbl.frame = CGRect(x: 70, y: 450, width: 250, height: 40)
        malbl.frame = CGRect(x: 60, y: 520, width: 250, height: 40)
        adlbl.frame = CGRect(x: 150, y: 565, width: 100, height: 40)
        
    }

    @objc func handleAdminLogin()
    {
        
        if usernameTxt.text == "admin" && passwordTxt.text == "admin" {
            let vc = AdminHomePageVC()
            navigationController?.pushViewController(vc, animated: true)
            
            UserDefaults.standard.set(usernameTxt.text, forKey: "username")
            UserDefaults.standard.set("admin101", forKey: "Tokenkey")
            
        }
        else
        {
            print("Login unsuccessfull...")
            let alert = UIAlertController(title: "Error ", message: "Enter proper username and password...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert,animated: true,completion: nil)
            }
        }
        
    }
    
}
