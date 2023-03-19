//
//  PeriodNavigator.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 06/03/2023.
//

import SwiftUI

struct PeriodNavigator: View {
    var body: some View {
		HStack {
			HStack {
				Button(action: {
					//matchesViewModel.changeWeek(delta: -1)
				}, label: {
					Image("left")
				})
			}
			
			Spacer()
			
			Button(action: {
				//matchesViewModel.changeWeek(delta: 0)
			}, label: {
				Text("March")
					.font(AppFont.body)
					.foregroundColor(.regularOrange)
					.padding(.bottom, -5)
			})
			
			Spacer()
			
			HStack {
				Button(action: {
					//matchesViewModel.changeWeek(delta: 1)
				}, label: {
					Image("right")
				})
			}
		}
    }
}

struct PeriodNavigator_Previews: PreviewProvider {
    static var previews: some View {
        PeriodNavigator()
    }
}
