//
//  PlayerTableViewController.swift
//  ProjectAlbatross
//
//  Created by apcsp on 3/10/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit

fileprivate struct C {
    struct CellHeight {
        static let close: CGFloat = 61 // equal or greater foregroundView height
        static let open: CGFloat = 315 // equal or greater containerView height
    }
}

class PlayerTableViewController: UITableViewController {
    
    var cellHeights = (0..<3).map { _ in C.CellHeight.close }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PlayerTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "playerCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        var duration = 0.0
        if cellHeights[indexPath.row] == C.CellHeight.close { // open cell
            cellHeights[indexPath.row] = C.CellHeight.open
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = C.CellHeight.close
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { _ in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as FoldingCell = cell {
            if cellHeights[indexPath.row] == C.CellHeight.close {
                cell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        cell.foregroundNameLabel.text = "Scott"
        cell.containerNameLabel.text = "Scott"
        cell.fairwaysLabel.text = "Fair"
        cell.puttsLabel.text = "Putts"
        cell.scoreLabel.text = "Score"
        cell.shortsLabel.text = "Shorts"
        cell.greensLabel.text = "Gir"
        cell.hundredsLabel.text = "Hundo"
        cell.birdsLabel.text = "Bird"
        cell.sneaksLabel.text = "Sneak"
        return cell
    }

    

}
