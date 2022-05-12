//
//  CarViewModel.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/12.
//

import Foundation
import UIKit
import MetalKit

protocol CarViewModelDelegate: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize)
    func draw(in view: MTKView)
}

class CarViewModel {
    weak var delegate: CarViewModelDelegate?
    
    
}
