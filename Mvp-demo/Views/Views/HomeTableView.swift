//
//  HomeTableView.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import UIKit

protocol IHomeTableView {
    func updateTable(_ products: [Product])
}

    class HomeTableView: UITableView, IHomeTableView {
   
    //let productTable: UITableView
    private var products: [Product]? = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: frame, style: style)
        commonInit()  
    }
    
    func commonInit(){
        self.delegate = self
        self.dataSource = self
        self.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeTableView {
    
    func updateTable(_ products: [Product]){
        self.products = products
        self.reloadData()
    }
    
}

extension HomeTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = products?.count  else { return 0 }
        return products
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        cell.update(products![indexPath.row])
        return  cell
    }
}
