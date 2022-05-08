//
//  MenuView+ViewModel.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/6/22.
//

import Foundation

extension MenuView {
    
    /// View model containing the 3 button tap handlers
    class ViewModel: ObservableObject {
        var chatTapHandler: (() -> Void)?
        var loginTapHandler: (() -> Void)?
        var animationTapHandler: (() -> Void)?
        
        init(chatTapHandler: (() -> Void)?,
             loginTapHandler: (() -> Void)?,
             animationTapHandler: (() -> Void)?){
            self.chatTapHandler = chatTapHandler
            self.loginTapHandler = loginTapHandler
            self.animationTapHandler = animationTapHandler
        }
    }
}
