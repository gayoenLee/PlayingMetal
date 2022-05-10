//
//  HomeView.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/03.
//

import Foundation
import UIKit
import SnapKit

final class HomeView : UIView {
    
    var carBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        self.addSubview(carBtn)
        carBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        carBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        carBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        carBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    
}
