//
//  BookmarkPresenter.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 07/03/2020.
//  Copyright (c) 2020 Maksim Kolesnik. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import Combine

public final class BookmarkPresenter {

    // MARK: - Private

    internal weak var view: BookmarkPresenterOutput?
    private let interactor: BookmarkInteractorInput
    private let router: BookmarkRouterInput
    @Published private var page = 1
    private var model: Bookmark?
    
    // MARK: - Initialization

    public init(interactor: BookmarkInteractorInput,
                router: BookmarkRouterInput) {
        self.interactor = interactor
        self.router = router
    }

}

// MARK: - BookmarkViewOutput

extension BookmarkPresenter: BookmarkViewOutput {
    public var title: String? {
        model?.title
    }
    
    public func didSelect(model: Bookmark.Item) {
        router.didSelect(model: model)
    }

    public func didTriggerViewReadyEvent() {
        view?.setupInitialState()
    }

    public func requestBookmark() -> AnyPublisher<[Bookmark.Item], Never> {
        return $page
            .flatMap({ [weak self] (page) -> AnyPublisher<[Bookmark.Item], Never> in
                guard let self = self else { return Empty().eraseToAnyPublisher() }
                return self.requestBookmark(by: page)
            })
            .eraseToAnyPublisher()
    }
    
    private func requestBookmark(by page: Int) -> AnyPublisher<[Bookmark.Item], Never> {
        guard let model = self.model else { return Empty().eraseToAnyPublisher() }
        return interactor
            .requestBookmark(id: model.id, page: page)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { [weak self] _ in
                self?.view?.finishLoading()
            })
            .catch({_ in 
                Empty()
            })
            .eraseToAnyPublisher()
    }
    
    public func requestNextPage() {
        page += 1
    }
    
    public func reloadData() {
        interactor.prepareToReloadData()
        page = 1
    }

}

// MARK: - BookmarkInteractorOutput

extension BookmarkPresenter: BookmarkInteractorOutput {

}

// MARK: - BookmarkRouterOutput

extension BookmarkPresenter: BookmarkRouterOutput {

}

extension BookmarkPresenter: BookmarkPresenterInput {
    public func setupWith(_ model: Bookmark) {
        self.model = model
    }

}
