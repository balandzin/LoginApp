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
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    // MARK: - Actions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("Login button pressed")
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        print("Register button pressed")
    }
    
    private func configureButton() {
        loginButton.layer.cornerRadius = 10
        
        // Shadow
        loginButton.layer.shadowColor = (UIColor(named: "customColor") ?? UIColor.gray).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 5
    }
}
