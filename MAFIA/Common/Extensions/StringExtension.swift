//
//  StringExtension.swift
//  MAFIA
//
//  Created by Santiago Carmona gonzalez on 12/20/17.
//  Copyright © 2017 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

extension String {

    /// Find the localized string in the Defaults string file
    /// - parameter withComment: comment
    /// - returns: Localized string if found, otherwise an empty string
    func localized(_ withComment: String = "") -> String {
        var localized = Bundle.main.localizedString(forKey: self, value: withComment, table: "Default")
        if localized == self {
            localized = Bundle.main.localizedString(forKey: self, value: withComment, table: nil)
            if localized == self {
                return self
            }
        }        
        return localized
    }
    
    func capitalizeFirst() -> String {
        let offset = 1
        if self.count >= offset {
            let firstIndex = self.index(startIndex, offsetBy: 1)
            return self[..<firstIndex].capitalized + self[firstIndex...].lowercased()
        } else {
            return ""
        }
    }
}
