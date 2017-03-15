//
//  masterNine.swift
//  ProjectAlbatross
//
//  Created by Jeremy Otto Potratz on 3/12/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

struct masterNine{
    
    let ref : FIRDatabaseReference?
    let key : String!
    let name : String!
    let date : String!
    let fairways : Int!
    let birdies : Int!
    let putts : Int!
    let short : Int!
    let hundo : Int!
    let greens : Int!
    let score : Int!
    let sneaks : Int!
    let opponentScore : Int!
    let opponentName : String!
    
    init(key: String = "", name: String, birdies: Int, putts: Int, short: Int, hundo: Int, greens: Int, score: Int, sneaks: Int, fairways: Int, date: String, opponentScore: Int, opponentName: String){
        
        self.ref = nil
        self.key = key
        self.name = name
        self.birdies = birdies
        self.putts = putts
        self.short = short
        self.hundo = hundo
        self.greens = greens
        self.score = score
        self.sneaks = sneaks
        self.date = date
        self.fairways = fairways
        
        self.opponentName = opponentName
        self.opponentScore = opponentScore
        
    }
    
    init?(snapshot: FIRDataSnapshot, theDate: String){
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String : AnyObject]
        
        if snapshotValue[theDate]?["name"] == nil{
            
            return nil
            
        }else{
            
            name = (snapshotValue[theDate]!["name"] as! String)
            date = (snapshotValue[theDate]!["date"] as! String)
            birdies = (snapshotValue[theDate]!["birdies"] as! Int)
            putts = (snapshotValue[theDate]!["putts"] as! Int)
            short = (snapshotValue[theDate]!["short"] as! Int)
            greens = (snapshotValue[theDate]!["greens"] as! Int)
            score = (snapshotValue[theDate]!["score"] as! Int)
            hundo = (snapshotValue[theDate]!["birdies"] as! Int)
            sneaks = (snapshotValue[theDate]!["sneaks"] as! Int)
            fairways = (snapshotValue[theDate]!["fairways"] as! Int)
            opponentScore = (snapshotValue[theDate]!["opponentScore"] as! Int)
            opponentName = (snapshotValue[theDate]!["opponentName"] as! String)
            
        }
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        
        return[
            "name" : name,
            "date" : date ,
            "birdies" : birdies,
            "putts" : putts,
            "sneaks" : sneaks,
            "short" : short,
            "hundo" : hundo,
            "score" : score,
            "greens" : greens,
            "fairways" : fairways ,
            "opponentName" : opponentName ,
            "opponentScore" : opponentScore ,
        ]
        
    }
     
    
}
