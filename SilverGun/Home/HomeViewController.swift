//
//  HomeViewController.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/03.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewDelegate {
    
    private let viewModel: HomeViewModel
    private let homeView = HomeView(frame: .zero)
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.homeView.delegate = self
        self.setupHomeView()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHomeView(){
        self.view.addSubview(homeView)
        self.homeView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        self.homeView.then{
            $0.backgroundColor = .tintColor
        }
    }
    
}

extension HomeViewController  {
    func clickedCarBtn(_ view: HomeView) {
        print("show metal car view btn clicked")
        self.moveToView()
    }
    

}

extension HomeViewController{
    private func moveToView(){
        print("MoveToView")
        let carViewModel = CarViewModel()
        let carViewController = CarViewController(viewModel: carViewModel)
        self.navigationController?.pushViewController(carViewController, animated: true)
    }
}
