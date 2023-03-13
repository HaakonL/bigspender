//
//  TagChartView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Charts

struct TagChartView: View {
	var chartData: [ChartData]
	
    var body: some View {
		Group {
			Text("Spendings this period by tag")
				.font(AppFont.body)
				.foregroundColor(.lightBlue)
				.padding(.bottom, 20)
				.offset(x: -3)
			
			Chart(chartData, id: \.day) { item in
				BarMark(
					x: .value("Tag", item.tag),
					y: .value("Spent", item.spendings)
				)
				.annotation(position: .overlay) {
					Text(item.tag)
						.font(AppFont.miniText)
						.foregroundColor(.white)
				}
				.foregroundStyle(by: .value("Tag", item.tag))
				//.foregroundStyle(.regularOrange)
			}
			.chartXAxis(.hidden)
			.chartYAxis {
				AxisMarks(position: .leading) { _ in
					AxisGridLine(stroke: StrokeStyle(dash: [3]))
						.foregroundStyle(.regularBlue)
					
					AxisValueLabel(centered: false)
						.foregroundStyle(.white)
						.offset(x: -3)
				}
			}
			.chartLegend(.hidden)
			.chartYScale(domain: 0...3550)
		}
    }
}
