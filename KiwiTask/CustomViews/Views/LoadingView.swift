//
//  LoadingView.swift
//  KiwiLoading
//
//  Created by Ondrej Andrysek on 6/11/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    private let planeImageView = UIImageView(image: UIImage(named: Icons.plane.rawValue))
    private let circularLayer = CAShapeLayer()
    let messageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8.0
        backgroundColor = .kiwi
        
        circularLayer.lineWidth = 4.0
        circularLayer.fillColor = nil
        layer.addSublayer(circularLayer)
        
        planeImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        planeImageView.center = self.center
        addSubview(planeImageView)
        
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
            ])
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private let inAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        return animation
    }()
    
    private let outAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

        return animation
    }()
    
    private let movingAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = [350,84]
        animation.toValue = [-150,84]
        animation.repeatCount = Float.infinity
        animation.duration = 1.5
        
        return animation
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY - 16)
        let radius = min(bounds.width, bounds.height) / 2 - circularLayer.lineWidth / 2 - 60
        
        let arcPath = UIBezierPath(arcCenter: CGPoint.zero, radius: radius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi/2 + (2 * Double.pi)), clockwise: true)
        
        circularLayer.position = center
        circularLayer.path = arcPath.cgPath
        
        animateProgressView()
    }
    
    private func animateProgressView() {
        circularLayer.removeAnimation(forKey: "strokeAnimation")
        planeImageView.layer.removeAnimation(forKey: "position")
        circularLayer.strokeColor = UIColor.white.cgColor
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 1.0 + outAnimation.beginTime
        strokeAnimationGroup.repeatCount = Float.infinity
        strokeAnimationGroup.animations = [inAnimation, outAnimation]
        
        planeImageView.layer.add(movingAnimation, forKey: "position")
        circularLayer.add(strokeAnimationGroup, forKey: "strokeAnimation")
    }
}
