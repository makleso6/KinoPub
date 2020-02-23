//
//  AuthorizationViewController.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import Combine

public final class AuthorizationViewController: UIHostingController<AuthorizationView> {
    private var dispose: Set<AnyCancellable> = .init()

    private let model: AuthorizationViewModel
    public init(model: AuthorizationViewModel) {
        self.model = model

        let view = AuthorizationView(viewModel: model)
        super.init(rootView: view)

        model.callBack
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
//                let viewModel = BookmarksViewModel()
//                let view = BookmarksView(viewModel: viewModel)
//                let newVC = UIHostingController(rootView: view)
//                self?.present(newVC, animated: true, completion: nil)
            })
            .store(in: &dispose)
    }

    @objc public required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
