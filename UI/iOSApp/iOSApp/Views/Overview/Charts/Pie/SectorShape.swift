//
//  SectorShape.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct SectorShape: Shape {
	var startAngle: Angle
	var endAngle: Angle
	
	func path(in rect: CGRect) -> Path {
		// centre of the containing rect
		let c = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
		// radius of a circle that will fit in the rect
		let r = Double(min(rect.width,rect.height)) * 0.9 / 2.0
		var path = Path()
		path.move(to: c)
		path.addArc(center: c,
					radius: CGFloat(r),
					startAngle: startAngle,
					endAngle: endAngle,
					clockwise: false
		)
		path.closeSubpath()
		return path
	}
}
