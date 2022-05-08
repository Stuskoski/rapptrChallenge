//
//  ThemeHelper.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/6/22.
//

import Foundation
import UIKit

enum Theme {
    case light
}

class ThemeHelper {
    
    ///global theme, only light supported at this time
    func applyTheme(theme: Theme) {
        
        switch theme {
        case .light:
            let navbarAppearance = UINavigationBarAppearance()
            navbarAppearance.configureWithOpaqueBackground()
            navbarAppearance.backgroundColor = .RapptrColors.rapptrBlue
            navbarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]

            UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
            
            UINavigationBar.appearance().standardAppearance = navbarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
        }
        
    }
    
}
