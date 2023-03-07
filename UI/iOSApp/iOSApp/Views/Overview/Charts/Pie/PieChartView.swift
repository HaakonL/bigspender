//
//  PieChartView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct PieChartView: View {
	var sizes: [Double]
	var labelOffset: Double
	var labelSize: Double = 20.0
	var labelFont: Font
	
	let angleOffset = 90.0
	let colors = [
		Color(red: 126/255, green: 40/255, blue: 80/255),
		Color(red: 49/255, green: 63/255, blue: 95/255),
		Color(red: 37/255, green: 166/255, blue: 188/255),
		Color(red: 130/255, green: 122/255, blue: 162/255),
		Color(red: 241/255, green: 165/255, blue: 138/255)]
	
	var body: some View {
		let total = sizes.reduce(0, +)
		let sortedSizes = sizes.sorted(by: >)
		let angles = sizes.sorted(by: >).map { $0 * 360.0 / total }
		var sum = 0.0
		let runningAngles = angles.map { (sum += $0, sum).1 }
		
		ZStack {
			ForEach(0..<runningAngles.count) { i in
				let startAngle = i==0 ? 0.0 : runningAngles[i-1]
				SectorView(
					startAngle: Angle(degrees: startAngle - angleOffset),
					endAngle: Angle(degrees: runningAngles[i] - angleOffset),
					value: sortedSizes[i],
					label: "Label",
					color: colors[i % colors.count],
					labelOffset: labelOffset,
					labelFont: labelFont)
			}
		}
	}
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
		PieChartView(sizes: [30, 15, 9],
					 labelOffset: 70, labelFont: .body)
			.frame(width: 300, height: 300)
			.padding(30)
    }
}
