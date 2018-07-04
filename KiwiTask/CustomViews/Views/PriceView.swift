//
//  PriceView.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/23/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import UIKit

class PriceView: UIView {

    var fromLabel = UILabel()
    var priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func addViews(){
        addSubview(fromLabel)
        addSubview(priceLabel)
    }
    
    private func setupViews(){
        backgroundColor = .kiwi
        
        fromLabel.text = NSLocalizedString("from", comment: "")
        fromLabel.textColor = .white
        fromLabel.font = UIFont.systemFont(ofSize: 12)
        
        priceLabel.textColor = .white
        priceLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    private func setupConstraints(){
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fromLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            fromLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor)
            ])
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(equalTo: fromLabel.rightAnchor, constant: 4),
            priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
    }
}

extension PriceView{
    func call(){
        addViews()
    }
}
