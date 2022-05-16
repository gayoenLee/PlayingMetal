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

class CarViewModel : NSObject{
    weak var delegate: CarViewModelDelegate?
    var mtkView: CarView!
    var commandQueue : MTLCommandQueue!
    var pipelineState : MTLRenderPipelineState
    var library : MTLLibrary!
    var device : MTLDevice!
    
    init(view: CarView, device: MTLDevice){
        self.mtkView = view
        self.device = device
        commandQueue = device.makeCommandQueue()
        
        library = device.makeDefaultLibrary()
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        
        // pipeline state properties
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        let vertexFunction = self.library.makeFunction(name: "vertex_main")
        let fragmentFunction = self.library.makeFunction(name: "fragment_main")
        pipelineStateDescriptor.vertexFunction = vertexFunction
        pipelineStateDescriptor.fragmentFunction = fragmentFunction
      pipelineState =  try! device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        
        
        super.init()
        delegate = self
    }
    
     func createPipelineState() -> MTLRenderPipelineState {
      let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
      
      // pipeline state properties
      pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
      let vertexFunction = self.library.makeFunction(name: "vertex_main")
      let fragmentFunction = self.library.makeFunction(name: "fragment_main")
      pipelineStateDescriptor.vertexFunction = vertexFunction
      pipelineStateDescriptor.fragmentFunction = fragmentFunction
      
      return try! self.device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
    }
    
    func render(){
        guard let renderPassDescriptor = mtkView.currentRenderPassDescriptor else { return }
        guard let commandBuffer = commandQueue.makeCommandBuffer() else { return }
        guard let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else { return }
        guard let currentDrawble = mtkView.currentDrawable else { return }
        
        commandEncoder.setRenderPipelineState(pipelineState)
        commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 6)
        commandEncoder.endEncoding()
        commandBuffer.present(currentDrawble)
        commandBuffer.commit()
    }
}

extension CarViewModel : CarViewModelDelegate {
    func draw(in view: MTKView) {
        self.render()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        print("")
    }
}
