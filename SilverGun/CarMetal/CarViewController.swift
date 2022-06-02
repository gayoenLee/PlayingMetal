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
import SnapKit

class CarViewController: UIViewController {
    
    private let viewModel : CarViewModel
    private var imgView : UIImageView!
    
    
    init(viewModel: CarViewModel){
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupLayout()
        
       
        
    }
    
    func setupLayout(){
        
        imgView = UIImageView()
        self.view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imgView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(100)
        }
        let filteredImg = viewModel.applyFilter()
        imgView.image = filteredImg
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
