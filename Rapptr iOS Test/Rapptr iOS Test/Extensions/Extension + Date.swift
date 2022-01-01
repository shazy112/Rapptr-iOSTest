//
//  Extension + Date.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
extension Date {
    
    ///   Method to caluclate duration from a specified Date
    /// - Returns: returns formatted time interval in string
    func getTimeInvertal() -> String {
        let executionTime = Date().timeIntervalSince(self)
        let dateFormatter = DateComponentsFormatter()
        dateFormatter.allowedUnits = [.hour, .minute, .second]
        dateFormatter.unitsStyle = .full
        guard let formattedTimeInterval = dateFormatter.string(from: executionTime) else {return ""}
        return formattedTimeInterval
    }
}
