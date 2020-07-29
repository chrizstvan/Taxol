//
//  LocationCell.swift
//  Taxol
//
//  Created by Chris Stev on 27/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    
    ///data
    var placemark: SearchLocationModel.ViewModel? {
        didSet {
            guard let placemark = placemark else { return }
            title.text = placemark.title
            subtitle.text = placemark.subtitle
        }
    }
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "123 Main Street"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "123 Main String, Washington, DC"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        selectionStyle = .none
        let stack = UIStackView(arrangedSubviews: [title, subtitle])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerYTo(view: self, leftAnchor:  leftAnchor, leftPadding: 12)
    }
}
