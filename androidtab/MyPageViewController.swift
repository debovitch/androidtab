//
//  MyPageViewController.swift
//  androidtab
//
//  Created by Thierry DUCHASSIN on 20/12/2016.
//  Copyright © 2016 Thierry DUCHASSIN. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    var tab1ViewController: UIViewController?
    var tab2ViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab1ViewController = storyboard?.instantiateViewController(withIdentifier: "Tab1ViewController")
        tab2ViewController = storyboard?.instantiateViewController(withIdentifier: "Tab2ViewController")
        setViewControllers([tab1ViewController!], direction: .forward, animated: true)
        dataSource = self
    }

}

extension MyPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return (viewController == tab2ViewController) ? tab1ViewController : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return (viewController == tab1ViewController) ? tab2ViewController : nil
    }
    
}
