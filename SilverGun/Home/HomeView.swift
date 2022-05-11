//
//  HomeView.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/03.
//

import Foundation
import UIKit
import SnapKit

final class HomeView : UIView {
    
    var carBtn = UIButton(frame: .zero)
    var rainBtn = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        self.addSubview(carBtn)
        self.addSubview(rainBtn)
        carBtn.translatesAutoresizingMaskIntoConstraints = false
        rainBtn.translatesAutoresizingMaskIntoConstraints = false
//        carBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        carBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        carBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        carBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.carBtn.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        self.rainBtn.snp.makeConstraints{ make in
            
        }
    }
    
    private func setupAttributes(){
        self.carBtn.do{
            $0.tintColor = .blue
            $0.setTitle("자동차 메탈", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.addTarget(self, action: #selector(goCarMetal(sender:)), for: .touchUpInside)
            $0.backgroundColor = .gray
        }
    }
    
    @objc private func goCarMetal(sender: UIButton) {
        print("자동차 메탈 버튼 클릭")
    }
    
    
    
}
