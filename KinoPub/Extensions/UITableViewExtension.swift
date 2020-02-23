//
//  UITableViewExtension.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 28/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit
import Combine

extension UITableView {

    public func diffableDataSource<CellType, Section, Items>(tableView: UITableView, identifier: String, cellType: CellType.Type, cellConfig: @escaping (CellType, IndexPath, Items.Element) -> Void)
        -> AnySubscriber<(Section, Items), Never> where
        CellType: UITableViewCell,
        Section: Hashable,
        Items: RandomAccessCollection,
        Items.Element: Hashable {
            let source = UITableViewDiffableDataSource<Section, Items.Element>(tableView: tableView, cellProvider: { (table, indexPath, item) -> UITableViewCell? in
                guard let cell = table.dequeueReusableCell(withIdentifier: identifier,
                                                           for: indexPath) as? CellType else { return nil }
                cellConfig(cell, indexPath, item)
                return cell
            })
            return diffableDataSource(source)
    }

    public func diffableDataSource<Section, Items>(_ source: UITableViewDiffableDataSource<Section, Items.Element>)
        -> AnySubscriber<(Section, Items), Never> where
        Section: Hashable,
        Items: RandomAccessCollection,
        Items.Element: Hashable {
            self.dataSource = source
        return AnySubscriber<(Section, Items), Never>(receiveSubscription: { (subscription) in
                subscription.request(.unlimited)
            }, receiveValue: { (items) -> Subscribers.Demand in
                var snapshot = source.snapshot()
                if !snapshot.sectionIdentifiers.contains(items.0) {
                    snapshot.appendSections([items.0])
                }
                let array = Array(items.1)
                snapshot.appendItems(array)
                source.apply(snapshot)

                return .unlimited
            }, receiveCompletion: { (_) in

            })
    }
}
