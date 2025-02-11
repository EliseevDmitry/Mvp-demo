//
//  HomePresenter.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import Foundation

//Presenter
protocol IHomePresenter: AnyObject {
    
    //Event
    func viewDidLoad()
    func profileButtonDidTap()
    func updateBackground()
    func loadTable()
}

class HomePresenter {
    
    weak var view: IHomeController?
    
    private let service: ProductService
    init(service: ProductService) {
        self.service = service
    }
}

extension HomePresenter: IHomePresenter {
    func loadTable() {
        view?.loadTable()
    }
    
    
    //тестовая функция
    func updateBackground() {
        view?.updateBackground()
    }
    
    
    //Event
    func viewDidLoad() {
        service.fetch { [weak self] products in
            self?.view?.update(products)
        }
    }
    
    func profileButtonDidTap() {
        //view.update(profile)
    }
    
}
