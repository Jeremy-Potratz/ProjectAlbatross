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
    
    func Pull(path : String, thisDate : String) -> [masterNine]{
        var newItems : [masterNine] = []
        if path == "Nine"{
            self.reference(withPath: "Nine").observe(.value, with: { (snapshot) in
                for i in snapshot.children{
                    let masterItem = masterNine(snapshot: i as! FIRDataSnapshot, theDate: thisDate)
                    newItems.append(masterItem!)
                }
            })
        }
        else if path == "Eighteen"{
        }
        return newItems
    }
    
    private func reference(withPath path: String) -> FIRDatabaseReference{
        let ref = FIRDatabase.database().reference(withPath: path)
        return ref
    }
}
