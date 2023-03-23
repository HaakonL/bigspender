//
//  DailyChartView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Charts
import Resolver

struct DailyChartView: View {
	@ObservedObject private var globalViewModel: GlobalViewModel = Resolver.resolve()
	var budget: Budget
	
    var body: some View {
		Group {
			Text("\(globalViewModel.monthAndYear.capitalized) per day")
				.font(AppFont.body)
				.foregroundColor(.lightBlue)
				.padding(.bottom, 20)
				.offset(x: -3)
			
			Chart(budget.days, id: \.day) { item in
				BarMark(
					x: .value("Day", item.day, unit: .day),
					y: .value("Spent", item.spendings)
				)
				.foregroundStyle(item.spendings > budget.dailyBudget ? .red : .green)
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
