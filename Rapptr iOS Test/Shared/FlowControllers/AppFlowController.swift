//
//  AppFlowController.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/6/22.
//

import Foundation
import UIKit
import SwiftUI

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
        
        let menuView = MenuView(viewModel: MenuView.ViewModel(chatTapHandler: navigateToChat,
                                                              loginTapHandler: navigateToLogin,
                                                              animationTapHandler: navigateToAnimation))
        
        let menuHost = UIHostingController(rootView: menuView)
        navController.show(menuHost, sender: self)
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
        chatViewController.edgesForExtendedLayout = []
        navController.viewControllers.first?.navigationItem.backButtonTitle = ""
        navController.pushViewController(chatViewController, animated: true)
    }
    
    func navigateToLogin() {
        let loginViewController = LoginViewController()
        loginViewController.edgesForExtendedLayout = []
        navController.viewControllers.first?.navigationItem.backButtonTitle = ""
        navController.pushViewController(loginViewController, animated: true)
    }
    
    func navigateToAnimation() {
        let animationHost = UIHostingController(rootView: AnimationView(viewModel: AnimationView.ViewModel(backBtnTapHandler: popCurrentVC)))
        animationHost.edgesForExtendedLayout = []
        navController.viewControllers.first?.navigationItem.backButtonTitle = ""
        navController.pushViewController(animationHost, animated: true)
    }
}

