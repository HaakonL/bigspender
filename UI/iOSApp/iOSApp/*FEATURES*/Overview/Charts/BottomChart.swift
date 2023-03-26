//
//  BottomSheetChart.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 24/03/2023.
//

import SwiftUI
import Core
import Resolver
import Charts

struct BottomChart: View {
	@ObservedObject private var globalViewModel: GlobalViewModel = Resolver.resolve()
	@ObservedObject private var overviewViewModel: OverviewViewModel = Resolver.resolve()
	@State private var minimized: Bool = false
	
    var body: some View {
		ZStack {
			VStack{
				Rectangle()
					.cornerRadius(20, corners: UIRectCorner.topLeft)
					.cornerRadius(20, corners: UIRectCorner.topRight)
					.foregroundColor(.blueThemeBlue)
					.opacity(0.85)
					.shadow(color: .dropShadow, radius: 4, x: 0, y: -4)
			}
			.ignoresSafeArea()
			
			VStack(spacing: 0) {
				HStack(alignment: .top) {
					VStack(alignment: .leading, spacing: 0) {
						Text("Forecast")
							.font(AppFont.mediumTitleBold)
							.foregroundColor(.blueThemeLight)
						
						Group {
							Text("+2 500 NOK") +
							Text(" by month end").foregroundColor(.blueThemeDark)
								
						}
						.foregroundColor(.blueThemeLight)
						.font(AppFont.smallTitle)
					}
					
					Spacer()
					
					Button {
						withAnimation {
							minimized.toggle()
						}
					} label: {
						Image(systemName: "chevron.down.circle")
							.font(AppFont.mediumTitleBold)
							.foregroundColor(.blueThemeDark)
							.rotationEffect(Angle.degrees(minimized ? 180 : 0))
							.padding(.trailing, 10)
							.padding(.top, 0)
					}
				}
				.padding(.leading, 20)
				.padding(.top, 10)
				
				Spacer()
			
				
				if let budget = overviewViewModel.getProjectedResult(budget: 7500, data: overviewViewModel.marchData) {
					ZStack {
						Group {
							/*Chart(budget.days, id: \.day) { item in
								LineMark(
									x: .value("Day", item.day, unit: .day),
									y: .value("Spent", item.spendings)
								)
								.lineStyle(.init(lineWidth: 3, lineCap: CGLineCap.round, lineJoin: CGLineJoin.round))
								.symbol {
									Circle()
										.fill(.appPrimary)
										.frame(width: budget.days.last == item ? 20 : 0)
								}
								.opacity(minimized ? 0 : 1)
								
								/*if budget.days.last == item {
									PointMark(
										x: .value("Index", item.day),
										y: .value("Value", item.spendings)
									)
									.annotation(position: .top,
												alignment: .bottomTrailing,
												spacing: 10) {
										
										Text("-\(item.spendings)")
											.font(AppFont.smallTitle)
											.foregroundColor(.appPrimary)
											.opacity(minimized ? 0 : 1)
									}
								}*/
							}
							.padding(.leading, 5)
							.padding(.trailing, 10)
							.offset(y: 35)*/
							
							Chart(budget.days, id: \.day) { item in
								AreaMark(x: .value("Day", item.day),
										 y: .value("Spent", item.spendings)
								)
							}
							.foregroundColor(.blueThemeDark)
							.padding(.horizontal, 20)
							//.offset(y: 55)
						}
						//.frame(height: minimized ? 0 : 160)
						//.chartYAxis(.hidden)
						//.chartXAxis(.hidden)
					}
				}
			}
		}
		.frame(height: minimized ? 60 : 200)
		.foregroundColor(.appPrimary)
    }
}
