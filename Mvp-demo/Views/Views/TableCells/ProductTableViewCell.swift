//
//  ProductTableViewCell.swift
//  Mvp-demo
//
//  Created by Dmitriy Eliseev on 11.02.2025.
//

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {

    static let reuseId = "ProductCell"
    
    private lazy var containerView: UIView = {
        $0.backgroundColor = .green
        return $0
    }(UIView())
    
    private lazy var nameLabel: UILabel = {
        $0.text = "Test"
        $0.textColor = .black
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProductTableViewCell{
    private func setupViews(){
        [containerView, nameLabel].forEach {
            contentView.addSubview($0)
        }
       
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(contentView)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    func update(_ product: Product) {
        nameLabel.text = "\(product.name) \(product.price)"
    }
}
