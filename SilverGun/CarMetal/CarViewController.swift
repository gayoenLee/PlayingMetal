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
    
    var mtkView: CarView!
    var commandQueue : MTLCommandQueue!
    private let viewModel : CarViewModel
    
    
    init(viewModel: CarViewModel){
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        //mtkView = CarView(frame: self.view.bounds)
        mtkView.device = MTLCreateSystemDefaultDevice()
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMetalView(){
    
    }
}

extension CarViewController: CarViewModelDelegate {
    func draw(in view: MTKView) {
        render()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        print("")
    }
    
    func render(){
        guard let renderPassDescriptor = mtkView.currentRenderPassDescriptor else { return }
        guard let commandBuffer = commandQueue.makeCommandBuffer() else { return }
        guard let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else { return }
        guard let currentDrawble = mtkView.currentDrawable else { return }
        
        commandEncoder.endEncoding()
        commandBuffer.present(currentDrawble)
        commandBuffer.commit()
    }
}
