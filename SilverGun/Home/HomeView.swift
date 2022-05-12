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

        self.carBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(100)
        }
        
        self.rainBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(50)
            make.top.equalTo(carBtn.snp_bottomMargin).offset(10)
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
        
        self.rainBtn.do{
            $0.tintColor = .blue
            $0.setTitle("비내리는", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.addTarget(self, action: #selector(rainingClicked(sender:)), for: .touchUpInside)
            $0.backgroundColor = .gray
        }
    }
    
    @objc private func goCarMetal(sender: UIButton) {
        print("자동차 메탈 버튼 클릭")
    }
    
    @objc private func rainingClicked(sender: UIButton) {
        print("비내리는 메탈 버튼 클릭")
    }
    
    
    
}
