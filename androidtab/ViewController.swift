//
//  ViewController.swift
//  androidtab
//
//  Created by Thierry DUCHASSIN on 20/12/2016.
//  Copyright © 2016 Thierry DUCHASSIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnTab1: UIButton!
    @IBOutlet weak var btnTab2: UIButton!
    
    var pageViewController: MyPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        btnTab1.setTitle("Tab 1 selected", for: .selected)
        btnTab2.setTitle("Tab 2 selected", for: .selected)
        btnTab1.isSelected = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPageView" {
            pageViewController = segue.destination as? MyPageViewController
            pageViewController?.delegate = self
        }
    }

    @IBAction func tapOnBtnTab1(_ sender: Any) {
        guard let tab1ViewController = pageViewController?.tab1ViewController else { return }
        pageViewController?.setViewControllers([tab1ViewController], direction: .reverse, animated: false) { [weak self] finished in
            if finished {
                self?.btnTab1.isSelected = true
                self?.btnTab2.isSelected = false
            }
        }
    }
    
    @IBAction func tapOnBtnTab2(_ sender: Any) {
        guard let tab2ViewController = pageViewController?.tab2ViewController else { return }
        pageViewController?.setViewControllers([tab2ViewController], direction: .forward, animated: false) { [weak self] finished in
            if finished {
                self?.btnTab2.isSelected = true
                self?.btnTab1.isSelected = false
            }
        }
    }
    
}

extension ViewController: UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            btnTab1.isSelected = previousViewControllers.first == (pageViewController as? MyPageViewController)?.tab2ViewController
            btnTab2.isSelected = !btnTab1.isSelected
        }
    }
    
}
