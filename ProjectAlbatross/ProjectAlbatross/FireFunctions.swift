//
//  FireFunctions.swift
//  ProjectAlbatross
//
//  Created by apcsp on 4/6/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class FireFunctions{
    
    static let shared = FireFunctions()
            
//            self.reference(withPath: "Nine").observe(.value, with: { (snapshot) in
//                for i in snapshot.children.allObjects{
//                    newItems?.append(i)
//                }
//            })

    
    func reference(withPath path: String) -> FIRDatabaseReference{
        let ref = FIRDatabase.database().reference(withPath: path)
        return ref
    }
}
