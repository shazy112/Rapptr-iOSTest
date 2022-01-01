//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import Alamofire

class LoginViewController: BaseViewController {
    
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
    private var client: LoginClient = LoginClient()
    @IBOutlet weak private var emailTextField: PrimaryTextField!
    @IBOutlet weak private var passwordTextField: PrimaryTextField!
    @IBOutlet weak private var loginButton: PrimaryButton!
    @IBOutlet weak private var stackView: UIStackView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    // MARK: - Supporting Methods
    private func prepareView() {
        title = "Login"
        setupBackgroundImage(with: UIImage(named: "img_login"))
        setupViewConstraints()
    }
    
    /// checks if both textfields are filled before sending Login API
     private func validateTextField() -> Bool {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            createAlert(title: Constants.emptyEmailPass)
            return false
        }
        return true
    }
    
    ///Setup view constraints
    private func setupViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        loginButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func setLoginButtonToDefault() {
        DispatchQueue.main.async {[weak self] in
            self?.loginButton.stopActivityIndicator()
            self?.loginButton.setTitle(Constants.login, for: .normal)
        }
    }
    
    private func callLoginApi() {
        if validateTextField() {
            loginButton.startActivityIndicator()
            loginButton.setTitle("", for: .normal)
            client.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") {[weak self] login, apiResponseTime  in
                self?.setLoginButtonToDefault()
                self?.createAlert(title: login.message ?? "", message: "Api Response Time: \(apiResponseTime)") {
                    DispatchQueue.main.async {[weak self] in
                        self?.navigationController?.popViewController(animated: true)
                    }
                }
            } failure: { message in
                DispatchQueue.main.async {[weak self] in
                    self?.setLoginButtonToDefault()
                    self?.createAlert(title: message, message: Constants.incorrectEmailPass)
                }
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        callLoginApi()
    }
}
