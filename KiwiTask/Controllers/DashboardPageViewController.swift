//
//  ViewController.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/20/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import UIKit

class DashboardPageViewController: UIPageViewController{

    var pages = [UIViewController]()
    var pageControl = UIPageControl()
    
    fileprivate var destinations = [Destination]()
    var locationManager = LocationManager()
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupView()
        setupConstraints()
        if locationManager.getStatus() != .notDetermined{
            getData()
        }
        else{
            locationManager.manager.requestWhenInUseAuthorization()
        }
    }
    
    fileprivate func addViews(){
        view.addSubview(pageControl)
    }

    fileprivate func setupView(){
        self.title = NSLocalizedString("Flight offers", comment: "")
        view.backgroundColor = .white
        
        pageControl.currentPageIndicatorTintColor = .kiwi
        pageControl.pageIndicatorTintColor = .lightGray
        
        locationManager.getDataDelegate = self
    }
    
    fileprivate func setupConstraints(){
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
    }
    
    //MARK: Get flights from the next week and if the result is not nil, add destinations to array, otherwise show no items error
    @objc func getData(){
        
        var latitude = 49.20
        var longitude = 16.61
        if let location = locationManager.manager.location{
            latitude = location.coordinate.latitude.roundTo(places: 2)
            longitude = location.coordinate.longitude.roundTo(places: 2)
        }
        guard let date = DateManager.getNextWeekDay(days: 7) else {return}
        
        self.presentLoadingView(message: NSLocalizedString("Fetching the best flights", comment: ""))
        
        ApiService.getDestinations(latitude: latitude, longitude: longitude, dateFrom: date, dateTo: date) { (destinations, error) in
            DispatchQueue.main.async {
                self.removeLoadingView()
                if error != nil{
                    self.presentNoItemsView(message: NSLocalizedString("Couldn't fetch any data, check your connection and try again.", comment: ""), delegate: self)
                }
                if let dest = destinations{
                    self.removeNoItemsView()
                    self.destinations = dest
                }
                else{
                    self.presentNoItemsView(message: NSLocalizedString("Couldn't fetch any data, check your connection and try again.", comment: ""), delegate: self)
                }
                self.setupData()
            }
        }
    }
    
    //MARK: Add view controllers to array and setup page view controller
    func setupData(){
        for i in destinations{
            let controller = DestinationViewController()
            controller.destination = i
            pages.append(controller)
        }
        pageControl.numberOfPages = pages.count
        if pages.count > 0{
            setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
            self.dataSource = self
            self.delegate = self
        }
        view.backgroundColor = .white
    }
}
