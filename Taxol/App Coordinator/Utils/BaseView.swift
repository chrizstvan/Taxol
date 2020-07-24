//
//  BaseView.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           createSubView()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           createSubView()
       }
    
    func createSubView() {}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
