//
//  HomeViewController+TableView.swift
//  Taxol
//
//  Created by Chris Stev on 27/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let searchCount = searchResult?.count ?? 0
        return section == 0 ? 2 : searchCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        if indexPath.section == 1 {
            if let search = searchResult {
                cell.placemark = search[indexPath.row]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Section 1" : "Section 2"
    }
    
}
