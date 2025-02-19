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
        
        let table = HomeTableView()

        let homeVC = HomeViewController(presenter: homePresenter, table: table)
        
        homePresenter.view = homeVC
        
        return homeVC
    }
}
