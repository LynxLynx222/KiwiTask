//
//  GreyLabel.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/23/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import UIKit

class DarkGrayLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupLabel(){
        textColor = .darkGray
        font = UIFont.systemFont(ofSize: 15)
    }
}

final class DarkGrayLabelSmall: DarkGrayLabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupLabel(){
        font = UIFont.systemFont(ofSize: 12)
    }
}

final class DarkGrayLabelSemibold: DarkGrayLabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupLabel(){
        font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
}
