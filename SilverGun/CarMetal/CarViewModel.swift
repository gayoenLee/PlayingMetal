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
    var computePipelineState : MTLComputePipelineState
    var device : MTLDevice!
    var inputImg : UIImage!
    var grayScaleShader : MTLFunction?
    var commandEncoder : MTLComputeCommandEncoder?
    var commandBuffer : MTLCommandBuffer?
    var height, width: Int
    // most devices have a limit of 512 threads per group
    let threadsPerBlock = MTLSize(width: 16, height: 16, depth: 1)
    
    override init(){
        self.mtkView = CarView()
        self.device = MTLCreateSystemDefaultDevice()
        commandQueue = device.makeCommandQueue()
        //MTLibaray인스턴스를 계속 가지고 있을 필요가 없음.
      let library = device.makeDefaultLibrary()

        grayScaleShader = library?.makeFunction(name: "black")
        
        //https://www.raywenderlich.com/books/metal-by-tutorials/v2.0/chapters/3-the-rendering-pipeline
        computePipelineState = try! device.makeComputePipelineState(function: grayScaleShader!)
        
        self.commandBuffer = commandQueue.makeCommandBuffer()
        self.commandEncoder = commandBuffer!.makeComputeCommandEncoder()
        
        commandEncoder?.setComputePipelineState(computePipelineState)
        if let shader = grayScaleShader {
            self.computePipelineState = try! self.device.makeComputePipelineState(function: shader)
        } else {
            fatalError("Unable to make compute pipeline state")
        }
        
        inputImg = UIImage(named: "car")
        self.width = Int(self.inputImg.size.width)
        self.height = Int(self.inputImg.size.height)
        
        super.init()
        mtkView.delegate = self
    }
    
    
    func applyFilter() -> UIImage? {
        
        if let encoder = self.commandEncoder, let buffer = self.commandBuffer, let outputTexture = getEmptyMTLTexture(), let inputTexture = getInputMTLTexture() {
            
            encoder.setTextures([outputTexture, inputTexture], range: 0..<2)
            encoder.dispatchThreadgroups(self.getBlockDimensions(), threadsPerThreadgroup: threadsPerBlock)
            encoder.endEncoding()
            
            buffer.commit()
            buffer.waitUntilCompleted()
            
            guard let outputImage = getCGImage(from: outputTexture) else { fatalError("Couldn't obtain CGImage from MTLTexture") }
                       
                       return getUIImage(from: outputImage)
                       
                   } else { fatalError("optional unwrapping failed") }
                   
               }
    
    func getUIImage(from cgimg: CGImage) -> UIImage? {
           return UIImage(cgImage: cgimg)
       }
    
    
    func getCGImage(from uiimg: UIImage) -> CGImage? {
         
         UIGraphicsBeginImageContext(uiimg.size)
         uiimg.draw(in: CGRect(origin: .zero, size: uiimg.size))
         let contextImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         
         return contextImage?.cgImage
         
     }
    
    func getInputMTLTexture() -> MTLTexture? {
          if let inputImage = getCGImage(from: self.inputImg) {
              return getMTLTexture(from: inputImage)
          }
          else { fatalError("Unable to convert Input image to MTLTexture") }
      }
    
    func getMTLTexture(from cgimg: CGImage) -> MTLTexture {
          
          let textureLoader = MTKTextureLoader(device: self.device)
          
          do{
              let texture = try textureLoader.newTexture(cgImage: cgimg, options: nil)
              let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(pixelFormat: texture.pixelFormat, width: width, height: height, mipmapped: false)
              textureDescriptor.usage = [.shaderRead, .shaderWrite]
              return texture
          } catch {
              fatalError("Couldn't convert CGImage to MTLtexture")
          }
          
      }
    
    func getCGImage(from mtlTexture: MTLTexture) -> CGImage? {
         
         var data = Array<UInt8>(repeatElement(0, count: 4*width*height))
         
         mtlTexture.getBytes(&data,
                             bytesPerRow: 4*width,
                             from: MTLRegionMake2D(0, 0, width, height),
                             mipmapLevel: 0)
         
         let bitmapInfo = CGBitmapInfo(rawValue: (CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue))
         
         let colorSpace = CGColorSpaceCreateDeviceRGB()
         
         let context = CGContext(data: &data,
                                 width: width,
                                 height: height,
                                 bitsPerComponent: 8,
                                 bytesPerRow: 4*width,
                                 space: colorSpace,
                                 bitmapInfo: bitmapInfo.rawValue)
         
         return context?.makeImage()
     }
    
    func getBlockDimensions() -> MTLSize {
         let blockWidth = width / self.threadsPerBlock.width
         let blockHeight = height / self.threadsPerBlock.height
         return MTLSizeMake(blockWidth, blockHeight, 1)
     }
     
    
      func getEmptyMTLTexture() -> MTLTexture? {
          
          let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(
              pixelFormat: MTLPixelFormat.rgba8Unorm,
              width: width,
              height: height,
              mipmapped: false)
          
          textureDescriptor.usage = [.shaderRead, .shaderWrite]
          
          return self.device.makeTexture(descriptor: textureDescriptor)
      }
}

extension CarViewModel : CarViewModelDelegate {
    func draw(in view: MTKView) {
        //self.render()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        print("")
    }
}
