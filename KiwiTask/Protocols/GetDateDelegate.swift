//
//  LoadingViewPresentable.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 6/22/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation
import UIKit

protocol GetDataDelegate{
    func getFlightData()
}

extension GetDataDelegate where Self: UIViewController{
    func presentLoadingView(message: String){
        if self.view.viewWithTag(999) == nil{
            let loadingView = LoadingView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            loadingView.tag = 999
            loadingView.center.x = self.view.center.x
            loadingView.center.y = self.view.center.y - 60
            loadingView.messageLabel.text = message
            self.view.addSubview(loadingView)
        }
    }

    func removeLoadingView(){
        if let loadingView = self.view.viewWithTag(999){
            loadingView.removeFromSuperview()
        }
    }
    
    func presentNoItemsView(message: String, delegate: GetDataDelegate){
        if self.view.viewWithTag(998) == nil{
            let noItemsView = NoItemsView(frame: self.view.frame)
            noItemsView.delegate = delegate
            noItemsView.tag = 998

            noItemsView.textLabel.text = message
            self.view.addSubview(noItemsView)
        }
    }
    
    func removeNoItemsView(){
        if let noItemsView = self.view.viewWithTag(998){
            noItemsView.removeFromSuperview()
        }
    }
}
