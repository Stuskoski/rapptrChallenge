//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import SwiftUI

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - Rapptr Labs
     * =========================================================================================
     */
    
    var appFlowControllerDelegate: AppFlowControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coding Tasks"
        addMenuButtons()
    }
    
    private func addMenuButtons() {
        
        let chatButton = RapptrRoundedButton(text: "Chat", image: UIImage(named: "ic_chat")!, tapHandler: chatButtonTapped)
        let loginButton = RapptrRoundedButton(text: "Login", image: UIImage(named: "ic_login")!, tapHandler: loginButtonTapped)
        let animationButton = RapptrRoundedButton(text: "Animation", image: UIImage(named: "ic_animation")!, tapHandler: animationButtonTapped)
        
        let hStack = UIStackView(arrangedSubviews: [
            UIHostingController(rootView: chatButton).view,
            UIHostingController(rootView: loginButton).view,
            UIHostingController(rootView: animationButton).view
        ])
        
        view.addSubview(hStack)

        hStack.axis = .vertical
        hStack.center = view.center
        hStack.spacing = 24
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalCenterConstraint = NSLayoutConstraint(item: hStack,
                                                            attribute: NSLayoutConstraint.Attribute.centerX,
                                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                                            toItem: view,
                                                            attribute: NSLayoutConstraint.Attribute.centerX,
                                                            multiplier: 1,
                                                            constant: 0)
        
        let verticalCenterConstraint = NSLayoutConstraint(item: hStack,
                                                          attribute: NSLayoutConstraint.Attribute.centerY,
                                                          relatedBy: NSLayoutConstraint.Relation.equal,
                                                          toItem: view,
                                                          attribute: NSLayoutConstraint.Attribute.centerY,
                                                          multiplier: 1,
                                                          constant: 0)
        
        let leadingConstraint = NSLayoutConstraint(item: hStack,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 32)
        
        let trailingConstraint = NSLayoutConstraint(item: hStack,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 32)
        
        view.addConstraints([horizontalCenterConstraint, verticalCenterConstraint, leadingConstraint, trailingConstraint])
    }
}

// MARK: - Actions
extension MenuViewController {
    private func chatButtonTapped() {
        appFlowControllerDelegate?.navigateToChat()
    }
    
    private func loginButtonTapped() {
        appFlowControllerDelegate?.navigateToLogin()
    }
    
    private func animationButtonTapped() {
        appFlowControllerDelegate?.navigateToAnimation()
    }
}
