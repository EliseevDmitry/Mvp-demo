//
//  ProductService.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import Foundation

protocol IProductService: AnyObject {
    func fetch(comletion: @escaping ([Product]) -> Void)
}

final class ProductService: IProductService {
    
    private let products = [
        Product(name: "Гавайская", price: 500),
        Product(name: "4 сыра", price: 600),
        Product(name: "Пеперони", price: 700),
    ]
    
    func fetch(comletion: @escaping ([Product]) -> Void) {
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            comletion(self.products)
        }
    }
 
}
