//
//  DashboardPageViewController+Extension.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 7/3/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation
import UIKit

extension DashboardPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)-> UIViewController? {
        let cur = pages.index(of: viewController)!
        if cur == 0 { return nil }
        let prev = abs((cur - 1) % pages.count)
        return pages[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
        let cur = pages.index(of: viewController)!
        if cur == (pages.count - 1) { return nil }
        let nxt = abs((cur + 1) % pages.count)
        return pages[nxt]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController)-> Int {
        return pages.count
    }
}

extension DashboardPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let selectedVC = pageViewController.viewControllers?.first else { return }
        guard let selectedIndex = pages.index(of: selectedVC) else {return}
        self.pageControl.currentPage = selectedIndex
    }
}

extension DashboardPageViewController: GetDataDelegate{
    func getFlightData() {
        self.getData()
    }
}
