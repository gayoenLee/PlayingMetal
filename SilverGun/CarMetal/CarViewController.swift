//
//  CarViewController.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/12.
//

import Foundation
import UIKit
import Metal
import MetalKit

class CarViewController: UIViewController {
    
    private let viewModel : CarViewModel
    
    init(viewModel: CarViewModel){
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        //self.viewModel.delegate = self
        //mtkView = CarView(frame: self.view.bounds)
        
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
