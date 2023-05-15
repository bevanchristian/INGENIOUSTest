//
//  ToastView.swift
//  INGENIOUSBevan
//
//  Created by bevan on 13/05/23.
//

import UIKit


public class ToastView: UIView {
    
    public enum ToastDuration: Double {
        case short = 2.0
        case long = 3.5
    }
        
    private let labelTitle: UILabel = {
        let labelTitle =  UILabel()
        labelTitle.font = UIFont.systemFont(ofSize: 14)
        labelTitle.numberOfLines = 0
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textColor = UIColor.white
        labelTitle.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return labelTitle
    }()
    
    var text: String?
    lazy var duration: ToastDuration = .short
    
    public init(_ text: String?, duration: ToastDuration = .short) {
        super.init(frame: .zero)
        self.labelTitle.text = text
        
        createViews()
        setUiComponent()
    }
        
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    @objc func didClickClose() {
        dismiss()
    }
    
    public func show() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.duration.rawValue) {
                self.dismiss()
            }
        }
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.removeFromSuperview()
            }
        }
    }
    
    private func createViews() {
        alpha = 0
        backgroundColor = UIColor.red
        layer.cornerRadius = 8.0
        setConstraint()
    }
    
    private func setConstraint() {
        guard let view = UIApplication.getTopViewController()?.view else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelTitle)
        view.addSubview(self)
        
        leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16).isActive = true
        trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true

        labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    private func setUiComponent() {
        labelTitle.textColor = UIColor.white
        backgroundColor = UIColor.red
    }
}
