//
//  ViewController.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 24/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sql = SQLhandler.sh
    
    private let mybg:UIImageView = {
        let bg = UIImageView()
        bg.image = UIImage(named: "StartPageBG")
        return bg
    }()
    
    private let btnNext:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(handleBtnNext), for: .touchUpInside)
        return btn
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(mybg)
        view.addSubview(btnNext)
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mybg.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        btnNext.frame = CGRect(x: 120, y: view.bottom - 120, width: 150, height: 40)
        
        
    }

    @objc func handleBtnNext()
    {
        print("Btn clicked")
        
        let vc = AdminStudVC()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

