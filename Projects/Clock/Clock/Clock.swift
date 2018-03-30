//
//  Clock.swift
//  Clock
//
//  Created by Andrey Filyakov on 30/11/2017.
//  Copyright © 2017 Harman. All rights reserved.
//

import UIKit
import CoreGraphics

@IBDesignable
class Clock: UIView {
    
    var time = Date()
    @IBInspectable
    var secondColor: UIColor = UIColor.blue
    @IBInspectable
    var clockColor: UIColor = UIColor.white
    var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tap)
        
        setup()
    }
    
    @objc func didTap() {
        if timer.isValid {
            stop()
        } else {
            setup()
        }
    }
    
    func setup() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer: Timer) in
            self.time = Date()
            self.setNeedsDisplay()
        }
    }
    
    func stop() {
        timer.invalidate()
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let radius = min(rect.width / 2, rect.height / 2)
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        context?.setFillColor(clockColor.cgColor)
        context?.addArc(center: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        context?.fillPath()
        
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(4.0)
        for alpha in stride(from: 0.0, to: 360.0, by: 6.0) {
            var lenght = CGFloat(10.0)
            if alpha.truncatingRemainder(dividingBy: 30) == 0 {
                lenght = CGFloat(20.0)
            }
            
            let fromX = radius * CGFloat(sin(alpha.toRadian())) + center.x
            let fromY = radius * CGFloat(cos(alpha.toRadian())) + center.y
            let toX = (radius - lenght) * CGFloat(sin(alpha.toRadian())) + center.x
            let toY = (radius - lenght) * CGFloat(cos(alpha.toRadian())) + center.y
            context?.move(to: CGPoint(x: fromX, y: fromY))
            context?.addLine(to: CGPoint(x: toX, y: toY))
        }
        context?.strokePath()
        
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.addArc(center: center, radius: radius - 1, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        context?.strokePath()
        
        context?.setFillColor(UIColor.red.cgColor)
        context?.addArc(center: center, radius: 6, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        context?.fillPath()
        
        let second = Calendar.current.component(.second, from: time)
        let secondAngle = -Double(second) * 6.0 - 180.0
        let minute = Calendar.current.component(.minute, from: time)
        let minuteAngle = -Double(minute) * 6.0 - 180.0 + (secondAngle + 180.0) / 60.0
        let hour = Calendar.current.component(.hour, from: time)
        let hourAngle = -Double(hour) * 30.0 - 180.0 + (minuteAngle + 180.0) / 12.0
        
        let hourX = (radius - 50) * CGFloat(sin(hourAngle.toRadian())) + center.x
        let hourY = (radius - 50) * CGFloat(cos(hourAngle.toRadian())) + center.y
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setLineWidth(6.0)
        context?.move(to: center)
        context?.addLine(to: CGPoint(x: hourX, y: hourY))
        context?.strokePath()
        
        let minuteX = (radius - 10) * CGFloat(sin(minuteAngle.toRadian())) + center.x
        let minuteY = (radius - 10) * CGFloat(cos(minuteAngle.toRadian())) + center.y
        context?.setLineWidth(2.0)
        context?.move(to: center)
        context?.addLine(to: CGPoint(x: minuteX, y: minuteY))
        context?.strokePath()
        
        let secondX = (radius - 10) * CGFloat(sin(secondAngle.toRadian())) + center.x
        let secondY = (radius - 10) * CGFloat(cos(secondAngle.toRadian())) + center.y
        context?.setStrokeColor(secondColor.cgColor)
        context?.setLineWidth(2.0)
        context?.move(to: center)
        context?.addLine(to: CGPoint(x: secondX, y: secondY))
        context?.strokePath()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        center = (touch?.location(in: self.superview))!
    }

}
