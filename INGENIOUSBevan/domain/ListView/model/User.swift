//
//  User.swift
//  INGENIOUSBevan
//
//  Created by bevan on 13/05/23.
//

import Foundation

struct User: Codable {
    let id: String
    let avatar: String
    var name: String
    var phone: String
    var isActive: Bool
    var index: Int
    var email: String
    var description: String
}
