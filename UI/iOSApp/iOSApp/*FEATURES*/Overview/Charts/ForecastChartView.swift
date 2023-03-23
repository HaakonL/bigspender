//
//  ForecastChartView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Charts
import Resolver

struct ForecastChartView: View {
	@ObservedObject private var globalViewModel: GlobalViewModel = Resolver.resolve()
	
	var budget: Budget
	
    var body: some View {
		Group {
			Text("\(globalViewModel.monthAndYear.capitalized) forecast")
				.font(AppFont.body)
				.foregroundColor(.lightBlue)
				.padding(.bottom, 20)
				.offset(x: -3)
			
			Chart(budget.days, id: \.day) { item in
				LineMark(
					x: .value("Day", item.day, unit: .day),
					y: .value("Budget", item.budgeted),
					series: .value("Budget", "B")
				)
				.foregroundStyle(.regularOrange)
				.opacity(0.5)
				.lineStyle(StrokeStyle(lineWidth: 1, lineCap: .round, dash: [5,5]))
				
				LineMark(
					x: .value("Day", item.day, unit: .day),
					y: .value("Spent", item.spendings),
					series: .value("Spent", "S")
				)
				.foregroundStyle(.regularOrange)
				
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
		}
    }
}
