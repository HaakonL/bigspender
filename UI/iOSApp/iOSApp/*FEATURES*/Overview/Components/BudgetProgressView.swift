//
//  BudgetProgressView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 23/03/2023.
//

import SwiftUI

struct BudgetProgressView: View {
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 8)
				.foregroundColor(.mediumBlue)
				.shadow(color: .dropShadow, radius: 4, x: 0, y: 4)
			
			HStack(spacing: 20) {
				VStack(alignment: .leading, spacing: 0) {
					
					Text("March 2023")
						.font(AppFont.body)
						.foregroundColor(.lightBlue)
					
					Text("Budget 15 000 NOK")
						.font(AppFont.caption)
						.foregroundColor(.white)
				}
				
				VStack {
					ZStack {
						RoundedRectangle(cornerRadius: 10)
							.foregroundColor(.slayBlue)
						
						let gradient = LinearGradient(gradient: Gradient(colors: [.green, .regularOrange, .red]), startPoint: .leading, endPoint: .trailing)
						
						RoundedRectangle(cornerRadius: 10)
							.background(gradient)
							.padding(10)
					}
				}
				
				Button {
					
				} label: {
					Image(systemName: "pencil")
				}
				.buttonStyle(.borderedProminent)
				.tint(.regularBlue)
				
			}
			.padding(.horizontal, 10)
			.padding(.vertical, 10)
		}
	}
}

struct BudgetProgressPreview: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			
			VStack{
				BudgetProgressView()
					.frame(height: 50)
				Spacer()
			}
			
			
			.padding(20)
		}
	}
}
