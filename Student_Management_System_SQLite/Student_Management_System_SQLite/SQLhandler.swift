//
//  SQLhandler.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 14/08/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import Foundation
import SQLite3

class SQLhandler {
    
    static let sh = SQLhandler()
    
    let dbpath = "studmaster.sqlite"
    var db:OpaquePointer?
    
    private init()
    {
        db = OpenDataBase()
        CreateTableStudent()
        createNotice()
    }
   
    func OpenDataBase() -> OpaquePointer?
    {
        var createStatement:OpaquePointer? = nil
        let docURl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docURl.appendingPathComponent(dbpath)
        
        if sqlite3_open(fileUrl.path, &createStatement) == SQLITE_OK {
            print("Databse Created Successfully")
            print(fileUrl)
            return createStatement
        }
        else
        {
            print("Database not successfully created")
            return nil
        }
        
    }
    
    func CreateTableStudent()
    {
        let createTableQuery = """
            CREATE TABLE IF NOT EXISTS TBLSTUDENT(ID INTEGER PRIMARY KEY AUTOINCREMENT ,
                SPID INTEGER,
                NAME TEXT,
                COURSE TEXT,
                PASSWORD TEXT);
        """
        
        var createTableStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, createTableQuery, -1, &createTableStatement, nil) == SQLITE_OK {
            
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Table Created Successfully...")
            }
            else
            {
                print("Table Not Created...")
            }
            
        }
        else
        {
            print("Somthing Wrong in table Query...")
        }
        
        
    }
    
    func FetchStudent() -> [Student]
    {
        let selectStudQuery = """
            SELECT * FROM TBLSTUDENT;
        """
        
        var stud = [Student]()
        
        var selectStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, selectStudQuery, -1, &selectStatement, nil) == SQLITE_OK {
            
            while sqlite3_step(selectStatement) == SQLITE_ROW {
                
                let id = Int(sqlite3_column_int(selectStatement, 0))
                let spid = Int(sqlite3_column_int(selectStatement, 1))
                let name = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                let course = String(describing: String(cString: sqlite3_column_text(selectStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(selectStatement, 4)))
                 
                stud.append(Student(id: id, spid: spid, name: name, course: course, password: password))
                
                print("Data Fetched Successfully...")
                
            }
            
        }
        else
        {
            print("Error in SELECT Query...")
        }
        
        return stud
        
    }
    
    func FetchStudentProfie(id:Int) -> [Student]
    {
        let selectStudQuery = """
            SELECT * FROM TBLSTUDENT WHERE ID = ?;
        """
        
        var stud = [Student]()
        
        var selectStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, selectStudQuery, -1, &selectStatement, nil) == SQLITE_OK {
            
             sqlite3_bind_int(selectStatement, 1, Int32(id))
            
            while sqlite3_step(selectStatement) == SQLITE_ROW {
                
                let id = Int(sqlite3_column_int(selectStatement, 0))
                let spid = Int(sqlite3_column_int(selectStatement, 1))
                let name = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                let course = String(describing: String(cString: sqlite3_column_text(selectStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(selectStatement, 4)))
                 
                stud.append(Student(id: id, spid: spid, name: name, course: course, password: password))
                
                print("Data Fetched Successfully...")
               
            }
            
        }
        else
        {
            print("Error in SELECT Query...")
            
        }
        return stud
    }
    
    func createNotice()
    {
        let createNoticeQuery = """
            CREATE TABLE IF NOT EXISTS TBLNOTICE(
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                TITLE TEXT,
                DESC TEXT
            );
        """
        
        var createTableStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, createNoticeQuery, -1, &createTableStatement, nil) == SQLITE_OK {
            
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Notice Table Created")
            }
            
        }
        else
        {
            print("Error In Notice Table Query...")
        }
        
    }
    
    func studInsert(stud:Student) -> Int
    {
        let insertQuery = """
            INSERT INTO TBLSTUDENT(SPID,NAME,COURSE,PASSWORD) VALUES(?,?,?,?);
        """
        var insertStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, insertQuery, -1, &insertStatement , nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(stud.spid))
            sqlite3_bind_text(insertStatement, 2, (stud.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (stud.course as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (stud.password as NSString).utf8String, -1, nil)
        
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Insert Successfully...")
                return 0
            }
            else
            {
                print("Insertion Error...")
                return 1
            }
        
        }
        else
        {
            print("Insert Query Error...")
            return 1
        }
        
    }
    
    func deleteStudent(id:Int) -> Int
    {
        let deleteQuery = """
            DELETE FROM TBLSTUDENT WHERE ID = ?;
        """
        
        var deleteStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            
            print(id)
            
            if sqlite3_step(deleteStatement) == SQLITE_ROW {
                
                print("Delete Record Successfully...")
                return 0
            }
            else
            {
                print("Error In Delete Statement...")
                return 1
            }
            
        }
        else
        {
            print("Error in Delete Query...")
            return 1
        }
        
    }
    
    func updateStud(stud:Student) -> Int
    {
        let updateStudQuery = """
            UPDATE TBLSTUDENT SET SPID = ? , NAME = ? , COURSE = ? , PASSWORD = ? WHERE ID = ?;
        """
        var updateStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, updateStudQuery, -1, &updateStatement , nil) == SQLITE_OK {
            sqlite3_bind_int(updateStatement, 1, Int32(stud.spid))
            sqlite3_bind_text(updateStatement, 2, (stud.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (stud.course as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 4, (stud.password as NSString).utf8String, -1, nil)
        
            
            sqlite3_bind_int(updateStatement, 5, Int32(stud.id))
            
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Update Successfully...")
                return 0
            }
            else
            {
                print("Update Error...")
                return 1
            }
        
        }
        else
        {
            print("Update Query Error...")
            return 1
        }
        
    }
    
    func insertNotice(nts:Notice) -> Int
    {
        let insertNoticeQuery = """
            INSERT INTO TBLNOTICE(TITLE,DESC) VALUES(?,?);
        """
        
        var insertNoticeStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, insertNoticeQuery, -1, &insertNoticeStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(insertNoticeStatement, 1, (nts.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertNoticeStatement, 2, (nts.desc as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertNoticeStatement) == SQLITE_DONE{
                print("Notice Created Successfully...")
                return 0
            }
            else
            {
                print("Notice Not Created...")
                return 1
            }
            
        }
        else
        {
            print("Error In Insert Notice Statement...")
            return 1
        }
        
        
    }
    
    func fetchStudId(id:Int) -> [Student]
    {
        let selectStudQuery = """
            SELECT * FROM TBLSTUDENT WHERE ID = ?;
        """
        
        var stud = [Student]()
        
        var selectStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, selectStudQuery, -1, &selectStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(selectStatement, 1, Int32(id))
            
            if sqlite3_step(selectStatement) == SQLITE_ROW {
                
                let id = Int(sqlite3_column_int(selectStatement, 0))
                let spid = Int(sqlite3_column_int(selectStatement, 1))
                let name = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                let course = String(describing: String(cString: sqlite3_column_text(selectStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(selectStatement, 4)))
                 
                stud.append(Student(id: id, spid: spid, name: name, course: course, password: password))
                
                print("Data Fetched Successfully...")
                
            }
            
        }
        else
        {
            print("Error in SELECT Query...")
        }
        
        return stud
    }
    
    func select_student(name:String , password:String) -> [Student]
    {
        let select_stud = """
            SELECT * FROM TBLSTUDENT WHERE NAME = ? AND PASSWORD = ?;
        """
         var stud = [Student]()
        var selectStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, select_stud, -1, &selectStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(selectStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(selectStatement, 2, (password as NSString).utf8String, -1, nil)
        
            if sqlite3_step(selectStatement) == SQLITE_ROW {
                
                let id = Int(sqlite3_column_int(selectStatement, 0))
                let spid = Int(sqlite3_column_int(selectStatement, 1))
                let name = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                let course = String(describing: String(cString: sqlite3_column_text(selectStatement, 3)))
                let password = String(describing: String(cString: sqlite3_column_text(selectStatement, 4)))
                
                stud.append(Student(id: id, spid: spid, name: name, course: course, password: password))
                
                print("Data Fetched Successfully...")
                
                
            }
            else
            {
                
                print("Data Not Found...")
            }
        
        }
        else
        {
            print("error")
        }
        
        return stud
        
    }
    
    
    
    func fetchNotice() -> [Notice]
    {
        
        let selectNoticeQuery = """
        SELECT * FROM TBLNOTICE;
        """
        
        var noticeData = [Notice]()
        
        var SelectQueryStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, selectNoticeQuery, -1, &SelectQueryStatement, nil) == SQLITE_OK {
            
            while sqlite3_step(SelectQueryStatement) == SQLITE_ROW {
                
                let id = Int(sqlite3_column_int(SelectQueryStatement, 0))
                let title = String(cString: sqlite3_column_text(SelectQueryStatement, 1))
                let desc = String(cString: sqlite3_column_text(SelectQueryStatement, 2))
                
                noticeData.append(Notice(id: id, title: title, desc: desc))
                
                print("Fetched Successfully...")
                
            }
            
        }
        else
        {
            print("Data Not Found...")
        }
    
        return noticeData
        
    } 
    
    func updateStudPassword(stud:Student) -> Int
    {
        let updateStudQuery = """
            UPDATE TBLSTUDENT SET SPID = ? , NAME = ? , COURSE = ? , PASSWORD = ? WHERE ID = ?;
        """
        var updateStatement:OpaquePointer? = nil
        
        if sqlite3_prepare(db, updateStudQuery, -1, &updateStatement , nil) == SQLITE_OK {
            sqlite3_bind_int(updateStatement, 1, Int32(stud.spid))
            sqlite3_bind_text(updateStatement, 2, (stud.name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (stud.course as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 4, (stud.password as NSString).utf8String, -1, nil)
        
            
            sqlite3_bind_int(updateStatement, 5, Int32(stud.id))
            
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Update Password Successfully...")
                return 0
            }
            else
            {
                print("Update password Error...")
                return 1
            }
        
        }
        else
        {
            print("Update password Query Error...")
            return 1
        }
        
    }
    
    
    
}
