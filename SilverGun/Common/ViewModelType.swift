//
//  ViewModelType.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/05.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
