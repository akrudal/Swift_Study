//
//  TriangleView.swift
//  Moyeorun
//
//  Created by 마경미 on 2022/03/29.
//

import UIKit

class TipView: UIView {
    
    var myColor = UIColor.white
    var isBorder = false
    var borderColor = UIColor.white
    
    func setColor(color:UIColor) {
        myColor = color
    }
    
    func setBorder(color:UIColor) {
        isBorder = true
        borderColor = color
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.white.setFill()
        path.fill()
        path.close()

        let triangle = UIBezierPath()
        let y = rect.height - sqrt(pow(rect.width, 2) - pow(rect.width/2, 2))
        triangle.move(to: CGPoint(x: 0, y: rect.height))
        
        triangle.addLine(to: CGPoint(x: rect.width, y: rect.height))
        triangle.addLine(to: CGPoint(x: rect.width/2, y: y))
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        
        myColor.set()
        triangle.fill()
        triangle.close()
        
        if isBorder {
            let border = UIBezierPath()
            border.move(to: CGPoint(x: 0, y: rect.height))
            border.addLine(to: CGPoint(x: rect.width/2, y: y))
            border.addLine(to: CGPoint(x: rect.width, y: rect.height))
            borderColor.set()
            border.stroke()
            border.close()
        }
    }
}
