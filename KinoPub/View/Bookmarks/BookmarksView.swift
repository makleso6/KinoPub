//
//  BookmarksView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public struct BookmarksView: View {
    @ObservedObject var viewModel: BookmarksViewModel
    public var body: some View {
        
        VStack(spacing: 20) {
            ItemRowView(item: .init(id: 22, title: "", views: 0, count: "", created: 0, updated: 0)) {
            }.frame(minHeight: 44, maxHeight: 44)
            ItemRowView(item: .init(id: 22, title: "", views: 0, count: "", created: 0, updated: 0)) {
            }.frame(minHeight: 44, maxHeight: 44)
        }
        
        //        ItemRowView(item: .init(id: 22, title: "", views: 0, count: "", created: 0, updated: 0)) {
        //        }
        //        List(viewModel.models) { item  in
        //            ItemRowView(item: item) {
        //                self.viewModel.didSelect(item: item)
        //                print(item)
        //            }
        //
        //        }
        //        .listStyle(GroupedListStyle())
        
    }
}
