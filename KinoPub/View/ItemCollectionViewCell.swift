//
//  ItemCollectionViewCell.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 05/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import DTModelStorage

public final class ItemCollectionViewCell: UICollectionViewCell, ModelTransfer {
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var shadowView: UIView = {

        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(shadowView)
        shadowView.addSubview(containerView)
        containerView.addSubview(imageView)
        contentView.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        textLabel.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 8).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
//
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
//
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 0).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true

    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }

    public required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func prepareForReuse() {
        super.prepareForReuse()
        imageView.kf.cancelDownloadTask()
    }
    
    public func update(with model: Bookmark.Item) {
        textLabel.text = model.title.components(separatedBy: " / ").first
        imageView.kf.setImage(with: URL(string: model.posters.big))
    }
    
    public override var isHighlighted: Bool {
        didSet {
            print("isHighlighted")
            UIView.animate(
                withDuration: 0.2,
                delay: 0,
                options: .curveEaseOut,
                animations: {
                    self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.96, y: 0.96) : .identity
                },
                completion: nil
            )
        }
    }
}
