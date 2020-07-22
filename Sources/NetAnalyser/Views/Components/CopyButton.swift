//
//  CopyButton.swift
//  
//
//  Created by Gabriel Minucci on 21/07/20.
//

import UIKit

class CopyButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let rectHeight = 0.75 * rect.height
        let rectWidth = 0.6 * rect.width
        let lineWidth: CGFloat = rect.height * 0.07

        // Bottom left rectangle
        let bottomLeftRect = UIBezierPath(rect: CGRect(x: rect.minX + lineWidth/2, y: rect.height - rectHeight - lineWidth/2, width: rectWidth, height: rectHeight))
        tintColor.setStroke()
        bottomLeftRect.lineWidth = lineWidth
        bottomLeftRect.lineJoinStyle = .round
        bottomLeftRect.stroke()

        // Upper right rectangle
        let upperRightRectPath = UIBezierPath()
        upperRightRectPath.move(to: CGPoint(x: (rect.width - rectWidth - lineWidth), y: (rect.height - rectHeight - lineWidth)))
        upperRightRectPath.addLine(to: CGPoint(x: (rect.width - rectWidth - lineWidth), y: (rect.minY + lineWidth/2)))
        upperRightRectPath.addLine(to: CGPoint(x: (rect.maxX - lineWidth/2), y: (rect.minY + lineWidth/2)))
        upperRightRectPath.addLine(to: CGPoint(x: (rect.maxX - lineWidth/2), y: (rect.minY + lineWidth/2 + rectHeight)))
        upperRightRectPath.addLine(to: CGPoint(x: (rectWidth + 2*lineWidth), y: (rect.minY + lineWidth/2 + rectHeight)))
        tintColor.setStroke()
        upperRightRectPath.lineWidth = lineWidth
        upperRightRectPath.lineJoinStyle = .round
        upperRightRectPath.stroke()
    }
}
