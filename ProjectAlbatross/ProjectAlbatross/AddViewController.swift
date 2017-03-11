//
//  AddViewController.swift
//  ProjectAlbatross
//
//  Created by Scott on 3/10/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let screen = UIScreen.main.bounds
    let players = ["Scott", "Jimmy"]
    let courses = ["Golfc", "c"]
    var playerPicker = UIPickerView()
    var coursePicker = UIPickerView()
    var chooser = UISegmentedControl()
    var textBoxContainer = UIView()
    var nineView = UIView()
    var eightView = UIView()
    var mode = "nine"
    var submitButton = UIButton()
    let nineStats = ["fairways","putts","hundred","gir","sneaks","score","birds","shorts","oppoName","oppoScore"]
    
    let eightStats = ["fairwaysF","girF","puttsF","hundredF", "sneaksF", "birds", "shortsF","scoreF", "fairwaysB","girB","puttsB","hundredB","sneaksB","birdsB","shortsB","scoreB"]
    
    override func viewDidAppear(_ animated: Bool) {
        coursePicker.reloadAllComponents()
        playerPicker.reloadAllComponents()
    }
    
    func initRight(){
//        chooser = UISegmentedControl(items: ["Nine", "Eighteen"])
//        chooser.frame = CGRect(x: screen.width * 3 / 4 - (screen.width / 2 - 50) / 2, y: 15, width: screen.width / 2 - 50, height: 50)
//        chooser.selectedSegmentIndex = 0
//        chooser.isOpaque = false
        
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
        //self.view.addSubview(textBoxContainer)
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
                let field = UITextField()
                field.frame = CGRect(x: x, y: y, width: Int(textBoxContainer.frame.width / 2) - 5, height: 60)
                field.placeholder = i
                field.tag = tag
                field.textAlignment = .center
                field.backgroundColor = .white
                field.layer.cornerRadius = CGFloat(5)
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
            //self.view.addSubview(textBoxContainer)
        }
        else{
            //generate eighteen hole fields
            var x = 5
            var y = 5
            var tag = 0
            for i in eightStats{
                let field = UITextField()
                field.frame = CGRect(x: x, y: y, width: Int(textBoxContainer.frame.width / 2) - 5, height: 50)
                field.placeholder = i
                field.tag = tag
                field.textAlignment = .center
                field.backgroundColor = .white
                field.layer.cornerRadius = CGFloat(5)
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
            //self.view.addSubview(textBoxContainer)
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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        if eightView.frame.contains(point!){
            self.mode = "eighteen"
            self.eightView.backgroundColor = .gray
            self.nineView.backgroundColor = .lightGray
            self.generateFields()
        }
        else if nineView.frame.contains(point!){
            self.mode = "nine"
            self.eightView.backgroundColor = .lightGray
            self.nineView.backgroundColor = .gray
            self.generateFields()
        }
        
    }
    
    func initLeft(){
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screen.width / 2, height: screen.height / 3))
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor(colorLiteralRed: 101 / 255, green: 244 / 255, blue: 66 / 255, alpha: 1)
        
        playerPicker = UIPickerView(frame: CGRect(x: 0, y: datePicker.frame.height, width: screen.width / 2, height: screen.height / 3))
        playerPicker.delegate = self
        playerPicker.dataSource = self
        playerPicker.backgroundColor = UIColor(colorLiteralRed: 101 / 255, green: 244 / 255, blue: 66 / 255, alpha: 1)
        
        coursePicker = UIPickerView(frame: CGRect(x: 0, y: datePicker.frame.height + playerPicker.frame.height, width: screen.width / 2, height: screen.height / 3))
        coursePicker.delegate = self
        coursePicker.dataSource = self
        coursePicker.backgroundColor = UIColor(colorLiteralRed: 101 / 255, green: 244 / 255, blue: 66 / 255, alpha: 1)
    
        self.view.addSubview(datePicker)
        self.view.addSubview(playerPicker)
        self.view.addSubview(coursePicker)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLeft()
        self.initRight()
        self.generateFields()
        self.view.backgroundColor = .lightGray
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            return players[row]
        }
        else{
            return courses[row]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
