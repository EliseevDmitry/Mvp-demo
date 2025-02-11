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
        [containerView].forEach {
            contentView.addSubview($0)
        }
       
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(contentView)
            make.height.equalTo(100)
            make.width.equalTo(300)
        }
    }
}
