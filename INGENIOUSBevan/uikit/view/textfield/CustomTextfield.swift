//
//  CustomTextfield.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

class TextFieldWithPadding: UITextField {
    
    // MARK: - Properties
    private var textPadding = UIEdgeInsets(
        top: 10,
        left: 0,
        bottom: 10,
        right: 30
    )
    
    private let leftIcon: UIImageView = {
        let leftIcon = UIImageView()
        return leftIcon
    }()
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    public init(frame: CGRect = .zero, leftIcon: UIImage? = nil) {
        super.init(frame: frame)
        if let image = leftIcon {
            self.leftIcon.image = image
        }
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        // Set up company logo
        leftIcon.contentMode = .scaleAspectFit
        leftIcon.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        let leftIconContainer = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 30,
                height: 20
            )
        )
        leftIconContainer.addSubview(leftIcon)
        leftView = leftIconContainer
        leftViewMode = .always
    }
    
}
