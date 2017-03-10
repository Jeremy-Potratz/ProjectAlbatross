//
//  TabController.swift
//  ProjectAlbatross
//
//  Created by apcsp on 3/10/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    let addTab = { () -> ViewController in 
        let vc = ViewController()
        vc.tabBarItem = UITabBarItem(title: "Add", image: nil, tag: 2)
        return vc
    }()
    
    let playerTab = { () -> PlayerTableViewController in 
        let vc = PlayerTableViewController()
        vc.tabBarItem = UITabBarItem(title: "Players", image: nil, tag: 0)
        return vc
    }()
    
    let courseTab = { () -> CourseTableViewController in
        let vc = CourseTableViewController()
        vc.tabBarItem = UITabBarItem(title: "Courses", image: nil, tag: 1)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(playerTab)
        self.addChildViewController(courseTab)
        self.addChildViewController(addTab)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
