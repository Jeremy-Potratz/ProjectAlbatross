//
//  TabController.swift
//  ProjectAlbatross
//
//  Created by apcsp on 3/10/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    let screen = UIScreen.main.bounds
    let addTab = { () -> AddViewController in
        let screen = UIScreen.main.bounds
        let vc = AddViewController()
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
    
    let nineTab = { () -> NineStatsTableViewController in
        let vc = NineStatsTableViewController()
        vc.tabBarItem = UITabBarItem(title: "Nine Holes", image: nil, tag: 3)
        return vc
    }()
    
    let eightTab = { () -> EighteenStatsTableViewController in
        let vc = EighteenStatsTableViewController()
        vc.tabBarItem = UITabBarItem(title: "Eighteen Holes", image: nil, tag: 4)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(playerTab)
        self.addChildViewController(courseTab)
        self.addChildViewController(addTab)
        self.addChildViewController(nineTab)
        self.addChildViewController(eightTab)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
