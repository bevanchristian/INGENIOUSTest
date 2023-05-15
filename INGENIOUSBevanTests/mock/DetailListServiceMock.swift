//
//  DetailListServiceMock.swift
//  INGENIOUSBevan
//
//  Created by bevan on 14/05/23.
//

import Foundation

class DetailListServiceMock: DetailListServiceProtocol {
    
    var isError: Bool = false
    
    init(isError: Bool) {
        self.isError = isError
    }
    
    func getListData(completion: @escaping([User]?, ErrorNetwork?) -> Void) {
        if isError {
            completion(nil, .dataNotFound)
        } else {
            let mockUser = [
                User(
                    id: "1",
                    avatar: "avatar",
                    name: "bevan",
                    phone: "0812838383",
                    isActive: true,
                    index: 1,
                    email: "email.com",
                    description: "desc"
                ),
                User(
                    id: "2",
                    avatar: "avatar 2",
                    name: "benson",
                    phone: "921812881",
                    isActive: false,
                    index: 2,
                    email: "email2.com",
                    description: "desc2"
                ),
                User(
                    id: "3",
                    avatar: "avatar 3",
                    name: "joko",
                    phone: "1928834",
                    isActive: true,
                    index: 3,
                    email: "john.com",
                    description: "desc"
                )
            ]
            completion(mockUser, nil)
        }
    }
}
