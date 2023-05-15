//
//  UrlConstant.swift
//  INGENIOUSBevan
//
//  Created by bevan on 13/05/23.
//

import Foundation

enum UrlConstant {
    case list
    
    var urlValue: URL {
        switch self {
        case .list:
            return URL(
                string: "https://639853d7044fa481d6994c23.mockapi.io/INGENIOUSLAB"
            )!
        }
    }
}
