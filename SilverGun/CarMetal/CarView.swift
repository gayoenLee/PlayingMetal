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
    
    var viewModel : CarViewModel!
    
     init(){
         //MTKView에서는 super.init()콜시에 디바이스를 꼭 세팅해줘야함.
         super.init(frame: .zero, device: MTLCreateSystemDefaultDevice())
         
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Metal device loading error")
            return
        }
       createRenderer(device: device, metalView: self)
         
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRenderer(device : MTLDevice!, metalView : CarView){
        viewModel = CarViewModel(view: metalView, device: device)
        delegate = viewModel
    }
    
}

