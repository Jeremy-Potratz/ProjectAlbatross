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
    var barTView : CombinedChartView!
    var newItems : [[String:AnyObject]] = [[:]]
    var iter = 0
    
    func pullFirebase(path: String, kidName: String, statTrack: String) {
        // does not work if you try and save before or after opening

        
        if path == "Nine"{
            
            self.newItems = [[:]]
            self.theXVal = []
            self.theYVal = []
            self.yAvgVal = []
            iter = 0
            
            reference(withPath: "Nine").observe(.value, with: { (snapshot) in

                if self.iter == 0{

                for item in snapshot.childSnapshot(forPath: kidName).children{
                    let masterItem = ((item as! FIRDataSnapshot).value as! [String : AnyObject])
                    self.newItems.append(masterItem)
                    
                }
                var filter = self.newItems.filter {$0["name"] != nil && $0["date"] != nil}
                    
//                    days.sort({ $0.date.compare($1.date) == NSComparisonResult.OrderedAscending })

//                    filter.sort({})
                
                //need to re arrange by date most recent
                
                var avgCounter = 0.00
                var avgTotal = 0.00
                var avgY = 0.00
                
                
                if filter.count != 0{

                    for i in filter{
                        
                        avgCounter += 1
                        avgTotal += Double(i[statTrack]! as! NSNumber)
                        avgY = avgTotal / avgCounter
                        
                        self.theXVal.append(String(describing: i["date"]!))
                        print(String(describing: (i["date"]!)))
                        self.theYVal.append(avgY)
                        self.yAvgVal.append(Double(i[statTrack]! as! NSNumber))
                    }
                }
                
                if self.theXVal.count != 0{
                    
                    self.barTView = CombinedChartView(frame: CGRect(x: 200, y: 200, width: 1000, height: 500))

                    
                    self.setChart(xValues: self.theXVal, yValuesLineChart: self.theYVal, yValuesBarChart: self.yAvgVal, statTrack: statTrack)
             
                }
                filter = [[:]]
                 avgCounter = 0.00
                 avgTotal = 0.00
                 avgY = 0.00

                    self.iter += 1
                }
                
            })
            
            
        }
    }
    
    func reference(withPath path: String) -> FIRDatabaseReference{
        
        let ref = FIRDatabase.database().reference(withPath: path)
        return ref
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        reset()
        
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
    
    func reset(){
        if (theXVal.count != 0){
            
            barTView.removeFromSuperview()
            view.willRemoveSubview(barTView)
            barTView.clear()
            barTView.data?.clearValues()
            barTView.lineData?.clearValues()
            barTView.barData?.clearValues()
        }
        theXVal = []
        theYVal = []
        yAvgVal = []
        newItems = [[:]]
    }
    
    func evalTheSection(){
        switch  sectionController.selectedSegmentIndex {
        case 0:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "birdies")

        case 1:
            
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "greens")
            
        case 2:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "putts")
            
        case 3:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "sneaks")
        case 4:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "fairways")
        case 5:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "hundo")
        case 6:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "score")
            
        case 7:
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "short")
        default:
            
            reset()
            
            pullFirebase(path: "Nine", kidName: "scott", statTrack: "")
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        reset()

        view.addSubview(sectionController)
        sectionController.addTarget(self, action: #selector(evalTheSection), for: .allEvents)

    }
    
    func setChart(xValues: [String], yValuesLineChart: [Double], yValuesBarChart: [Double], statTrack: String) {
        barTView.noDataText = "Please provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        var yVals2 : [BarChartDataEntry] = [BarChartDataEntry]()
        
        for i in 0..<xValues.count {
            yVals1.append(ChartDataEntry(x: Double(i), y: yValuesLineChart[i]))
            yVals2.append(BarChartDataEntry(x: Double(i), y: yValuesBarChart[i]))

        }
        
        let lineChartSet = LineChartDataSet(values: yVals1, label: "Average \(statTrack)")
        let barChartSet: BarChartDataSet = BarChartDataSet(values: yVals2, label: "\(statTrack)")
        lineChartSet.setColor(.red, alpha: 1)
        lineChartSet.setCircleColor(.green)
        
        
        
        
        let data : CombinedChartData = CombinedChartData(dataSets: [barChartSet, lineChartSet])
        data.barData = BarChartData(dataSet: barChartSet)
        data.lineData = LineChartData(dataSet: lineChartSet)
        barTView.data = data
        
        barTView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xValues)
        
        view.addSubview(self.barTView)
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
