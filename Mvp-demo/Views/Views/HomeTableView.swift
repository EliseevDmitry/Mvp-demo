//
//  HomeTableView.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import UIKit

class HomeTableView: UITableView {
   
    //let productTable: UITableView
    var products: [Product]?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: frame, style: style)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        return tableView
    }()
    
    
}

extension HomeTableView {
    private func setupViews(){
        [homeTableView].forEach {
            addSubview($0)
        }
       
    }
    
    private func setupConstraints() {
        homeTableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
}

extension HomeTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = products?.count  else { return 0 }
        return products
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return  ProductTableViewCell()
    }
    
    
}
