//
//  CarView.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/12.
//

import UIKit
import SnapKit
import MetalKit
//상속이 불가하도록 final로 설정
final class CarView : MTKView {
    
    var viewModel : CarViewModel?
    
     init(){
         //MTKView에서는 super.init()콜시에 디바이스를 꼭 세팅해줘야함.
         super.init(frame: .zero, device: viewModel?.device)
         delegate = viewModel
         
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRenderer(metalView : CarView){
        viewModel = CarViewModel()
        delegate = viewModel
    }
    
    
    
}

