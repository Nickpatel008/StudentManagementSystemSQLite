//
//  NoticeBoardPageVC.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 30/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class NoticeBoardPageVC: UIViewController {

    var sql = SQLhandler.sh
    
    var noticeArr:[String] = []
    
    private let mylabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Notice Board"
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
    
    private let titleLbl:UILabel = {
          let lbl = UILabel()
          lbl.text = "Title"
          lbl.font = UIFont.boldSystemFont(ofSize: 15)
          lbl.textColor = .black
          return lbl
      } ()
    
    private let myTitleTxt:UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .white
        txt.textAlignment = .center
        txt.textColor = .blue
        txt.borderStyle = .line
        txt.placeholder = "Enter Title"
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let descriptionLbl:UILabel = {
          let lbl = UILabel()
          lbl.text = "Description"
          lbl.font = UIFont.boldSystemFont(ofSize: 15)
          lbl.textColor = .black
          return lbl
      } ()
    
       private let myDescriptionTxt:UITextField = {
            let txt = UITextField()
        txt.placeholder = "Enter Somthing..."
            txt.backgroundColor = .white
            txt.textAlignment = .left
            txt.borderStyle = .line
        txt.layer.cornerRadius = 20
            return txt
       }()
    
    
    private let SaveNoticeBtn:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.setTitle("Create Notice", for: .normal)
        btn.addTarget(self, action: #selector(handleSaveNoticeBtn), for: .touchUpInside)
        btn.tintColor = .black
        return btn
    } ()
    	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(mylabel)
        view.addSubview(logOutBtn)
        view.addSubview(titleLbl)
        view.addSubview(myTitleTxt)
        view.addSubview(descriptionLbl)
        view.addSubview(myDescriptionTxt)
        view.addSubview(SaveNoticeBtn)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mylabel.frame = CGRect(x: 40, y: 80, width: 300, height: 40)
        logOutBtn.frame = CGRect(x: 280, y: 80, width: 50, height: 40)
        titleLbl.frame = CGRect(x: 40, y: 180, width: 50, height: 40)
        myTitleTxt.frame = CGRect(x: 120, y: 180, width: 100, height: 40)
        descriptionLbl.frame = CGRect(x: 40, y: 270, width: 100, height: 40)
        myDescriptionTxt.frame = CGRect(x: 40, y: 320, width: 300, height: 100)
        SaveNoticeBtn.frame = CGRect(x: 150, y: 500, width: 150, height: 40)
        
    }
    
    @objc func handleHomeBtn()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSaveNoticeBtn()
    {
        
        let id = 0
        let title:String = myTitleTxt.text!
        let desc:String = myDescriptionTxt.text!
        
        let index = sql.insertNotice(nts: Notice(id: id, title: title, desc: desc))
        
        if index == 0 {
            print("Notice Inserted Successfully...")
            navigationController?.popViewController(animated: true)
        }
        else
        {
            print("Error in Notice Insertion...")
        }
        
    }
    
    
}
