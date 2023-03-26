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

struct AddSomethingButton: View {
	var title: String
	var callToAction: (() -> Void)
	
	var body: some View {
		VStack {
			ZStack {
				Circle()
					.foregroundColor(.slayBlue)
				
				Circle()
					.frame(width: 60)
					.foregroundColor(.mediumBlue)
				
				VStack(spacing: 0) {
					Spacer()
					
					HStack(spacing: 0) {
						Spacer()
						
						ZStack {
							Circle()
								.frame(width: 25)
								.foregroundColor(.darkBlue)
							
							Circle()
								.frame(width: 24)
								.foregroundColor(.lightBlue)
							
							Image(systemName: "plus")
								.font(AppFont.footnote)
								.foregroundColor(.darkBlue)
						}
					}
				}
				
			}
			.frame(width: 70)
			
			Text(title)
				.font(AppFont.footnote)
				.foregroundColor(.white)
		}.onTapGesture {
			callToAction()
		}
	}
}
struct OverviewView: View {
	@ObservedObject private var viewModel: OverviewViewModel = Resolver.resolve()
	@State private var showAddPurchase = false
	@State private var showProgress = true
	
	var body: some View {
		ZStack {
			Color.blueThemeBg.ignoresSafeArea()
			
			VStack {
				Spacer()
				Rectangle()
					.fill(.blueThemeBlue)
					.frame(height: 180)
			}
			
			VStack {
				Image("woman")
					.resizable()
					.scaledToFit()
				
				Spacer()
			}
			
			VStack(spacing: 0) {

				HeaderView()
				
				ScrollView(.vertical, showsIndicators: false) {
					
					BudgetProgressView()
						.padding(.horizontal, 20)
						.padding(.top, 15)
					
					/*MainChartView(overviewViewModel: viewModel)
						.padding(.top, 15)
						.padding(.horizontal, 20)*/
					
					HStack(spacing: 0) {
						AddSomethingButton(title: "Purchase") {
							showAddPurchase = true
						}
						
						Spacer()
						
						AddSomethingButton(title: "Tag") {
							
						}
						
						Spacer()
						
						AddSomethingButton(title: "Period") {
							
						}
						
						Spacer()
						
						AddSomethingButton(title: "Budget") {
							
						}
					}
					.padding([.top, .horizontal], 20)
					
					/*
					TextualStatusView(averageSpent: 275, averageToSpend: 613)
						.padding(.top, 10)
						.padding(.horizontal, 20)
					
					InfoBoxesView()
						.padding(.top, 10)
						.padding(.horizontal, 20)*/
					
					Spacer()
				}
				
				BottomChart()
			}
			.task {
				await viewModel.loadPeriod()
			}
			.overlay {
				Rectangle()
					.ignoresSafeArea()
					.foregroundColor(.black)
					.opacity(showAddPurchase ? 0.5 : 0)
					.animation(.easeIn(duration: 0.2), value: showAddPurchase)
			}
			.sheet(isPresented: $showAddPurchase) {
				AddPurchaseView()
			}
		}
	}
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			OverviewView()
		}
    }
}
