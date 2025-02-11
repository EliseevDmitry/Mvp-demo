//
//  ViewController.swift
//  mvp-demo
//
//  Created by Artur on 17.01.2025.
//

import UIKit


//View
protocol IHomeController: AnyObject {
    
    //Update View
    func update(_ products: [Product])
    func updateBackground()
    func loadTable()
}

class HomeViewController: UIViewController {

    private var products: [Product] = []
    //private var homeTableView = HomeTableView()
    private var homeTableView = HomeTableView()
   
    
    let presenter: HomePresenter
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.updateBackground()
        presenter.loadTable()
    }
    
    @objc func profileButtonDidTap() {
        presenter.profileButtonDidTap()
    }
}

extension HomeViewController: IHomeController {
   
    //
    func updateBackground() {
        view.backgroundColor = .red
    }
    
   
    func update(_ products: [Product]) {
        self.products = products
        homeTableView.reloadData()
    }
    
    func loadTable(){
        view.addSubview(homeTableView)
    }
    
    
}



