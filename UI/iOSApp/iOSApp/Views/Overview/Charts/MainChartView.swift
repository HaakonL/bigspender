//
//  MainChartView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Resolver
import Charts

enum MainChartState {
	case forecast, daily, tags
}

struct MainChartView: View {
	@StateObject var overviewViewModel: OverviewViewModel
	@State var currentChart: MainChartState = .forecast
	let mainChartHeight: CGFloat = 180
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 8)
				.foregroundColor(.mediumBlue)
				.shadow(color: .dropShadow, radius: 4, x: 0, y: 4)
			
			HStack(spacing: 0) {
				VStack(alignment: .leading, spacing: 0) {
					
					if currentChart == .forecast {
						let data = overviewViewModel.getProjectedResult(budget: 7500, data: overviewViewModel.marchData)
						ForecastChartView(chartData: data)
					}
					
					if currentChart == .daily {
						let data = overviewViewModel.februaryData
						DailyChartView(chartData: data)
					}
					
					if currentChart == .tags {
						let data = overviewViewModel.categoryData
						TagChartView(chartData: data)
					}
				}
				.padding([.leading, .bottom], 15)
				.padding(.trailing, 8)
				.padding(.top, 10)
				
				Spacer()
				
				MainChartButtons(currentChart: $currentChart, mainChartHeight: mainChartHeight)
			}
		}
		.frame(height: mainChartHeight)
    }
}

struct MainChartButtons: View {
	@Binding var currentChart: MainChartState
	var mainChartHeight: CGFloat
	
	var body: some View {
		HStack(spacing:0) {
			Divider()
				.frame(height: mainChartHeight)
				.background(.lightBlue)
			
			ZStack {
				VStack(alignment: .leading, spacing:0) {
					Button {
						currentChart = .forecast
					} label: {
						Image(systemName: "chart.xyaxis.line")
							.font(AppFont.smallTitle)
							.foregroundColor(currentChart == .forecast ? .regularOrange : .lightBlue)
						
					}
					.buttonStyle(.plain)
					.frame(height: mainChartHeight/3)
					
					Button {
						currentChart = .daily
					} label: {
						Image(systemName: "chart.bar.xaxis")
							.font(AppFont.smallTitle)
							.foregroundColor(currentChart == .daily ? .regularOrange : .lightBlue)
						
					}
					.buttonStyle(.plain)
					.frame(height: mainChartHeight/3)
					
					Button {
						currentChart = .tags
					} label: {
						Image(systemName: "number")
							.font(AppFont.smallTitle)
							.foregroundColor(currentChart == .tags ? .regularOrange : .lightBlue)
						
					}
					.buttonStyle(.plain)
					.frame(height: mainChartHeight/3)
				}
				.padding(0)
				.padding(.horizontal, 10)
				
				// Horizontal lines to separate the buttons
				VStack {
					Spacer()
					Divider().background(.lightBlue)
					Spacer()
					Divider().background(.lightBlue)
					Spacer()
				}
			}
		}
		.fixedSize()
	}
}
