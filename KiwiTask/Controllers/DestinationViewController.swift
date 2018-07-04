//
//  DestinationViewController.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/20/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    var previewImageView = UIImageView()
    var rightArrowImageView = UIImageView()
    var cityFromLabel = DarkGrayLabelSemibold()
    var countryFromLabel = DarkGrayLabelSmall()
    var cityToLabel = DarkGrayLabelSemibold()
    var countryToLabel = DarkGrayLabelSmall()
    var priceView = PriceView()
    var timeFromLabel = DarkGrayLabelSemibold()
    var timeToLabel = DarkGrayLabelSemibold()
    var dateFromLabel = DarkGrayLabelSmall()
    var dateToLabel = DarkGrayLabelSmall()
    var flyDurationLabel = DarkGrayLabelSmall()
    
    var destination: Destination?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupViews()
        setupConstraints()
    }
    
    fileprivate func addViews(){
        view.addSubview(previewImageView)
        view.addSubview(rightArrowImageView)
        view.addSubview(cityFromLabel)
        view.addSubview(countryFromLabel)
        view.addSubview(cityToLabel)
        view.addSubview(countryToLabel)
        view.addSubview(priceView)
        view.addSubview(timeFromLabel)
        view.addSubview(timeToLabel)
        view.addSubview(dateFromLabel)
        view.addSubview(dateToLabel)
        view.addSubview(flyDurationLabel)
    }
    
    fileprivate func setupConstraints(){
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            previewImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.5),
            previewImageView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            previewImageView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16)
            ])

        priceView.translatesAutoresizingMaskIntoConstraints = false
        let priceViewWidth = priceView.fromLabel.intrinsicContentSize.width + priceView.priceLabel.intrinsicContentSize.width
        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: previewImageView.safeAreaLayoutGuide.topAnchor, constant: 32),
            priceView.leftAnchor.constraint(equalTo: previewImageView.safeAreaLayoutGuide.leftAnchor),
            priceView.heightAnchor.constraint(equalToConstant: 30),
            priceView.widthAnchor.constraint(equalToConstant: priceViewWidth + 24)
            ])
        
        flyDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flyDurationLabel.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 20),
            flyDurationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])

        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrowImageView.topAnchor.constraint(equalTo: flyDurationLabel.bottomAnchor, constant: 4),
            rightArrowImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            rightArrowImageView.heightAnchor.constraint(equalToConstant: 20),
            rightArrowImageView.widthAnchor.constraint(equalToConstant: 20)
            ])
        
        cityFromLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityFromLabel.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 16),
            cityFromLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            cityFromLabel.rightAnchor.constraint(equalTo: rightArrowImageView.leftAnchor, constant: -16)
            ])
        
        cityToLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityToLabel.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 16),
            cityToLabel.leftAnchor.constraint(equalTo: rightArrowImageView.rightAnchor, constant: 16),
            cityToLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
            ])
        
        countryFromLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryFromLabel.topAnchor.constraint(equalTo: cityFromLabel.bottomAnchor, constant: 4),
            countryFromLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            countryFromLabel.rightAnchor.constraint(equalTo: rightArrowImageView.leftAnchor, constant: -16)
            ])
        
        countryToLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryToLabel.topAnchor.constraint(equalTo: cityToLabel.bottomAnchor, constant: 4),
            countryToLabel.leftAnchor.constraint(equalTo: rightArrowImageView.rightAnchor, constant: 16),
            countryToLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
            ])
        
        timeFromLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeFromLabel.topAnchor.constraint(equalTo: countryToLabel.bottomAnchor, constant: 24),
            timeFromLabel.leftAnchor.constraint(equalTo: countryFromLabel.leftAnchor),
            timeFromLabel.rightAnchor.constraint(equalTo: countryFromLabel.rightAnchor)
            ])
        
        timeToLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeToLabel.topAnchor.constraint(equalTo: countryToLabel.bottomAnchor, constant: 24),
            timeToLabel.leftAnchor.constraint(equalTo:countryToLabel.leftAnchor),
            timeToLabel.rightAnchor.constraint(equalTo: countryToLabel.rightAnchor)
            ])
        
        dateFromLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateFromLabel.topAnchor.constraint(equalTo: timeFromLabel.bottomAnchor, constant: 4),
            dateFromLabel.leftAnchor.constraint(equalTo: countryFromLabel.leftAnchor),
            dateFromLabel.rightAnchor.constraint(equalTo: countryFromLabel.rightAnchor)
            ])
        
        dateToLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateToLabel.topAnchor.constraint(equalTo: timeToLabel.bottomAnchor, constant: 4),
            dateToLabel.leftAnchor.constraint(equalTo: countryToLabel.leftAnchor),
            dateToLabel.rightAnchor.constraint(equalTo: countryToLabel.rightAnchor)
            ])
    }
    
    fileprivate func setupViews(){
        view.backgroundColor = .white
        
        previewImageView.contentMode = .scaleAspectFill
        previewImageView.clipsToBounds = true
        previewImageView.backgroundColor = .white
        previewImageView.layer.cornerRadius = 8.0
        
        rightArrowImageView.image = UIImage(named: Icons.rightArrow.rawValue)?.withRenderingMode(.alwaysTemplate)
        rightArrowImageView.tintColor = .darkGray
        rightArrowImageView.contentMode = .scaleAspectFit
        
        cityToLabel.textAlignment = .right
        countryToLabel.textAlignment = .right
        timeToLabel.textAlignment = .right
        dateToLabel.textAlignment = .right
        
        if let destination = self.destination{
            getImage(mapIdTo: destination.mapIdTo)
            setDestinationPrice()
            cityFromLabel.text = destination.cityFrom
            cityToLabel.text = destination.cityTo
            countryFromLabel.text = destination.countryFromName
            countryToLabel.text = destination.countryToName
            timeFromLabel.text = destination.dTime.asTimeInString()
            timeToLabel.text = destination.aTime.asTimeInString()
            dateFromLabel.text = destination.dTime.asDateInString()
            dateToLabel.text = destination.aTime.asDateInString()
            flyDurationLabel.text = destination.flyDuration
        }
    }
    
    private func setDestinationPrice(){
        if let destination = self.destination{
            switch LocaleManager.getLocale(){
            case .czk:
                priceView.priceLabel.text = "\(Int(Double(destination.price) * destination.conversionFromEur))" + " Kč"
            case .eng:
                priceView.priceLabel.text = "\(destination.price)" + " Euro"
            }
        }
    }
    
    fileprivate func getImage(mapIdTo: String){
        ApiService.downloadImage(url: "https://images.kiwi.com/photos/600/" + mapIdTo + ".jpg") { (image, error) in
            DispatchQueue.main.async {
                self.previewImageView.image = image
            }
        }
    }
}
