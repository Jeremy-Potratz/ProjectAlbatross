//
//  masterEighteen.swift
//  ProjectAlbatross
//
//  Created by Jeremy Otto Potratz on 3/12/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

struct masterEighteen{
    
    let ref : FIRDatabaseReference?
    let key : String!
    let name : String!
    let date : String!
    let fairwaysFront : Int!
    let birdsFront : Int!
    let puttsFront : Int!
    let shortFront : Int!
    let hundoFront : Int!
    let greensFront : Int!
    let scoreFront : Int!
    let sneaksFront : Int!
    let fairwaysBack : Int!
    let birdsBack : Int!
    let puttsBack : Int!
    let shortBack : Int!
    let hundoBack : Int!
    let greensBack : Int!
    let scoreBack : Int!
    let sneaksBack : Int!
    let opponentScore : Int!
    let opponentName : String!
    
    init(key: String = "", name: String, birdsFront: Int, puttsFront: Int, shortFront: Int, hundoFront: Int, greensFront: Int, scoreFront: Int, sneaksFront: Int, fairwaysFront: Int,birdsBack: Int, puttsBack: Int, shortBack: Int, hundoBack: Int, greensBack: Int, scoreBack: Int, sneaksBack: Int, fairwaysBack: Int, date: String, opponentScore: Int, opponentName: String){
        
        self.ref = nil
        self.key = key
        self.date = date
        self.name = name
        self.birdsFront = birdsFront
        self.puttsFront = puttsFront
        self.shortFront = shortFront
        self.hundoFront = hundoFront
        self.greensFront = greensFront
        self.scoreFront = scoreFront
        self.sneaksFront = sneaksFront
        self.fairwaysFront = fairwaysFront
        
        self.birdsBack = birdsBack
        self.puttsBack = puttsBack
        self.shortBack = shortBack
        self.hundoBack = hundoBack
        self.greensBack = greensBack
        self.scoreBack = scoreBack
        self.sneaksBack = sneaksBack
        self.fairwaysBack = fairwaysBack
        
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
            birdsFront = (snapshotValue[theDate]!["birdsFront"] as! Int)
            puttsFront = (snapshotValue[theDate]!["puttsFront"] as! Int)
            shortFront = (snapshotValue[theDate]!["shortFront"] as! Int)
            greensFront = (snapshotValue[theDate]!["greensFront"] as! Int)
            scoreFront = (snapshotValue[theDate]!["scoreFront"] as! Int)
            hundoFront = (snapshotValue[theDate]!["hundoFront"] as! Int)
            sneaksFront = (snapshotValue[theDate]!["sneaksFront"] as! Int)
            fairwaysFront = (snapshotValue[theDate]!["fairwaysFront"] as! Int)
            
            birdsBack = (snapshotValue[theDate]!["birdsBack"] as! Int)
            puttsBack = (snapshotValue[theDate]!["puttsBack"] as! Int)
            shortBack = (snapshotValue[theDate]!["shortBack"] as! Int)
            greensBack = (snapshotValue[theDate]!["greensBack"] as! Int)
            scoreBack = (snapshotValue[theDate]!["scoreBack"] as! Int)
            hundoBack = (snapshotValue[theDate]!["hundoBack"] as! Int)
            sneaksBack = (snapshotValue[theDate]!["sneaksBack"] as! Int)
            fairwaysBack = (snapshotValue[theDate]!["fairwaysBack"] as! Int)
            
            opponentScore = (snapshotValue[theDate]!["opponentScore"] as! Int)
            opponentName = (snapshotValue[theDate]!["opponentName"] as! String)
            
        }
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        
        return[
            "name" : name,
            "date" : date ,
            "birdsFront" : birdsFront,
            "puttsFront" : puttsFront,
            "sneaksFront" : sneaksFront,
            "shortFront" : shortFront,
            "hundoFront" : hundoFront,
            "scoreFront" : scoreFront,
            "greensFront" : greensFront,
            "fairwaysFront" : fairwaysFront ,
            "birdsBack" : birdsBack,
            "puttsBack" : puttsBack,
            "sneaksBack" : sneaksBack,
            "shortBack" : shortBack,
            "hundoBack" : hundoBack,
            "scoreBack" : scoreBack,
            "greensBack" : greensBack,
            "fairwaysBack" : fairwaysBack ,
            "opponentName" : opponentName ,
            "opponentScore" : opponentScore ,
        ]
        
    }
    
    
    
    
}
