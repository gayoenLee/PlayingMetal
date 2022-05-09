//
//  HomeButtonTableView.swift
//  SilverGun
//
//  Created by 이은호 on 2022/05/05.
//

import Foundation
import UIKit
import SnapKit

protocol HomeButtonTableViewDelegate : UITableViewDelegate {}
protocol HomeButtonTableViewDataSource: UITableViewDataSource {}

final class HomeButtonTableView: UIView{
    
    private let tableView = UITableView(frame: .zero)
    
    weak var delegate: (HomeButtonTableViewDelegate)? {
        didSet { self.tableView.delegate = self.delegate}
    }
    
    weak var dataSource: HomeButtonTableViewDataSource? {
        didSet { self.tableView.dataSource = self.dataSource}
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        self.addSubview(tableView)
        self.tableView.snp.makeConstraints{ make in
            
            
        }
    }
    
    
}
