//
//  Extensions.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 31/05/21.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
