//
//  NetworkService.swift
//  INGENIOUSBevan
//
//  Created by bevan on 13/05/23.
//

import Foundation
import Alamofire


enum ErrorNetwork: Error {
    case networkError
    case dataNotFound
    case jsonParsedError
    
    var errorMessage: String {
        switch self {
        case .networkError:
            return "Please try again network error"
        case .dataNotFound:
            return "Data is empty from server"
        case .jsonParsedError:
            return "Please try again"
        }
    }
}

protocol NetworkRequestProtocol {
    func request<T: Codable>(
        url: UrlConstant,
        method: HTTPMethod,
        completion: @escaping ((T?, ErrorNetwork?) -> Void)
    )
}

class NetworkService: NetworkRequestProtocol {
    
    static let shared = NetworkService()
    
    var session: Session
    
    init(session: Session = AF) {
        self.session = session
    }
    
    func request<T: Codable>(
        url: UrlConstant,
        method: HTTPMethod = .get,
        completion: @escaping ((T?, ErrorNetwork?) -> Void)
    ) {
        session.request(
            url.urlValue,
            method: method
        ).responseJSON { response in
            switch response.result {
            case .success: // status code 200...209
                do {
                    let jsonDecoder = JSONDecoder()
                    if let data = response.data {
                        // Try to parse based on Generic Type
                        if let responseModel = try? jsonDecoder.decode(T.self, from: data) {
                            completion(responseModel, nil)
                        } else {
                            completion(nil, .dataNotFound)
                        }
                    } else {
                        // If data is nil or not found, set as error response
                        completion(nil, .dataNotFound)
                    }
                } catch _ {
                    // If json cant be parsed, set as error response
                    completion(nil, .jsonParsedError)
                }
            case .failure(_):
                // If there's an error in networking, set as error response
                completion(nil, .networkError)
            }
        }
    }
    
}
