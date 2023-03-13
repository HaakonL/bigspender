//
//  DailyChartView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Charts

struct DailyChartView: View {
	var chartData: [ChartData]
	
    var body: some View {
		Group {
			Text("Spendings this period per day")
				.font(AppFont.body)
				.foregroundColor(.lightBlue)
				.padding(.bottom, 20)
				.offset(x: -3)
			
			Chart(chartData, id: \.day) { item in
				BarMark(
					x: .value("Day", item.day, unit: .day),
					y: .value("Spent", item.spendings)
				)
				.foregroundStyle(item.spendings > item.dailyBudget ? .red : .green)
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
			.chartYScale(domain: 0...2102)
		}
    }
}
