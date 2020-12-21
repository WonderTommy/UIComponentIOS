//
//  PaddingLabel.swift
//  MiniWidgets
//
//  Created by Hao Li on 2020-12-21.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import Foundation
import UIKit

struct PaddingInfo {
    var top: CGFloat
    var bottom: CGFloat
    var left: CGFloat
    var right: CGFloat
}

class PaddingLabel: UILabel {
    private var topInset: CGFloat
    private var bottomInset: CGFloat
    private var leftInset: CGFloat
    private var rightInset: CGFloat
    
    init(padding: PaddingInfo) {
        topInset = padding.top
        bottomInset = padding.bottom
        leftInset = padding.left
        rightInset = padding.right
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize:CGSize {
        numberOfLines = 0
        var size = super.intrinsicContentSize
        size.height = size.height + topInset + bottomInset
        size.width = size.width + leftInset + rightInset
        return size
    }

    override func drawText(in rect:CGRect) {
        let edgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        let rectangle = rect.inset(by: edgeInsets)
        super.drawText(in: rectangle)
    }

    override func textRect(forBounds bounds:CGRect,
                               limitedToNumberOfLines n:Int) -> CGRect {
        let edgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        let b = bounds
        let textRect = b.inset(by: edgeInsets)
        let centerTextRect = super.textRect(forBounds: textRect, limitedToNumberOfLines: 0)
        
        return centerTextRect
    }
}
