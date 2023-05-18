//
//  ViewController.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginFormView: LoginFormView = {
        let loginFormView = LoginFormView()
        loginFormView.translatesAutoresizingMaskIntoConstraints = false
        return loginFormView
    }()
    
    private var loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        hideKeyboardWhenTappedAround()
        setDelegate()
    }
    
    private func setConstraint() {
        self.view.addSubview(loginFormView)
        loginFormView.leadingAnchor.constraint(
            equalTo: self.view.leadingAnchor
        ).isActive = true
        loginFormView.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        loginFormView.bottomAnchor.constraint(
            equalTo: self.view.bottomAnchor
        ).isActive = true
        loginFormView.trailingAnchor.constraint(
            equalTo: self.view.trailingAnchor
        ).isActive = true
    }

    private func setDelegate () {
        loginFormView.delegate = self
    }

}


extension LoginViewController: LoginFormViewDelegate {
    func login() {
        loadingView.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let view = DetailListViewController()
            let presenter = DetailListPresenter()
            presenter.view = view
            view.presenter = presenter
            self.loadingView.hide()
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
