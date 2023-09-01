//
//  StringExtension.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import Foundation
extension String {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: self) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "d MMMM, yyyy"
            return outputDateFormatter.string(from: date)
        } else {
            return "Invalid date format"
        }
    }
}
