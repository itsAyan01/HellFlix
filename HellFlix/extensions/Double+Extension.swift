//
//  Double+Extension.swift
//  HellFlix
//
//  Created by Ayan Ansari on 27/04/23.
//

import Foundation

extension Double {
    
    func convertIntoDollars() -> String {
        self.formatted(.currency(code: "USD"))
    }
    
}
