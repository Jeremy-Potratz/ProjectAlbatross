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
    
    let operation = Operation()
    self.operation.completionBlock = {
    print("Completed")
    }
    
    let networkingOperation: Operation = ...
    let resizingOperation: Operation = ...
        resizingOperation.addDependency(networkingOperation)
    
    let operationQueue = OperationQueue.main
    operationQueue.addOperations([networkingOperation, resizingOperation], waitUntilFinished: false)
    
    OperationQueue.main.addOperation(operation)
    
 
 */
    
    func pullFirebase(path: String) {
        var newItems : [[String:AnyObject]] = [[:]]

        if path == "Nine"{
            
            print(path)

            reference(withPath: "Nine").observe(.value, with: { (snapshot) in

                
                for item in snapshot.childSnapshot(forPath: "scott").children{
                    //input name as function parameter for generalization
                    let masterItem = ((item as! FIRDataSnapshot).value as! [String : AnyObject])
                    print(masterItem)
                    newItems.append(masterItem)
                    
                }
                
            })

        }
        
        let filter = newItems.filter {$0["name"] != nil }
        print(filter)
        if filter.count != 0{
            for i in filter{
                print(i)
                self.theXVal.append(String(describing: i["date"]!))
                self.theYVal.append(i["fairways"] as! Double)
                self.yAvgVal.append(i["putts"] as! Double)
            }
        }
        print(self.theXVal)
        print(self.theYVal)
        print(self.yAvgVal)
        
        if self.theXVal.count != 0{
        
            print("Make bar")
            
        barTView = CombinedChartView(frame: CGRect(x: 200, y: 200, width: 500, height: 500))
        barTView.lineData?.setValueTextColor(.black)
        
        setChart(xValues: theXVal, yValuesLineChart: theYVal, yValuesBarChart: yAvgVal)
        view.addSubview(barTView)
        view.bringSubview(toFront: barTView)
            
            
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
        
        pullFirebase(path: "Nine")


    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

    }
    
    func setChart(xValues: [String], yValuesLineChart: [Double], yValuesBarChart: [Double]) {
        barTView.noDataText = "Please provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        var yVals2 : [BarChartDataEntry] = [BarChartDataEntry]()
        
        for i in 0..<xValues.count {
            
            yVals1.append(ChartDataEntry(x: yValuesLineChart[i], y: Double(i)))
            yVals2.append(BarChartDataEntry(x: yValuesBarChart[i] - 1, y: Double(i)))
            
        }
        
        let lineChartSet = LineChartDataSet(values: yVals1, label: "Line Data")
        let barChartSet: BarChartDataSet = BarChartDataSet(values: yVals2, label: "Bar Data")
        
        let data : CombinedChartData = CombinedChartData(dataSets: [barChartSet, lineChartSet])
        data.barData = BarChartData(dataSet: barChartSet)
        data.lineData = LineChartData(dataSet: lineChartSet)
        barTView.data = data
        
    }

    
    
    
    
    

    

//    func updateChartWithData() {
//        var dataEntries: [BarChartDataEntry] = []
//        var ccDataEntries : [CombinedChartData] = []
//        for i in 0...6 {
//            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(Double(i) * 2/Double(i) * sin(Double(i))))
////            let ccDataEntry = CombinedChartData(dataSet: IChartDataSet.addEntry(4 as! IChartDataSet))
//            dataEntries.append(dataEntry)
//        }
//        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
//        let chartData = BarChartData(dataSet: chartDataSet)
//        barTView.data = chartData
//    }

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
