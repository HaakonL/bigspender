//
//  SpendingView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 12/02/2023.
//

import SwiftUI
import Resolver
import Charts
import Core

struct OverviewView: View {
	@ObservedObject private var viewModel: OverviewViewModel = Resolver.resolve()
	@State private var showAddPurchase = false
	let mainChartHeight: CGFloat = 180
	
    var body: some View {
		ZStack {
			VStack(spacing: 0) {
				ScrollView(.vertical, showsIndicators: false) {
					
					Spacer().frame(height: 15)
					
					MainChartView(overviewViewModel: viewModel, mainChartHeight: mainChartHeight)
					
					TextualStatusView(averageSpent: 275, averageToSpend: 613)
						.padding(.top, 10)
					
					InfoBoxesView()
						.padding(.top, 10)
					
					TagsView()
						.padding(.top, 10)
					
					Spacer()
				}
				
				AddPurchaseButton(showAddPurchase: $showAddPurchase)
					.padding(.top, 10)
			}
			.padding(.horizontal)
		}
		.task {
			await viewModel.loadPeriod()
		}
	}
}

struct SpendingView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			OverviewView()
		}
    }
}
