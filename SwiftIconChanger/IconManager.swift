//
//  IconManager.swift
//  SwiftIconChanger
//
//  Created by Birant Özek on 13.09.2021.
//

import Foundation
import UIKit

enum AppIcon: CaseIterable {
    
    case classic, Login
    
    var name: String? {
        switch self {
        case .classic:
            return nil
        case .Login:
            return "LoginIcon"
        }
    }
}

//check current icon
var current: AppIcon {
    return AppIcon.allCases.first(where: {$0.name == UIApplication.shared.alternateIconName}) ?? .classic
}


func setIcon(_ appIcon: AppIcon, completion: ((Bool) -> Void)? = nil) {
    guard current != appIcon, UIApplication.shared.supportsAlternateIcons
    else { return }
    
    UIApplication.shared.setAlternateIconName(appIcon.name) { error in
        if let error = error {
            print("Error setting the alternate icon \(appIcon.name ?? ""): \(error.localizedDescription)")
        }
        completion?(error != nil)
    }
}
