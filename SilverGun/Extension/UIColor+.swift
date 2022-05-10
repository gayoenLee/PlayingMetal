//
//  UIColor+.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/10.
//
import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        // 일단 6자리 hex string만 지원
        guard hexString.count == 6 else { return nil }
        
        var hexNumber: UInt64 = 0
        let scanner = Scanner(string: hexString)
        guard scanner.scanHexInt64(&hexNumber) else { return nil }
        let r, g, b: CGFloat
        r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        b = CGFloat(hexNumber & 0x000000ff) / 255
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
