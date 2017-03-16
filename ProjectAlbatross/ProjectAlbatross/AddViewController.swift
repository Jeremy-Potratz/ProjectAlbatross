//
//  AddViewController.swift
//  ProjectAlbatross
//
//  Created by Scott on 3/10/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class statField : UITextField, UITextFieldDelegate{
    var rawValue : String?
    override init(frame: CGRect) {
        print("Init")
        super.init(frame: frame)
        self.delegate = self
        self.rawValue = nil
        self.textAlignment = .center
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Done")
        self.rawValue = self.text
        self.text = "\(self.placeholder!): \(self.rawValue!)"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin")
        self.text = ""
    }
}

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pullFirebase(path: String, thisDate : String) {
        if path == "Nine"{
            reference(withPath: "Nine").observe(.value, with: { (snapshot) in
                var newItems : [masterNine] = []
                for item in snapshot.children{
                    let masterItem = masterNine(snapshot: item as! FIRDataSnapshot, theDate: thisDate)
                    if masterItem == nil{
                    }else{
                        newItems.append((masterItem)!)
                    }
                }
                let filter = newItems.filter {$0.name == self.name && $0.date == self.date}
                
                if filter.count != 0{
                    (self.textBoxContainer.subviews[0] as! UITextField).text = String(filter[0].fairways)
                    (self.textBoxContainer.subviews[1] as! UITextField).text = String(filter[0].putts)
                    (self.textBoxContainer.subviews[2] as! UITextField).text = String(filter[0].hundo)
                    (self.textBoxContainer.subviews[3] as! UITextField).text = String(filter[0].greens)
                    (self.textBoxContainer.subviews[4] as! UITextField).text = String(filter[0].sneaks)
                    (self.textBoxContainer.subviews[5] as! UITextField).text = String(filter[0].score)
                    (self.textBoxContainer.subviews[6] as! UITextField).text = String(filter[0].birdies)
                    (self.textBoxContainer.subviews[7] as! UITextField).text = String(filter[0].short)
                    (self.textBoxContainer.subviews[8] as! UITextField).text = String(filter[0].opponentName)
                    (self.textBoxContainer.subviews[9] as! UITextField).text = String(filter[0].opponentScore)
                }else{
                    (self.textBoxContainer.subviews[0] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[1] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[2] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[3] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[4] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[5] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[6] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[7] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[8] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[9] as! UITextField).text = ""
                }
            })
        }else if path == "Eight"{
            reference(withPath: "Eighteen").observe(.value, with: { (snapshot) in
                var newItems : [masterEighteen] = []
                for item in snapshot.children{
                    let masterItem = masterEighteen(snapshot: item as! FIRDataSnapshot, theDate: thisDate)
                    if masterItem == nil{
                    }else{
                        newItems.append((masterItem)!)
                    }
                }
                let filter = newItems.filter {$0.name == self.name && $0.date == self.date}

                if filter.count != 0{
                    (self.textBoxContainer.subviews[0] as! UITextField).text = String(filter[0].fairwaysFront)
                    (self.textBoxContainer.subviews[1] as! UITextField).text = String(filter[0].greensFront)
                    (self.textBoxContainer.subviews[2] as! UITextField).text = String(filter[0].puttsFront)
                    (self.textBoxContainer.subviews[3] as! UITextField).text = String(filter[0].hundoFront)
                    (self.textBoxContainer.subviews[4] as! UITextField).text = String(filter[0].sneaksFront)
                    (self.textBoxContainer.subviews[5] as! UITextField).text = String(filter[0].birdsFront)
                    (self.textBoxContainer.subviews[6] as! UITextField).text = String(filter[0].shortFront)
                    (self.textBoxContainer.subviews[7] as! UITextField).text = String(filter[0].scoreFront)
                    (self.textBoxContainer.subviews[8] as! UITextField).text = String(filter[0].fairwaysBack)
                    (self.textBoxContainer.subviews[9] as! UITextField).text = String(filter[0].greensBack)
                    (self.textBoxContainer.subviews[10] as! UITextField).text = String(filter[0].puttsBack)
                    (self.textBoxContainer.subviews[11] as! UITextField).text = String(filter[0].hundoBack)
                    (self.textBoxContainer.subviews[12] as! UITextField).text = String(filter[0].sneaksBack)
                    (self.textBoxContainer.subviews[13] as! UITextField).text = String(filter[0].birdsBack)
                    (self.textBoxContainer.subviews[14] as! UITextField).text = String(filter[0].shortBack)
                    (self.textBoxContainer.subviews[15] as! UITextField).text = String(filter[0].scoreBack)
                }else{
                    (self.textBoxContainer.subviews[0] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[1] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[2] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[3] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[4] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[5] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[6] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[7] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[8] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[9] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[10] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[11] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[12] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[13] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[14] as! UITextField).text = ""
                    (self.textBoxContainer.subviews[15] as! UITextField).text = ""
                }
            })
        }
    }

    let screen = UIScreen.main.bounds
    let players = ["Scott", "Jimmy"]
    let courses = ["Golfc", "c"]
    var playerPicker = UIPickerView()
    var coursePicker = UIPickerView()
    var datePicker = UIDatePicker()
    var chooser = UISegmentedControl()
    var textBoxContainer = UIView()
    var nineView = UIView()
    var eightView = UIView()
    var mode = "nine"
    var submitButton = UIButton()
    var dateLabel = UILabel()
    var name : String!
    var date : String!
    var course : String!
    let nineStats = ["fairways","putts","hundred","gir","sneaks","score","birds","shorts","oppoName","oppoScore"]
    
    let eightStats = ["fairwaysF","girF","puttsF","hundredF", "sneaksF", "birds", "shortsF","scoreF", "fairwaysB","girB","puttsB","hundredB","sneaksB","birdsB","shortsB","scoreB"]
    
    override func viewDidAppear(_ animated: Bool) {
        coursePicker.reloadAllComponents()
        playerPicker.reloadAllComponents()
        
        
        
    }
    
    func reference(withPath path: String) -> FIRDatabaseReference{
        let ref = FIRDatabase.database().reference(withPath: path)
        return ref
        
    }
    
    func initRight(){
        nineView.frame = CGRect(x: Int(screen.width / 2), y: 0, width: Int(screen.width / 4), height: 100)
        nineView.backgroundColor = .gray
        let nineLabel = UILabel(frame: CGRect(x: 0, y: 0, width: nineView.frame.width, height: nineView.frame.height))
        nineLabel.text = "Nine"
        nineLabel.textColor = .black
        nineLabel.textAlignment = .center
        nineView.addSubview(nineLabel)
        
        eightView.frame = CGRect(x: screen.width * 3 / 4, y: 0, width: screen.width / 4, height: 100)
        eightView.backgroundColor = .lightGray
        let eightLabel = UILabel(frame: CGRect(x: 0, y: 0, width: eightView.frame.width, height: eightView.frame.height))
        eightLabel.text = "Eighteen"
        eightLabel.textColor = .black
        eightLabel.textAlignment = .center
        eightView.addSubview(eightLabel)
        
        textBoxContainer.frame = CGRect(x: screen.width / 2, y: 100, width: screen.width / 2, height: screen.height - 45)
        textBoxContainer.backgroundColor = .green
        self.view.addSubview(nineView)
        self.view.addSubview(eightView)
        self.view.addSubview(chooser)
    }
    
    func generateFields(){
        for i in textBoxContainer.subviews{
            i.removeFromSuperview()
        }
        if self.mode == "nine"{
            //generate nine hole fields
            var x = 5
            var y = 5
            var tag = 0
            for i in nineStats{
                let field = statField()
                field.frame = CGRect(x: x, y: y, width: Int(textBoxContainer.frame.width / 2) - 5, height: 60)
                field.placeholder = i
                field.rawValue = i
                field.tag = tag
                textBoxContainer.addSubview(field)
                if i == "sneaks"{
                    x = Int(textBoxContainer.frame.width) / 2 + 5
                    print(x)
                    y = 5
                }
                else{
                    y += 70
                }
                
                tag += 1
            }
        }
        else{
            //generate eighteen hole fields
            var x = 5
            var y = 5
            var tag = 0
            for i in eightStats{
                let field = statField()
                field.frame = CGRect(x: x, y: y, width: Int(textBoxContainer.frame.width / 2) - 5, height: 50)
                field.placeholder = i
                field.rawValue = i
                field.tag = tag
                textBoxContainer.addSubview(field)
                if i == "scoreF"{
                    x = Int(textBoxContainer.frame.width) / 2 + 5
                    print(x)
                    y = 5
                }
                else{
                    y += 70
                }
                
                tag += 1
            }
        }
        submitButton.frame = CGRect(x: 0, y: textBoxContainer.frame.height - 170, width: textBoxContainer.frame.width, height: 50)
        submitButton.backgroundColor = .blue
        submitButton.addTarget(self, action: #selector(AddViewController.submit), for: .touchUpInside)
        submitButton.layer.cornerRadius = CGFloat(8)
        let submitLabel = UILabel()
        submitLabel.frame = CGRect(x: 0, y: 0, width: submitButton.frame.width, height: submitButton.frame.height)
        submitLabel.textAlignment = .center
        submitLabel.text = "Submit"
        submitLabel.textColor = .black
        submitButton.addSubview(submitLabel)
        textBoxContainer.addSubview(submitButton)
        self.view.addSubview(textBoxContainer)
    }
    
    func submit(){
        print("Submit")
        print(self.mode)
        
        if mode == "nine"{
            let nineStat = masterNine(name: name, birdies: Int(((textBoxContainer.subviews[6] as? UITextField)?.text)!)!, putts: Int(((textBoxContainer.subviews[1] as? UITextField)?.text)!)!, short: Int(((textBoxContainer.subviews[7] as? UITextField)?.text)!)!, hundo: Int(((textBoxContainer.subviews[2] as? UITextField)?.text)!)!, greens: Int(((textBoxContainer.subviews[3] as? UITextField)?.text)!)!, score: Int(((textBoxContainer.subviews[5] as? UITextField)?.text)!)!, sneaks: Int(((textBoxContainer.subviews[4] as? UITextField)?.text)!)!, fairways: Int(((textBoxContainer.subviews[0] as? UITextField)?.text)!)!, date: date, opponentScore: Int(((textBoxContainer.subviews[9] as? UITextField)?.text)!)!, opponentName: ((textBoxContainer.subviews[8] as? UITextField)?.text)!)
            let nineStatRef = self.reference(withPath: "Nine").child(name.lowercased()).child(date)
            nineStatRef.setValue(nineStat.toAnyObject())

        }else{
            let eighteenStat = masterEighteen(name: name, birdsFront: Int(((textBoxContainer.subviews[5] as? UITextField)?.text)!)!, puttsFront: Int(((textBoxContainer.subviews[6] as? UITextField)?.text)!)!, shortFront: Int(((textBoxContainer.subviews[2] as? UITextField)?.text)!)!, hundoFront: Int(((textBoxContainer.subviews[3] as? UITextField)?.text)!)!, greensFront: Int(((textBoxContainer.subviews[1] as? UITextField)?.text)!)!, scoreFront: Int(((textBoxContainer.subviews[7] as? UITextField)?.text)!)!, sneaksFront: Int(((textBoxContainer.subviews[4] as? UITextField)?.text)!)!, fairwaysFront: Int(((textBoxContainer.subviews[0] as? UITextField)?.text)!)!, birdsBack: Int(((textBoxContainer.subviews[13] as? UITextField)?.text)!)!, puttsBack: Int(((textBoxContainer.subviews[10] as? UITextField)?.text)!)!, shortBack: Int(((textBoxContainer.subviews[14] as? UITextField)?.text)!)!, hundoBack: Int(((textBoxContainer.subviews[11] as? UITextField)?.text)!)!, greensBack: Int(((textBoxContainer.subviews[9] as? UITextField)?.text)!)!, scoreBack: Int(((textBoxContainer.subviews[15] as? UITextField)?.text)!)!, sneaksBack: Int(((textBoxContainer.subviews[12] as? UITextField)?.text)!)!, fairwaysBack: Int(((textBoxContainer.subviews[8] as? UITextField)?.text)!)!, date: date, opponentScore: 0, opponentName: "")
            let eighteenStatRef = self.reference(withPath: "Eighteen").child(name.lowercased()).child(date)
            eighteenStatRef.setValue(eighteenStat.toAnyObject())
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        if eightView.frame.contains(point!){
            self.mode = "eighteen"
            self.eightView.backgroundColor = .gray
            self.nineView.backgroundColor = .lightGray
            self.generateFields()
            pullFirebase(path: "Eight", thisDate: date)
        }
        else if nineView.frame.contains(point!){
            self.mode = "nine"
            self.eightView.backgroundColor = .lightGray
            self.nineView.backgroundColor = .gray
            self.generateFields()
            pullFirebase(path: "Nine", thisDate: date)
        }
    }
    
    func dateDeclare(){
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let strDate = dateFormatter.string(from: datePicker.date)

        dateLabel.text = strDate
        date = strDate
        
        if self.mode == "nine"{
        pullFirebase(path: "Nine", thisDate: date)
        }else{
        pullFirebase(path: "Eight", thisDate: date)
        }
    }

    func initLeft(){

        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screen.width / 2, height: screen.height / 3))
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor(colorLiteralRed: 101 / 255, green: 244 / 255, blue: 66 / 255, alpha: 1)
        
        datePicker.addTarget(self, action: #selector(AddViewController.dateDeclare), for: .valueChanged)
        
        
        dateLabel = UILabel(frame: CGRect(x: 0, y: 50, width: screen.width / 2, height: screen.width / 3))
        dateLabel.textColor = .black
        
        playerPicker = UIPickerView(frame: CGRect(x: 0, y: datePicker.frame.height, width: screen.width / 2, height: screen.height / 3))
        playerPicker.delegate = self
        playerPicker.dataSource = self
        playerPicker.backgroundColor = UIColor(colorLiteralRed: 101 / 255, green: 244 / 255, blue: 66 / 255, alpha: 1)
        
        coursePicker = UIPickerView(frame: CGRect(x: 0, y: datePicker.frame.height + playerPicker.frame.height, width: screen.width / 2, height: screen.height / 3))
        coursePicker.delegate = self
        coursePicker.dataSource = self
        coursePicker.backgroundColor = UIColor(colorLiteralRed: 101 / 255, green: 244 / 255, blue: 66 / 255, alpha: 1)
    
        self.view.addSubview(datePicker)
        self.view.addSubview(dateLabel)
        view.bringSubview(toFront: dateLabel)
        self.view.addSubview(playerPicker)
        self.view.addSubview(coursePicker)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLeft()
        self.initRight()
        self.generateFields()
        self.view.backgroundColor = .lightGray
        
        name = players[0]
        course = courses[0]
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let strDate = dateFormatter.string(from: datePicker.date)
        
        dateLabel.text = strDate
        date = strDate
        
        if self.mode == "nine"{
        
        pullFirebase(path: "Nine", thisDate: date)

        }else{
            
        pullFirebase(path: "Eight", thisDate: date)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.playerPicker{
            return players.count
        }
        else{
            return courses.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.playerPicker{
            
            name = players[row]

            if self.mode == "nine"{
            pullFirebase(path: "Nine", thisDate: date)
            }else{
            pullFirebase(path: "Eight", thisDate: date)
            }
            

            return players[row]
        }
        else{
            
            return courses[row]
            
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.playerPicker{
            name = players[row]
        }else if pickerView == self.coursePicker{
            course = courses[row]
        }
    }
}
