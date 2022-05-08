//
//  AnimationView+ViewModel.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/7/22.
//

import Foundation
import SwiftUI

enum FadeInOut: String {
    case fadeIn = "FADE IN"
    case fadeOut = "FADE OUT"
}

extension AnimationView {
    
    /// View model containing gesture and opacity logic
    /// for animation view
    class ViewModel: ObservableObject {
        @Published var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: 150)
        @Published var fadeInOut: FadeInOut = .fadeOut
        @Published var imageOpacity: CGFloat = 1
        
        var simpleDrag: some Gesture {
            DragGesture()
                .onChanged { value in
                    self.location = value.location
                }
        }
        
        var backBtnTapHandler: (() -> Void)?
        
        init(backBtnTapHandler: (() -> Void)?){
            self.backBtnTapHandler = backBtnTapHandler
        }
        
        /// Will switch over the enum to change the title
        /// of the button and then adjust opacity accordingly
        func fadeInOutButtonTap() {
            switch fadeInOut {
            case .fadeIn:
                imageOpacity = 1
                fadeInOut = .fadeOut
            case .fadeOut:
                imageOpacity = 0
                fadeInOut = .fadeIn
            }
        }
    }
}
