//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    private var client: LoginClient?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        configureNavBar()
        hideKeyboardWhenTappedAround()
    }
    
    func configureNavBar() {
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(dismissView))
        self.navigationItem.leftBarButtonItem = backBtn
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        validateTextFields()
    }
    
    @objc func dismissView() {
        //can either use flow controller or just parent reference to nav controller
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - TextField Delegate
extension LoginViewController: UITextFieldDelegate {
    
    /// Resign textfield and validate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        validateTextFields()
        return true
    }
    
    /// Checks if textfields are empty and sets first responder
    /// for the first one that is empty.
    ///
    /// If none are empty, attempts login
    func validateTextFields() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //can add additional validation rules but is empty fine for now
        if email.isEmpty {
            emailTextField.becomeFirstResponder()
            return
        }
        
        if password.isEmpty {
            passwordTextField.becomeFirstResponder()
            return
        }
        
        attemptLogin(email: email, password: password)
    }
    
    func attemptLogin(email: String, password: String) {
        let startTime = Date()

        print("logging in...")
        
        let executionTime = Date().timeIntervalSince(startTime)
        
        print("call took \(executionTime)")
    }
}
