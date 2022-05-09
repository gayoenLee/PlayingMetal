//
//  HomeViewModel.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/03.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate: AnyObject{
    func clickedCarBtn()
}


class HomeViewModel {
  
    weak var delegate: HomeViewModelDelegate?
    
    
}
