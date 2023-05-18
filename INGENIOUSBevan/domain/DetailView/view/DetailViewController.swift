//
//  DetailViewController.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailFormView: DetailProfileView = {
        let detailFormView = DetailProfileView()
        detailFormView.translatesAutoresizingMaskIntoConstraints = false
        return detailFormView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setView()
    }
    
    private func setView() {
        self.view.addSubview(detailFormView)
        detailFormView.leadingAnchor.constraint(
            equalTo: self.view.leadingAnchor
        ).isActive = true
        detailFormView.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        detailFormView.bottomAnchor.constraint(
            equalTo: self.view.bottomAnchor
        ).isActive = true
        detailFormView.trailingAnchor.constraint(
            equalTo: self.view.trailingAnchor
        ).isActive = true
    }
    
    func configureDetail(detailData: DetailViewDataModel) {
        self.title = detailData.name
        self.detailFormView.configureDetail(detailData: detailData)
    }

}
