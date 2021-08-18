//
//  Student.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 14/08/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import Foundation

class Student {
    
    var id:Int =  0
    var spid:Int = 0
    var name:String = ""
    var course:String = ""
    var password:String = ""
    
    init(id:Int , spid:Int, name:String, course:String ,password:String) {
        self.id = id
        self.spid = spid
        self.name = name
        self.course = course
        self.password = password
    }
    
}
