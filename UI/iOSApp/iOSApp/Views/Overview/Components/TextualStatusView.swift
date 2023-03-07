//
//  TextualStatusView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct TextualStatusView: View {
	var averageSpent: Int
	var averageToSpend: Int
	
    var body: some View {
		Text("You have spent \(averageSpent),- per day so far. Going forward, you can spend up to \(averageToSpend),- per day.")
			.fontWithLineHeight(font: AppFont.bodyUIFont, lineHeight: 22)
			.foregroundColor(.white)
    }
}

struct TextualStatusView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			TextualStatusView(averageSpent: 100, averageToSpend: 200)
		}
    }
}
