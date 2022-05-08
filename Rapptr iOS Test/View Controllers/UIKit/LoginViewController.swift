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
    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        validateTextFields()
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
}

// MARK: - Service Calls
extension LoginViewController {
    
    /// Attempts to login and then will either display a success or
    /// failure alert depending on server response
    /// - Parameters:
    ///   - email: email string
    ///   - password: password string
    func attemptLogin(email: String, password: String) {
        
        Task(priority: .userInitiated) {
            let startTime = Date()

            do {
                let successResponse = try await LoginService.shareInstance.login(email: email, password: password)
                displayLoginSuccess(successResponse: successResponse, executionTime: Date().timeIntervalSince(startTime))
            } catch NetworkError.loginError(let failureResponse) {
                displayLoginFailure(failureResponse: failureResponse)
            } catch {
                displayLoginFailure(error: error)
            }
        }
    }
}

// MARK: - Alerts
extension LoginViewController {
    
    /// Displays success alert with response information
    /// pops view on action click
    /// - Parameters:
    ///   - successResponse: response from login service
    ///   - executionTime: time interval for how long response took
    func displayLoginSuccess(successResponse: LoginResponse, executionTime: TimeInterval) {
        let alert = UIAlertController(title: "Login Success",
                                      message: successResponse.message + "\nRequest took: \(Int((executionTime.truncatingRemainder(dividingBy: 1)) * 1000)) ms",
                                      preferredStyle: .alert)
        let dismissOk = UIAlertAction(title: "Ok", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(dismissOk)
        present(alert, animated: true)
    }
    
    /// Displays failure alert with server error response or generalized error
    /// - Parameters:
    ///   - failureResponse: optional error response from login service
    ///   - error: optional generalized alert
    func displayLoginFailure(failureResponse: LoginResponse? = nil, error: Error? = nil) {
        let alert = UIAlertController(title: "Login Failure",
                                      message: failureResponse?.message ?? error?.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
