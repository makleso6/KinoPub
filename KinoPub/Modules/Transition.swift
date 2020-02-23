//
//  Transition.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 07/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit

public typealias ModuleTransitionBlock = (UIViewController, UIViewController) -> Void

public struct ModulePromise<Base> {
    public let base: Base
    public let viewController: UIViewController
    public init(base: Base,
                viewController: UIViewController) {
        self.base = base
        self.viewController = viewController
    }

    @discardableResult
    public func perform(moduleInput: (Base) throws -> Void) rethrows -> UIViewController {
        try moduleInput(base)
        return viewController
    }
}

public protocol Presenter: AnyObject {
    associatedtype ViewType
    var view: ViewType? { get }
}

public protocol TransitionView: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType { get }
}

public protocol TransitionFactory {
    associatedtype ViewType: TransitionView
    associatedtype ModuleInputType
    func instantiateModuleTransitionHandler() -> ViewType
}

public enum TransitionError: Error {
    case emptySource
    case emptyDestination
    case emptyPresenter
}

public struct Transition {
    public private(set) weak var source: UIViewController?
    public init(source: UIViewController?) {
        self.source = source
    }

    @discardableResult
    public func openModule<Factory, PresenterType>(using factory: Factory, with transitionBlock: ModuleTransitionBlock) throws -> ModulePromise<PresenterType>
        where Factory: TransitionFactory,
        PresenterType == Factory.ModuleInputType {
            let destination = factory.instantiateModuleTransitionHandler()
            guard let vc1 = source else { throw TransitionError.emptySource }
            guard let vc2 = destination as? UIViewController else { throw TransitionError.emptyDestination }
            transitionBlock(vc1, vc2)
            guard let presenter = destination.presenter as? PresenterType else { throw TransitionError.emptyPresenter }
            let module = ModulePromise(base: presenter, viewController: vc2)
            return module
    }
}
