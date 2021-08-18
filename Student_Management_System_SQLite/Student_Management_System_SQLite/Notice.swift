//
//  Notice.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 15/08/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import Foundation

class Notice {
    
    var id:Int = 0
    var title:String = ""
    var desc:String = ""
    
    init(id:Int, title:String, desc:String)
    {
        self.id = id
        self.title = title
        self.desc = desc
    }
    
}
