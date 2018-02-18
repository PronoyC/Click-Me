//
//  ViewController.swift
//  Click Me
//
//  Created by Pronoy Chaudhuri on 2018-02-18.
//  Copyright © 2018 Pronoy Chaudhuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let minimumTappableHeight: CGFloat = 75
        let button = UIButton(frame: CGRect(x: 0, y: 0,
                                            width: minimumTappableHeight,
                                            height: minimumTappableHeight))
        button.center = self.view.center
        button.layer.cornerRadius = minimumTappableHeight / 2
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.setTitle("Click Me", for: .normal)
        button.setTitle("Click Me", for: .highlighted)
        
        return button
    }()
    
    @objc func drag(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: UIControlEvents.touchDragInside)
        button.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: [UIControlEvents.touchDragExit,
                               UIControlEvents.touchDragOutside])
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

