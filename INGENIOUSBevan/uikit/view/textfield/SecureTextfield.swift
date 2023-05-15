//
//  SecureTextfield.swift
//  INGENIOUSBevan
//
//  Created by bevan on 14/05/23.
//

import UIKit

class SecureTextField: UITextField {
    
    private var textPadding = UIEdgeInsets(
        top: 10,
        left: 0,
        bottom: 10,
        right: 30
    )
    // MARK: - Properties
    
    private let passwordToggle = UIButton(type: .custom)
    private let companyLogo = UIImageView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        // Set up password toggle button
        passwordToggle.setImage(UIImage(named: "icon_eye_close"), for: .normal)
        passwordToggle.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        passwordToggle.tintColor = .lightGray
        passwordToggle.addTarget(self, action: #selector(passwordToggleTapped), for: .touchUpInside)
    
        let paddingRightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        paddingRightView.addSubview(passwordToggle)
        paddingRightView.frame.size.width += 20
        rightView = paddingRightView
        rightViewMode = .always

        
        // Set up company logo
        companyLogo.image = UIImage(named: "icon_password")
        companyLogo.contentMode = .scaleAspectFit
        companyLogo.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        let companyLogoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        companyLogoContainer.addSubview(companyLogo)
        leftView = companyLogoContainer
        leftViewMode = .always
    }
    
    @objc private func passwordToggleTapped() {
        isSecureTextEntry.toggle()
        passwordToggle.setImage(
            UIImage(
                named: isSecureTextEntry ? "icon_eye_open" : "icon_eye_close"),
            for: .normal
        )
    }
    
}
