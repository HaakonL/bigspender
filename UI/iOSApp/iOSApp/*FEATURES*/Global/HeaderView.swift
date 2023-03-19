//
//  HeaderBar.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 06/03/2023.
//
import SwiftUI
import Resolver

struct HeaderView: View {
	
	@ObservedObject private var globalViewModel: GlobalViewModel = Resolver.resolve()
	@State private var showSettingsView: Bool = false
	@State private var showMenuView: Bool = false
	
	var body: some View {
		VStack(spacing: 10) {
			HStack(spacing: 0) {
				Button(action: {
					showSettingsView = true
				}, label: {
					Image("gear")
				})
				.padding(.top, -2)
				
				Spacer()
				
				FidgetTextView("Big Spender",
							   font: AppFont.appLogoType,
							   fontSize: 28,
							   dist0Color: Color.regularOrange,
							   dist1Color: Color.lightOrange,
							   defaultColor: Color.lightBlue
				)
								
				Spacer()
				
				Button(action: {
					showMenuView = true
				}, label: {
					Image("menu")
				})
				.padding(.top, -2)
			}
			.padding(.horizontal, 20)
			
			HStack(spacing: 0) {
				
				Spacer()
				
				Button(action: {
					globalViewModel.previousPeriod()
				}, label: {
					Image("left")
				})
				
				Button(action: {
					globalViewModel.resetPeriod()
				}, label: {
					Text("\(globalViewModel.monthAndYear.capitalized)")
						.font(AppFont.body)
						.foregroundColor(.white)
				})
				.frame(width: 200)
				
				Button(action: {
					globalViewModel.nextPeriod()
				}, label: {
					Image("right")
				})
				
				Spacer()
			}
			
			Divider()
				.frame(height: 1)
				.background(.dullBlue)
		}
		.fullScreenCover(isPresented: $showSettingsView) {
			SettingsView()
		}
		.fullScreenCover(isPresented: $showMenuView) {
			MenuView()
		}
		
	}
}

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			VStack(spacing: 0) {
				HeaderView()
				Spacer()
			}
		}
	}
}
