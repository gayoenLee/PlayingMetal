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
    
    var renderer : RendererHelper!
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRenderer(device : MTLDevice!, metalView : MTKView){
        renderer = RendererHelper()
    }
    
}

