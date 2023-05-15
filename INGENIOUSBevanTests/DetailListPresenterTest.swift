//
//  DetailListPresenterTest.swift
//  INGENIOUSBevanTests
//
//  Created by bevan on 14/05/23.
//

import XCTest
@testable import INGENIOUSBevan

final class DetailListPresenterTest: XCTestCase {
    
    var serviceMock: DetailListServiceProtocol?
    var presenter: DetailListPresenterProtocol?
    
    
    private func createErrorService() {
        self.serviceMock = DetailListServiceMock(isError: true)
        self.presenter = DetailListPresenter(service: serviceMock!)
    }
    
    private func createSuccessService() {
        self.serviceMock = DetailListServiceMock(isError: false)
        self.presenter = DetailListPresenter(service: serviceMock!)
    }
    
    func testGetListDataSuccess() {
        createSuccessService()
        self.presenter?.getListData()
        // 2 becase data only contain 2 active
        XCTAssertEqual(presenter?.listUser?.count, 2)
    }
    
    func testGetListDataFailed() {
        createErrorService()
        self.presenter?.getListData()
        XCTAssertEqual(presenter?.listUser?.count, nil)
    }
    
    func testSearchText() {
        createSuccessService()
        self.presenter?.getListData()
        self.presenter?.searchTextDidChange(with: "be")
        
        XCTAssertEqual(presenter?.listUser?.count, 1)
    }

   

}
