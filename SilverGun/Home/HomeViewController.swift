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
    private let homeView = HomeView()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController : HomeViewModelDelegate {
    func clickedCarBtn() {
        print("show metal car view btn clicked")
    }
}
