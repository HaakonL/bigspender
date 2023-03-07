//
//  InfoBoxesView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct InfoBoxesView: View {
    var body: some View {
		VStack(spacing: 15) {
			let columnInfo = GridItem(.flexible(), spacing: 15, alignment: .center)
			LazyVGrid(columns: Array(repeating: columnInfo, count: 3)) {
				InfoBoxView(title: "Until now", icon: "light.beacon.max", description: "Per day", value: "275,-")
				InfoBoxView(title: "Going forward", icon: "arrowshape.forward", description: "Per day", value: "613,-")
				InfoBoxView(title: "Your goal", icon: "scope", description: "Per day", value: "500,-")
			}
			
			LazyVGrid(columns: Array(repeating: columnInfo, count: 3)) {
				InfoBoxView(title: "Your budget", icon: "sum", description: "Total", value: "15.500,-")
				InfoBoxView(title: "End of period", icon: "dollarsign", description: "Remaining", value: "1.275,-", valueColor: .green)
				
				InfoBoxView(title: "End of period", icon: "dollarsign", description: "Shortage", value: "- 1.275,-", valueColor: .regularOrange)
			}
		}
    }
}

struct InfoBoxView: View {
	var title: String
	var icon: String
	var description: String
	var value: String
	var valueColor: Color = .white
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 8)
				.foregroundColor(.mediumBlue)
				.aspectRatio(contentMode: .fit)
				.shadow(color: .dropShadow, radius: 4, x: 0, y: 4)
			
			VStack(alignment: .leading, spacing: 0) {
				HStack(alignment: .center, spacing: 0) {
					Text(title)
						.font(AppFont.footnote)
						.foregroundColor(.lightBlue)
					
					Spacer()
					
					ZStack {
						RoundedRectangle(cornerRadius: 2)
							.foregroundColor(.regularBlue)
							.aspectRatio(contentMode: .fit)
							.frame(height: 24)
						
						Image(systemName: icon)
							.foregroundColor(.lightBlue)
							.font(AppFont.body)
						
					}
				}
				
				Spacer()
				
				Text(value)
					.font(AppFont.subtitleBold)
					.foregroundColor(valueColor)
					.lineLimit(1)
					.minimumScaleFactor(0.8)
				
				Text(description)
					.font(AppFont.caption)
					.foregroundColor(.lightBlue)
					.padding(.top, 3)
			}
			.padding(10)
		}
	}
}

struct InfoBoxesView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			InfoBoxesView()
				.padding()
		}
    }
}
