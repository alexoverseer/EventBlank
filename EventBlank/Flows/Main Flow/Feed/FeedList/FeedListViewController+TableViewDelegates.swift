//
//  FeedListViewController+TableViewDelegates.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/25/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import UIKit

extension FeedListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.datasource[indexPath.row])
        
        return cell
    }
}

extension FeedListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onShowConferenceDetails?(viewModel.datasource[indexPath.row])
    }
}
