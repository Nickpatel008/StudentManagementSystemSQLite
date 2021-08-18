//
//  Extension.swift
//  Student_Management_System_SQLite
//
//  Created by Nick patel on 24/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public var height : CGFloat{return  frame.size.height}
    public var width : CGFloat{return  frame.size.width}
    public var top  : CGFloat{return frame.origin.y}
    public var left  : CGFloat{return frame.origin.x}
    public var right  : CGFloat{return frame.origin.x + frame.size.width}
    public var bottom  : CGFloat{return frame.origin.y + frame.size.height}
}
