//
//  HomeModuleConfigurator.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import UIKit

//Module Configurator
class HomeModuleConfigurator {
    static func configure() -> HomeViewController {
        
        let productService = ProductService()
        
        let homePresenter = HomePresenter(service: productService)
        
        let homeVC = HomeViewController(presenter: homePresenter)
        
        homePresenter.view = homeVC
        
        return homeVC
    }
}
