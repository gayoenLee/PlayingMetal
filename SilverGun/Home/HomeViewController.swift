//
//  HomeViewController.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/03.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModel
    private let homeView = HomeView(frame: .zero)
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
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

extension HomeViewController : HomeViewModelDelegate {
    func clickedCarBtn() {
        print("show metal car view btn clicked")
    }
}
