//
//  ViewController.swift
//  mvp-demo
//
//  Created by Artur on 17.01.2025.
//

import UIKit


//View
protocol IHomeController: AnyObject {
    var homeTableView: IHomeTableView { get set }
    var products: [Product] { get }
    func update(_ products: [Product])
    func updateBackground()
}

class HomeViewController: UIViewController {
    var homeTableView: IHomeTableView

    var products: [Product]
    let presenter: IHomePresenter
    
    init(presenter: IHomePresenter, table: IHomeTableView) {
        self.presenter = presenter
        self.products = []
        self.homeTableView = table
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraint()
        presenter.viewDidLoad()
        presenter.updateBackground()
    }
    
    @objc func profileButtonDidTap() {
        presenter.profileButtonDidTap()
    }
}

extension HomeViewController {
    func setupViews() {
        [homeTableView].forEach {
            view.addSubview($0)
        }
    }
    
    func setupConstraint() {
        homeTableView.snp.makeConstraints { make in
            make.right.top.left.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: IHomeController {
    

//    func updateTableView() {
//        homeTableView.products = products
//    }
    

    func updateBackground() {
        view.backgroundColor = .red
    }
    
   
    func update(_ products: [Product]) {
        self.products = products
        
        homeTableView.updateTable(products)
        //homeTableView.reloadData()
    }

}



