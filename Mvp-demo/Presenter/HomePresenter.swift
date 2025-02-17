//
//  HomePresenter.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import Foundation

//Presenter
protocol IHomePresenter: AnyObject {
    var service: IProductService { get  set}
    //Event
    func viewDidLoad()
    func profileButtonDidTap()
    //func updateBackground()
}

class HomePresenter {
    
    weak var view: IHomeController?
    
    var service: IProductService
    init(service: IProductService) {
        self.service = service
    }
}

extension HomePresenter: IHomePresenter {

    //тестовая функция
//    func updateBackground() {
//        view?.updateBackground()
//    }
    
    
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
