//
//  Extension + Date.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
extension Date {
    
    /* Caluclates duration from a specified Date
     Multipled to 1000 to get time in ms
     */
    /// - Returns: time in ms
    func getTimeInvertal() -> Int  {
        return Int(Date().timeIntervalSince(self) * 1000)
    }
}
