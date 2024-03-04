//
//  ViewController.swift
//  LoginApp
//
//  Created by Антон Баландин on 4.03.24.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var emailLineView: UIView!
    @IBOutlet var passwordLineView: UIView!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var registerLabel: UILabel!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    // MARK: - Actions
    @IBAction func loginButtonPressed() {
        print("Login button pressed")
    }
    
    @IBAction func registerButtonPressed() {
        print("Register button pressed")
    }
    
    private func configureButton() {
        loginButton.layer.cornerRadius = 10
        
        // Shadow
        loginButton.layer.shadowColor = UIColor.darkGray.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 4
    }
}
