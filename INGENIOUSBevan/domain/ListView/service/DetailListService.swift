//
//  DetailListService.swift
//  INGENIOUSBevan
//
//  Created by bevan on 13/05/23.
//

import Foundation


protocol DetailListServiceProtocol {
    func getListData(completion: @escaping([User]?, ErrorNetwork?) -> Void)
}

class DetailListService: DetailListServiceProtocol {
    
    var service: NetworkRequestProtocol
    
    init(service: NetworkRequestProtocol = NetworkService.shared) {
        self.service = service
    }
    
    func getListData(completion: @escaping([User]?, ErrorNetwork?) -> Void) {
        self.service.request(
            url: .list,
            method: .get,
            completion: completion
        )
    }
}
