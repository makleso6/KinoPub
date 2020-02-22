//
//  BookmarksView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import Moya
import Combine

struct ItemRowView: View {
    let item: Bookmark
    var action: () -> Void
    public var body: some View {
        
        Color.gray.overlay(
            Button(action: action) {
                HStack {
                    Text(item.title)
                    Spacer()
                    Text(item.count)
                }
                
            }
        )
        .cornerRadius(16)
    }
}







