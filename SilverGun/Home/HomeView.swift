//
//  HomeView.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/03.
//

import Foundation
import UIKit


class HomeView : ViewController {
    
    var carBtn = UIButton()
    
    override func viewDidLoad() {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view?.addSubview(carBtn)
        carBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        carBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        carBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        carBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    
}
