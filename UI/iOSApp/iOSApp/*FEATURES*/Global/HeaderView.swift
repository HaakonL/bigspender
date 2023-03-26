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
		ZStack {
			Color.appPrimary.ignoresSafeArea()
			VStack(spacing: 10) {
				HStack(spacing: 0) {
					Button(action: {
						showSettingsView = true
					}, label: {
						Image("gear")
					})
					.padding(.top, -2)
					
					Spacer()
					
					// CONTENT
					
					Spacer()
					
					Button(action: {
						showMenuView = true
					}, label: {
						Image("menu")
					})
					.padding(.top, -2)
				}
				.padding(.horizontal, 20)
				
				Divider()
					.frame(height: 1)
					.background(.secondary)
			}
			.fullScreenCover(isPresented: $showSettingsView) {
				SettingsView()
			}
			.fullScreenCover(isPresented: $showMenuView) {
				MenuView()
			}
		}
		.frame(height: 30)
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
