//
//  MineViewController.swift
//  FootPrint
//
//  Created by Justin on 2018/11/22.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit
class MineViewController: UITableViewController {

    var cellData = [[mineCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.yellow
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.setBackgroundColor()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: String(describing: mineCustomCell.self), bundle: nil), forCellReuseIdentifier: String(describing: mineCustomCell.self))
        
        NetworkTool.loadMineData{ cellData in
            self.cellData = cellData
            self.tableView.reloadData()
        }
    }
    
}

extension MineViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cellData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.setBackgroundColor()
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: mineCustomCell.self)) as! mineCustomCell
        cell.mineCellTitle.text = cellData[indexPath.section][indexPath.row].text
        cell.mineCellDesText.text = cellData[indexPath.section][indexPath.row].grey_text
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
