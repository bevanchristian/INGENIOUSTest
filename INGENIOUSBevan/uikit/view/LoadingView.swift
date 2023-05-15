//
//  LoadingView.swift
//  INGENIOUSBevan
//
//  Created by bevan on 14/05/23.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: - Properties
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = .white
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Configure container view
        containerView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        containerView.frame = UIScreen.main.bounds

        // Configure activity indicator
        activityIndicatorView.center = containerView.center

        // Add subviews
        containerView.addSubview(activityIndicatorView)
    }

    func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(containerView)
        activityIndicatorView.startAnimating()
    }

    func hide() {
        activityIndicatorView.stopAnimating()
        containerView.removeFromSuperview()
    }
}
