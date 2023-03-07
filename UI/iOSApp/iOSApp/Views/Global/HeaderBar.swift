//
//  HeaderBar.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 06/03/2023.
//
import SwiftUI

struct HeaderBar: View {
	@State var showSettingsModal = false
	@State var showMenuModal = false
	
	var body: some View {
		VStack(spacing: 10) {
				/*Spacer().fullScreenCover(isPresented: $showSettingsModal){}
			content: {SettingsModal(showSettingsModal: $showSettingsModal)}
				
				Spacer().fullScreenCover(isPresented: $showMenuModal){}
			content: {MenuModal(showMenuModal: $showMenuModal)}
				*/
			HStack(spacing: 0) {
				Button(action: {
					showSettingsModal.toggle()
				}, label: {
					Image("gear")
				})
				.padding(.top, -2)
				
				Spacer()
				
				Text("Big Spender")
					.font(AppFont.titleBold)
					.foregroundColor(.lightBlue)
				
				Spacer()
				
				Button(action: {
					showMenuModal.toggle()
				}, label: {
					Image("menu")
				})
				.padding(.top, -2)
			}
			.padding(.horizontal, 20)
			
			HStack(spacing: 0) {
				
				Spacer()
				
				Button(action: {
					//matchesViewModel.changeWeek(delta: -1)
				}, label: {
					Image("left")
				})
				
				Button(action: {
					//matchesViewModel.changeWeek(delta: 0)
				}, label: {
					Text("September")
						.font(AppFont.body)
						.foregroundColor(.white)
				})
				.frame(width: 130)
				
				Button(action: {
					//matchesViewModel.changeWeek(delta: 1)
				}, label: {
					Image("right")
				})
				
				Spacer()
			}
			
			Divider()
				.frame(height: 1)
				.background(.dullBlue)
				//.padding(.top, 5)
		}
	}
}

struct HeaderBarBar_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			VStack(spacing: 0) {
				HeaderBar()
				Spacer()
			}
		}
	}
}
