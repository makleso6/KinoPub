//
//  DownloadButton.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 09/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit
import AHDownloadButton

public protocol DownloadButtonDelegate: AnyObject {
    func downloadButton(_ downloadButton: DownloadButton, tappedWithState state: DownloadButton.State)
}

public final class DownloadButton: UIView {
    
    public enum State {
        case startDownload
        case pending
        case downloading
        case downloaded
    }
    
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var progress: CGFloat = 0 {
        didSet {
            downloadButton.progress = progress
        }
    }
    
    private lazy var downloadButton: AHDownloadButton = {
        
        let downloadButton = AHDownloadButton(alignment: .center)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.frame = CGRect(origin: .zero, size: .init(width: 44, height: 44))
        downloadButton.delegate = self
        downloadButton.startDownloadButtonTitle = nil
        downloadButton.startDownloadButtonImage = UIImage(named: "ic_cloud")
        downloadButton.startDownloadButtonNonhighlightedBackgroundColor = .clear
        downloadButton.startDownloadButtonHighlightedBackgroundColor = .clear
        downloadButton.pendingCircleLineWidth = 2
        downloadButton.downloadingButtonCircleLineWidth = 2
        downloadButton.downloadedButtonTitle = nil
        downloadButton.downloadedButtonTitleSidePadding = 2
        return downloadButton
    }()
    
    public var state: State = .startDownload {
        didSet {
            switch state {
            case .startDownload:
                downloadButton.state = .startDownload
            case .pending:
                downloadButton.state = .pending
            case .downloading:
                downloadButton.state = .downloading
            case .downloaded:
                downloadButton.state = .downloaded
            }
        }
    }
    
    public weak var delegate: DownloadButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.addSubview(downloadButton)
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        downloadButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        downloadButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        downloadButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        downloadButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    }
    
    public required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

extension DownloadButton: AHDownloadButtonDelegate {
    public func downloadButton(_ downloadButton: AHDownloadButton, tappedWithState state: AHDownloadButton.State) {
        switch state {
        case .startDownload:
            delegate?.downloadButton(self, tappedWithState: .startDownload)
        case .pending:
            delegate?.downloadButton(self, tappedWithState: .pending)
        case .downloading:
            delegate?.downloadButton(self, tappedWithState: .downloading)
        case .downloaded:
            delegate?.downloadButton(self, tappedWithState: .downloaded)
        }
    }
    
}
