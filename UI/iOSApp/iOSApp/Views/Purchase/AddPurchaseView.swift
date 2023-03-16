//
//  AddPurchaseView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Combine
import Resolver
import Core

struct AddPurchaseView: View {
	@Environment(\.dismiss) var dismiss
	
	@ObservedObject private var viewModel: AddPurchaseViewModel = Resolver.resolve()
	@State private var titleText: String = ""
	@State private var purchaseDate: Date = Date().noon()
	@State private var amount: String = ""
	@State private var selectedTags: [Tag] = []
	
	var body: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Text("Add purchase")
					.font(AppFont.largeTitle)
				
				TextField("Description, ie. Foo Bar", text: $titleText)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.lightBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
				
				DatePicker("Purchase date", selection: $purchaseDate, displayedComponents: .date)
					.datePickerStyle(.graphical)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.lightBlue)
					.foregroundColor(.white)
					.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
				
				TextField("Amount", text: $amount)
					.keyboardType(.numberPad)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.lightBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
					.onReceive(Just(amount)) { newValue in
						let filtered = newValue.filter { "0123456789".contains($0) }
						if filtered != newValue {
							self.amount = filtered
						}
						self.amount = self.amount.removePrefix("0")
					}
				
				if let tags = viewModel.tags {
					TagsView(tags: tags, tagWasTapped: { tapped in
						let existing = selectedTags.first { $0.id == tapped.id }
						if let existing = existing {
							selectedTags = selectedTags.filter { $0.id != existing.id }
							print("Removing tag \(existing.tag)")
						} else {
							selectedTags.append(tapped)
							print("Adding tag \(tapped.tag)")
						}
						if selectedTags.isEmpty {
							let defaultTag = tags.first { $0.tag == "default" }
							selectedTags.append(defaultTag!)
						}
					})
				}
					
				Button {
					Task {
						if await viewModel.savePurchase(amount: amount, title: titleText, when: purchaseDate, tags: selectedTags) {
							dismiss()
						}
					}
				} label: {
					Text("Save")
				}
				.buttonStyle(.borderedProminent)

				Spacer()
				
				Button {
					dismiss()
				} label: {
					Text("Dismiss")
				}
				.tint(.regularOrange)
			}
			.font(AppFont.body)
			.foregroundColor(.white)
			.padding()
			.task {
				await viewModel.loadTags()
			}
		}
	}
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView()
    }
}
