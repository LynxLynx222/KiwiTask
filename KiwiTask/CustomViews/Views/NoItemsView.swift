//
//  NoItemsView.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/30/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import UIKit

class NoItemsView: UIView {

    var planeImageView = UIImageView()
    var textLabel = UILabel()
    var tryAgainButton = UIButton()
    var delegate: GetDataDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupViews()
        setupConstraints()
    }
    
    private func addViews(){
        addSubview(planeImageView)
        addSubview(textLabel)
        addSubview(tryAgainButton)
    }
    
    private func setupViews(){
        backgroundColor = .clear
        
        planeImageView.image = UIImage(named: Icons.noData.rawValue)?.withRenderingMode(.alwaysTemplate)
        planeImageView.contentMode = .scaleAspectFit
        planeImageView.tintColor = .lightGray
        
        textLabel.textColor = .lightGray
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        
        tryAgainButton.setTitle(NSLocalizedString("Try again", comment: ""), for: .normal)
        tryAgainButton.setTitleColor(.kiwi, for: .normal)
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints(){
        planeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            planeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            planeImageView.heightAnchor.constraint(equalToConstant: 100),
            planeImageView.widthAnchor.constraint(equalToConstant: 100),
            planeImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -16)
            ])
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -60),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            ])
        
        tryAgainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tryAgainButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            tryAgainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    @objc private func tryAgainButtonTapped(){
        delegate?.getFlightData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
