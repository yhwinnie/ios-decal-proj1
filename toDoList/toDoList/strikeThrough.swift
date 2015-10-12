//
//  strikeThrough.swift
//  toDoList
//
//  Created by Winnie Wen on 10/12/15.
//  Copyright © 2015 Winnie Wen. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

// A UILabel subclass that can optionally have a strikethrough.
class StrikeThrough: UILabel {
    let strikeThroughLayer: CALayer
    // A Boolean value that determines whether the label should have a strikethrough.
    var strikeThrough : Bool {
        didSet {
            strikeThroughLayer.hidden = !strikeThrough
            if strikeThrough {
                resizeStrikeThrough()
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(frame: CGRect) {
        strikeThroughLayer = CALayer()
        strikeThroughLayer.backgroundColor = UIColor.whiteColor().CGColor
        strikeThroughLayer.hidden = true
        strikeThrough = false
        
        super.init(frame: frame)
        layer.addSublayer(strikeThroughLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resizeStrikeThrough()
    }
    
    let kStrikeOutThickness: CGFloat = 2.0
    func resizeStrikeThrough() {
        let textSize = text!.sizeWithAttributes([NSFontAttributeName:font])
        strikeThroughLayer.frame = CGRect(x: 0, y: bounds.size.height/2,
            width: textSize.width, height: kStrikeOutThickness)
    }
}