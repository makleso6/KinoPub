//
//  BookmarksViewController.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import UIKit
import Combine
import CombineDataSources

public final class BookmarksViewController: UIHostingController<BookmarksView> {
    private var dispose: Set<AnyCancellable> = .init()

    let model: BookmarksViewModel
    init(model: BookmarksViewModel) {
        self.model = model
        let view = BookmarksView(viewModel: model)
        super.init(rootView: view)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class _BookmarksViewController: UIViewController {
    struct Person: Hashable {
        var name: String
    }
    
    var subscriptions = [AnyCancellable]()

    let people =
      [Person(name: "Julia"), Person(name: "Vicki")]
    
    
    lazy var tableView: UITableView = {
        return UITableView.init(frame: .zero, style: .insetGrouped)
    }()
    
    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        let s:  CombineDataSources.Section<Person>?
//        let data = PassthroughSubject<[Person], Never>()
//        
//        data
//            
//            
//        .bind(subscriber: tableView.rowsSubscriber(cellIdentifier: "Cell", cellType: UITableViewCell.self, cellConfig: { cell, indexPath, model in
//            cell.textLabel?.text = model.name
//        }))
//        .store(in: &subscriptions)
//                data.send(self.people)
    }
}
