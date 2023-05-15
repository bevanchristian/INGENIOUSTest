//
//  DetailListPresenter.swift
//  INGENIOUSBevan
//
//  Created by bevan on 13/05/23.
//

import Foundation


protocol DetailListPresenterProtocol {
    func getListData()
    func searchTextDidChange(with searchText: String)
    var listUser: [User]? { get }
}

class DetailListPresenter: DetailListPresenterProtocol {
    
    var listUser: [User]? {
        didSet {
            self.view?.reloadData()
        }
    }
    
    var service: DetailListServiceProtocol
    var view: DetailListViewControllerProtocol?
    
    private var originalUserData: [User]?
    
    init(service: DetailListServiceProtocol = DetailListService()) {
        self.service = service
    }
    
    func getListData() {
        service.getListData { userData, errorResponse in
            if let errorResponse = errorResponse {
                self.view?.setErrorResponse(errorMessage: errorResponse.errorMessage)
            }
            
            if let userData = userData {
                self.originalUserData = userData
                self.handleListUserResponse(user: userData)
            }
        }
    }
    
    func searchTextDidChange(with searchText: String) {
        if searchText.isEmpty {
            if let userData = originalUserData {
                self.handleListUserResponse(user: userData)
            }
        } else {
            // Perform search logic here using the search text in searchText
            self.listUser = self.originalUserData?
                .filter(
                    { $0.isActive == true && $0.name.lowercased().contains(searchText.lowercased())}
                )
                .sorted { leftUser, rightUser in
                    return leftUser.index < rightUser.index
                }
        }
    }
    
    private func handleListUserResponse(user: [User]) {
        self.listUser = user
            .filter(
                { $0.isActive == true}
            )
            .sorted { leftUser, rightUser in
                return leftUser.index < rightUser.index
            }
    }
}
