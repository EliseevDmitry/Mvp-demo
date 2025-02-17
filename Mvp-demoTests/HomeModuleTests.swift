//
//  Mvp_demoTests.swift
//  Mvp-demoTests
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import Testing
@testable import Mvp_demo
import Foundation
import XCTest



class HomeViewControllerSpy: IHomeController {
    var homeTableView: Mvp_demo.HomeTableView
    
    
    var products: [Mvp_demo.Product] = []
    
    
    var presenter: IHomePresenter
    required init(presenter: IHomePresenter, table: HomeTableView) {
        self.presenter = presenter
        self.homeTableView = table
    }
    
    var updateProductCalled = false
    var updateBackgroundCalled = false
    
    func update(_ products: [Product]) {
        updateProductCalled = true
    }
    
    func updateBackground() {
        updateBackgroundCalled = true
    }
    
}

class HomePresenterSpy: IHomePresenter {
    var service: IProductService
    required init(service: IProductService) {
        self.service = service
    }
    var viewIsLoadCalled = false
    var buttonDidTapCalled = false
    
    func viewDidLoad() {
        viewIsLoadCalled = true
    }
    
    func profileButtonDidTap() {
        buttonDidTapCalled = true
    }
    
}

class ProductServiceSpy: IProductService {
    
    var fetchProductsCalled = false
    
    func fetch(comletion: @escaping ([Mvp_demo.Product]) -> Void) {
        fetchProductsCalled = true
    }
}

class HomeTableViewSpy: IHomeTableView {
    
    var tableUpdateCalled = false
    
    func updateTable(_ products: [Mvp_demo.Product]) {
        tableUpdateCalled = true
    }
}


final class HomeTests: XCTestCase{
    
    func testPresenterCallsViewDidLoad(){
        //given
        let serviceSpy = ProductServiceSpy()
        let homePresenterSpy = HomePresenterSpy(service: serviceSpy)
        let homeVC = HomeViewController(presenter: homePresenterSpy)
        
        //when
        let _ = homeVC.view
        
        //then
        XCTAssertTrue(homePresenterSpy.viewIsLoadCalled)
    }
    
    func testPresenterCallsProfileButtonDidTap(){
        //given
        let serviceSpy = ProductServiceSpy()
        let homePresenterSpy = HomePresenterSpy(service: serviceSpy)
        let homeVC = HomeViewController(presenter: homePresenterSpy)
        
        //when
        let _ = homeVC.presenter.profileButtonDidTap()
        
        //then
        XCTAssertTrue(homePresenterSpy.buttonDidTapCalled)
    }
    
    func testHomeViewControllerCallsUpdateProduct(){
        //given
        let service = ProductService()
        let table = HomeTableView()
        let homePresenter = HomePresenter(service: service)
        let homeVCSpy = HomeViewControllerSpy(presenter: homePresenter, table: table)
        homePresenter.view = homeVCSpy
        
        //when
        homePresenter.viewDidLoad()
        
        //асинхронный тест
        let expectation = expectation(description: "Loading products")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //then
            XCTAssertTrue(homeVCSpy.updateProductCalled)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3) //время задержки
    }
    
    func testHomeViewControllerCallsUpdateBackground(){
        //given
        let serviceSpy = ProductServiceSpy()
        let table = HomeTableView()
        let homePresenter = HomePresenter(service: serviceSpy)
        let homeVCSpy = HomeViewControllerSpy(presenter: homePresenter, table: table)
        homePresenter.view = homeVCSpy
        
        //when
        
        let _ = homePresenter.view?.updateBackground()
        
        //then
        XCTAssertTrue(homeVCSpy.updateBackgroundCalled)
    }
    
    func testProductServiceCallsFetch(){
        //given
        let serviceSpy = ProductServiceSpy()
        let homePresenter = HomePresenter(service: serviceSpy)
        
        
        //when
        let _ = homePresenter.viewDidLoad()
        
        //then
        XCTAssertTrue(serviceSpy.fetchProductsCalled)
    }
    
    //вопрос???
    func testHomeTableViewCallsUpdateTable(){
        //given
        
        let tableSpy = HomeTableViewSpy()
        let serviceSpy = ProductServiceSpy()
        let homePresenterSpy = HomePresenterSpy(service: serviceSpy)
        let homeVC = HomeViewController(presenter: homePresenterSpy)
        
        //when
        let _ = tableSpy.updateTable(homeVC.products)
        
        //then
        XCTAssertTrue(tableSpy.tableUpdateCalled)
    }
    
}



