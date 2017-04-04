//
//  NineStatsTableViewController.swift
//  ProjectAlbatross
//
//  Created by Scott on 3/10/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit
import Charts
import Firebase
import FirebaseDatabase

class NineStatsTableViewController: UITableViewController {
    var theXVal : [String] = []
    var theYVal : [Double] = []
    var yAvgVal : [Double] = []

    
   /* http://nshipster.com/nsoperation/
     
     http://www.knowstack.com/swift-concurrency-nsoperation-nsoperationqueue/
     
*/
    
    var newItems : [[String:AnyObject]] = [[:]]

    
    
    
    func pullFirebase(path: String, kidName: String, statTrack: String) {
        

        if path == "Nine"{
            
            reference(withPath: "Nine").observe(.value, with: { (snapshot) in

                
                for item in snapshot.childSnapshot(forPath: kidName).children{
                    //input name as function parameter for generalization
                    let masterItem = ((item as! FIRDataSnapshot).value as! [String : AnyObject])
                    print(masterItem)
                    self.newItems.append(masterItem)
                    
                }
                let filter = self.newItems.filter {$0["name"] != nil }
                print(filter)
                if filter.count != 0{
                    for i in filter{
         
                        self.theXVal.append(String(describing: i["date"]!))
                        self.theYVal.append(i[statTrack] as! Double)
                        self.yAvgVal.append(i["sneaks"] as! Double)
                    }
                }
                print(self.theXVal,self.theYVal,self.yAvgVal)
                
                if self.theXVal.count != 0{
                    
                    self.barTView = CombinedChartView(frame: CGRect(x: 200, y: 200, width: 500, height: 500))
                    
                    self.setChart(xValues: self.theXVal, yValuesLineChart: self.theYVal, yValuesBarChart: self.yAvgVal)
             
                }
            })
        }
    }
    
    func reference(withPath path: String) -> FIRDatabaseReference{
        
        let ref = FIRDatabase.database().reference(withPath: path)
        print("HELLO")
        return ref
        
    }

    var barTView : CombinedChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pullFirebase(path: "Nine", kidName: "greens", statTrack: "sneaks")


    }
    
    var sectionController : UISegmentedControl = { () -> UISegmentedControl in
        var items = ["Birdies","GIR","Putts","Sneaks","Fairways","100 and in","Score","Short"]
        var segment = UISegmentedControl()
        segment = UISegmentedControl(items: items)
        segment.backgroundColor = .red
        segment.frame = CGRect(x: 100, y: 100, width: 600, height: 100)
        segment.layer.cornerRadius = 5
        
        return segment
    }()
    
    func evalTheSection(){
        switch  sectionController.selectedSegmentIndex {
        case 0:
            print("Hi")
        case 1:
            print("Hello Numba one")
        default:
            print("NOOOO")
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        view.addSubview(sectionController)
        sectionController.addTarget(self, action: #selector(evalTheSection), for: .allEvents)
        
    }
    
    func setChart(xValues: [String], yValuesLineChart: [Double], yValuesBarChart: [Double]) {
        barTView.noDataText = "Please provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        var yVals2 : [BarChartDataEntry] = [BarChartDataEntry]()
        
        for i in 0..<xValues.count {

            yVals1.append(ChartDataEntry(x: Double(i), y: yValuesLineChart[i]))
            yVals2.append(BarChartDataEntry(x: Double(i), y: yValuesBarChart[i] - 1))
        }
        
        let lineChartSet = LineChartDataSet(values: yVals1, label: "Line Data")
        let barChartSet: BarChartDataSet = BarChartDataSet(values: yVals2, label: "Bar Data")
        
        lineChartSet.setColor(.red, alpha: 1)
        lineChartSet.setCircleColor(.green)
        
        
        
        let data : CombinedChartData = CombinedChartData(dataSets: [barChartSet, lineChartSet])
        data.barData = BarChartData(dataSet: barChartSet)
        data.lineData = LineChartData(dataSet: lineChartSet)
        barTView.data = data
        
        view.addSubview(self.barTView)

        view.bringSubview(toFront: self.barTView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
