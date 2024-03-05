//
//  ViewController.swift
//  LoginApp
//
//  Created by Антон Баландин on 4.03.24.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var envelopImageView: UIImageView!
    @IBOutlet var lockImageView: UIImageView!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var emailLineView: UIView!
    @IBOutlet var passwordLineView: UIView!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    @IBOutlet var registerLabel: UILabel!
    
    // MARK: - Properties
    private let activeColor = UIColor(named: "milkPink") ?? UIColor.gray
    
    private var email: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray5
        }
    }
    private var password: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray5
        }
    }
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Actions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        if email == mockEmail && password == mockPassword {
            performSegue(withIdentifier: "goToSecondVC", sender: sender)
        } else {
            showAlert(title: "Oops!".localalized, message: "Wrong email or password  🤷‍♂️".localalized)
            emailTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        print("Register button pressed")
    }
    
    private func configureButton() {
        loginButton.layer.cornerRadius = 10
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray5
        
        // Shadow
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 5
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // обрезаем пробелы и абзацы
        guard let text = textField.text?.trimmingCharacters(in: 
                .whitespacesAndNewlines), !text.isEmpty else { return }
        
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
           
            
            if isValidEmail {
                email = text
                
                envelopImageView.tintColor = .systemGray5
                emailLineView.backgroundColor = .systemGray5
            } else {
                email = ""
                makeErrorField(textField: emailTextField)
            }
        case passwordTextField:
            let isValidPassword = check(password: text)
            
            loginButton.isUserInteractionEnabled = isValidPassword
            loginButton.backgroundColor = isValidPassword ? activeColor : .systemGray5
            
            if isValidPassword {
                password = text

                lockImageView.tintColor = .systemGray5
                passwordLineView.backgroundColor = .systemGray5
            } else {
                password = ""
                makeErrorField(textField: passwordTextField)
            }
        default:
            print("unknown textField")
        }
    }
    
    private func check(email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopImageView.tintColor = activeColor
            emailLineView.backgroundColor = activeColor
        case passwordTextField:
            lockImageView.tintColor = activeColor
            passwordLineView.backgroundColor = activeColor
        default:
            print("unknown textField")
        }
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
