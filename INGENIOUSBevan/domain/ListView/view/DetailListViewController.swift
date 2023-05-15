//
//  DetailListViewController.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit


protocol DetailListViewControllerProtocol {
    func setErrorResponse(errorMessage: String)
    func reloadData()
}

class DetailListViewController: UIViewController, DetailListViewControllerProtocol {

    // MARK: - Properties
    
    var presenter: DetailListPresenterProtocol?
    var searchTimer: Timer?
    
    private var loadingView = LoadingView()
    
    private lazy var searchTextfield: UISearchBar = {
        let searchTextfield = UISearchBar()
        searchTextfield.placeholder = "Search"
        searchTextfield.translatesAutoresizingMaskIntoConstraints = false
        searchTextfield.delegate = self
        return searchTextfield
    }()
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(
            DetailListTableViewCell.self,
            forCellReuseIdentifier: "DetailListTableViewCell"
        )
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Inglab Assessment"
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.setConstraint()
        loadingView.show()
        presenter?.getListData()
    }
    
    // MARK: - Public Methods
    func setErrorResponse(errorMessage: String) {
        loadingView.hide()
        ToastView(errorMessage).show()
    }
    
    func reloadData() {
        loadingView.hide()
        self.tableView.reloadData()
    }
    
    
    // MARK: - Private Methods
    private func setConstraint() {
        self.view.addSubview(searchTextfield)
        self.view.addSubview(tableView)
        
        searchTextfield.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        searchTextfield.leadingAnchor.constraint(
            equalTo: self.view.leadingAnchor,
            constant: 20
        ).isActive = true
        searchTextfield.trailingAnchor.constraint(
            equalTo: self.view.trailingAnchor,
            constant: -20
        ).isActive = true
        
        tableView.topAnchor.constraint(
            equalTo: self.searchTextfield.bottomAnchor
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: self.view.bottomAnchor
        ).isActive = true
        tableView.leadingAnchor.constraint(
            equalTo: self.view.leadingAnchor
        ).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: self.view.trailingAnchor
        ).isActive = true
    }
}

extension DetailListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.listUser?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "DetailListTableViewCell", for: indexPath
        ) as? DetailListTableViewCell else { return UITableViewCell() }
        
        let curentData = self.presenter?.listUser?[indexPath.row]
        cell.configureCell(user: curentData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = DetailViewController()
        let curentData = self.presenter?.listUser?[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        view.configureDetail(detailData: DetailViewDataModel(
            name: curentData?.name ?? "",
            email: curentData?.email ?? "",
            phoneNumber: curentData?.phone ?? "",
            description: curentData?.description ?? "",
            profilePicture: curentData?.avatar
        ))
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    
}


extension DetailListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Invalidate any previous timer and start a new one
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { [weak self] timer in
            // Perform search logic here using the search text in searchText
            self?.presenter?.searchTextDidChange(with: searchText)
            self?.searchTimer = nil
        }
    }
}
