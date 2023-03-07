//
//  AddPurchaseButton.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct AddPurchaseButton: View {
	@Binding var showAddPurchase: Bool
	
	var body: some View {
		Button {
			showAddPurchase = true
		} label: {
			ZStack {
				Circle()
					.frame(height: 50)
					.foregroundColor(.regularOrange)
					.shadow(color: .dropShadow, radius: 4, x: 0, y: 4)
				
				Rectangle()
					.frame(width: 20, height: 6)
					.foregroundColor(.white)
				
				Rectangle()
					.frame(width: 6, height: 20)
					.foregroundColor(.white)
			}
		}
	}
}


struct AddPurchaseButton_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			AddPurchaseButton(showAddPurchase: .constant(false))
		}
    }
}
