//
//  LoginFormView.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

protocol LoginFormViewDelegate: AnyObject {
    func login()
}

class LoginFormView: UIView, UITextFieldDelegate {
    
    weak var delegate: LoginFormViewDelegate?
    
    private var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()

    private var companyLogoImage: UIImageView = {
        let companyLogoImage = UIImageView()
        companyLogoImage.image = UIImage(named: "app_logo")
        companyLogoImage.contentMode = .scaleAspectFit
        companyLogoImage.translatesAutoresizingMaskIntoConstraints = false
        return companyLogoImage
    }()
    
    private var inglabAsessmentLabel: UILabel = {
        let inglabAsessmentLabel = UILabel()
        inglabAsessmentLabel.text = "inglabAsessment"
        inglabAsessmentLabel.textAlignment = .center
        inglabAsessmentLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        inglabAsessmentLabel.adjustsFontForContentSizeCategory = true
        inglabAsessmentLabel.translatesAutoresizingMaskIntoConstraints = false
        inglabAsessmentLabel.numberOfLines = 0
        return inglabAsessmentLabel
    }()
    
    private lazy var usernameTextField: TextFieldWithPadding = {
        let usernameTextField = TextFieldWithPadding(leftIcon: UIImage(named: "icon_user"))
        usernameTextField.placeholder = "Username"
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.font = UIFont.systemFont(ofSize: 20)
        usernameTextField.adjustsFontForContentSizeCategory = true
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor.lightGray.cgColor
        usernameTextField.layer.cornerRadius = 4
        usernameTextField.delegate = self
        return usernameTextField
    }()
    
    private var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "8 characters long and contains at least one uppercase letter and one digit"
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var passwordTextField: SecureTextField = {
        let passwordTextField = SecureTextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.font = UIFont.systemFont(ofSize: 20)
        passwordTextField.adjustsFontForContentSizeCategory = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private var actionButton: UIButton = {
        let actionButton = UIButton()
        actionButton.setTitleColor(UIColor.white, for: .normal)
        actionButton.setTitle("Login", for: .normal)
        actionButton.backgroundColor = .blue
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        actionButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        actionButton.layer.cornerRadius = 8.0
        actionButton.layer.masksToBounds = true
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.addTarget(self, action: #selector(didClickAction), for: .touchUpInside)
        return actionButton
    }()
        
    public init() {
        super.init(frame: .zero)
        createConstraint()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        createConstraint()
    }
    
    // MARK: UI FUNCTION
    private func createConstraint() {
        self.setHeaderConstraint()
        self.setTextfieldConstraint()
        self.setDescriptionLabelConstraint()
        self.setActionButtonConstraint()
    }
    
    private func setHeaderConstraint() {
        self.addSubview(backgroundImage)
        self.addSubview(companyLogoImage)
        self.addSubview(inglabAsessmentLabel)
        
        backgroundImage.leadingAnchor.constraint(
            equalTo: self.leadingAnchor
        ).isActive = true
        backgroundImage.topAnchor.constraint(
            equalTo: self.topAnchor
        ).isActive = true
        backgroundImage.bottomAnchor.constraint(
            equalTo: self.bottomAnchor
        ).isActive = true
        backgroundImage.trailingAnchor.constraint(
            equalTo: self.trailingAnchor
        ).isActive = true
        
        companyLogoImage.topAnchor.constraint(
            equalTo: self.topAnchor
        ).isActive = true
        companyLogoImage.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        companyLogoImage.widthAnchor.constraint(
            equalToConstant: 100
        ).isActive = true
        companyLogoImage.heightAnchor.constraint(
            equalToConstant: 150
        ).isActive = true
        
       
        inglabAsessmentLabel.topAnchor.constraint(
            equalTo: companyLogoImage.bottomAnchor,
            constant: 20
        ).isActive = true
        inglabAsessmentLabel.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        inglabAsessmentLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 20
        ).isActive = true
        inglabAsessmentLabel.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -20
        ).isActive = true
    }
    private func setTextfieldConstraint() {
        self.addSubview(usernameTextField)
        self.addSubview(passwordTextField)
        
        usernameTextField.topAnchor.constraint(
            equalTo: inglabAsessmentLabel.bottomAnchor,
            constant: 20
        ).isActive = true
        usernameTextField.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        usernameTextField.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 20
        ).isActive = true
        usernameTextField.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -20
        ).isActive = true
                
        passwordTextField.topAnchor.constraint(
            equalTo: usernameTextField.bottomAnchor,
            constant: 20
        ).isActive = true
        passwordTextField.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        passwordTextField.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 20
        ).isActive = true
        passwordTextField.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -20
        ).isActive = true
    }
    
    private func setDescriptionLabelConstraint() {
        self.addSubview(descriptionLabel)
        
        descriptionLabel.topAnchor.constraint(
            equalTo: passwordTextField.bottomAnchor,
            constant: 10
        ).isActive = true
        descriptionLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 25
        ).isActive = true
        descriptionLabel.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -25
        ).isActive = true
    }
    
    private func setActionButtonConstraint() {
        self.addSubview(actionButton)
        
        actionButton.bottomAnchor.constraint(
            equalTo: self.bottomAnchor,
            constant: -20
        ).isActive = true
        actionButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        actionButton.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 40
        ).isActive = true
        actionButton.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -40
        ).isActive = true
    }
    
    // MARK: AUTHENTICATION FUNCTION
    @objc func didClickAction() {
        // Perform login validation logic here
        if let password = passwordTextField.text {
          if isValidPassword(password) {
            // Login successful, navigate to the next screen
              delegate?.login()
          } else {
            // Login failed, show error message
              ToastView("Login failed", duration: .long).show()
          }
        }
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        //Check if password is at least 8 characters long and contains at least one uppercase letter and one digit
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
}
