//
//  ButtonTableViewCell.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/05.
//

import Foundation
import UIKit
import SnapKit

final class ButtonTableViewCell: UITableViewCell {
    
    private let containerView = UIView(frame: .zero)
    private let label = UILabel(frame: .zero)
    
    var title: String? {
        didSet{ self.label.text = title }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        self.contentView.addSubview(self.containerView)
     
        self.containerView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        self.containerView.addSubview(self.label)
        self.label.snp.makeConstraints{make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupAttributes(){
        self.backgroundColor = .white
        self.label.textColor = .darkGray
        self.label.font = .systemFont(ofSize: 15, weight: .bold)
    
        self.containerView.layer.cornerRadius = 6
        self.containerView.backgroundColor = .primary4
    } 
}
