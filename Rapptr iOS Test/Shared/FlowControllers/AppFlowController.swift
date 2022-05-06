//
//  AppFlowController.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/6/22.
//

import Foundation
import UIKit

protocol AppFlowControllerDelegate {
    func popCurrentVC()
    func navigateToChat()
    func navigateToLogin()
    func navigateToAnimation()
}

// MARK: - Setup
class AppFlowController: UIViewController, AppFlowControllerDelegate {
    
    private let navController = UINavigationController()
    
    // Default screen is orders table vc for this flow
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        menuViewController.appFlowControllerDelegate = self
        
        navController.show(menuViewController, sender: self)
        addChildVC(navController)
    }
}

// MARK: - Navigation
extension AppFlowController {
    
    func popCurrentVC() {
        navController.popViewController(animated: true)
    }
    
    func navigateToChat() {
        let chatViewController = ChatViewController()
        chatViewController.appFlowControllerDelegate = self
        navController.pushViewController(chatViewController, animated: true)
    }
    
    func navigateToLogin() {
        let loginViewController = LoginViewController()
        navController.pushViewController(loginViewController, animated: true)
    }
    
    func navigateToAnimation() {
        let animationViewController = AnimationViewController()
        navController.pushViewController(animationViewController, animated: true)
    }
}

