//
//  Date.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import Foundation

extension Date {
    func convertToDisplayDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "id_ID")
        
        return formatter.string(from: self)
    }
}
