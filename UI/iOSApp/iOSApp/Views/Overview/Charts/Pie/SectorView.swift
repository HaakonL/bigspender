//
//  SectorView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct SectorView: View {
	var startAngle: Angle
	var endAngle: Angle
	var value: Double
	var label: String
	var color: Color
	var labelOffset: Double
	var labelFont: Font
	
	var labelPoint: CGPoint {
		let midAngleRad = startAngle.radians + (endAngle.radians - startAngle.radians)/2.0
		return CGPoint(x: labelOffset * cos(midAngleRad),
					   y: labelOffset * sin(midAngleRad))
	}
	
	var body: some View {
		VStack {
			SectorShape(
				startAngle: startAngle,
				endAngle: endAngle
			)
			.fill(color)
			.overlay(
				Text("\(label)\n\(value, specifier: "%.1f")")
					.font(labelFont)
					.padding(4)
					.foregroundColor(.white)
					.background(Color(.black).opacity(0.3))
					.cornerRadius(5)
					.offset(x: labelPoint.x, y: labelPoint.y)
					.multilineTextAlignment(.center)
			)
		}
	}
}

struct SectorView_Previews: PreviewProvider {
    static var previews: some View {
		SectorView(
			startAngle: Angle(degrees: 40),
			endAngle: Angle(degrees: 100),
			value: 100,
			label: "Label",
			color: .red,
			labelOffset: 10,
			labelFont: .body)
    }
}
