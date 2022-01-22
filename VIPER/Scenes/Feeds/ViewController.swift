//
//  ViewController.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import UIKit

class ViewController: BaseView,UITableViewDataSource,UITableViewDelegate,FeedsViewProtocol {
    @IBOutlet weak var feedTableView:UITableView!
    var presnter: FeedsPresnterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settupTableView()
        presnter?.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    private func settupTableView(){
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presnter!.numberofRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsTableViewCell", for: indexPath) as! FeedsTableViewCell
        presnter?.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    func showLoadingIndicator() {
        print("success")
        startLoading()
    }
    
    func hideLoadingIndicator() {
        print("error")
        endLoading()
    }
    func reloadData() {
        feedTableView.reloadData()
    }
    
}

