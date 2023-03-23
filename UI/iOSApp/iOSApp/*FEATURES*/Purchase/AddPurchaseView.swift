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
	@State private var description: String = ""
	@State private var purchaseDate: Date = Date().noon()
	@State private var amount: String = ""
	@State private var selectedCategory: Tag?
	@State private var descriptionError: Bool = false
	@State private var amountError: Bool = false
	@State private var showDatePicker: Bool = false
	
	private var maxDescriptionLength = 35
	
	var purchaseDateDescription: String {
		if Calendar.current.isDateInToday(purchaseDate) {
			return "Today"
		} else if Calendar.current.isDateInYesterday(purchaseDate) {
			return "Yesterday"
		} else {
			return purchaseDate.formatted(date: .abbreviated, time: .omitted)
		}
	}
	
	var body: some View {
		ZStack {
			Color.mediumBlue.ignoresSafeArea()

			VStack {
				HStack {
					RoundedRectangle(cornerRadius: 2)
						.frame(width: 40, height: 3)
						.foregroundColor(.regularBlue)
				}
				.padding(.bottom, 20)
				
				Text("What did you buy? 💸")
					.font(AppFont.mediumTitle)
					.foregroundColor(.white)
				
				VStack(alignment: .leading) {
					HStack(spacing: 0) {
						Text("Describe your purchase")
							.font(AppFont.smallTitle)
							.foregroundColor(.white)
						
						Spacer()
						
						Button {
							showDatePicker = true
						} label: {
							Text(purchaseDateDescription)
								.font(AppFont.dirteen)
								.foregroundColor(.lightBlue)
								.offset(x: 3)
							
							Image(systemName: "pencil")
								.font(AppFont.dirteen)
								.foregroundColor(.lightBlue)
						}
						.offset(y: 1)
					}
					
					TextField("", text: $description)
						.textFieldStyle(.plain)
						.padding(.vertical, 10)
						.padding(.horizontal, 20)
						.accentColor(.lightBlue)
						.background(.slayBlue)
						.foregroundColor(.white)
						.cornerRadius(10)
						.onChange(of: description) { newDescription in
							self.description = newDescription.prefix(maxDescriptionLength).description
							if !description.isEmpty {
								descriptionError = false
							}
						}
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(descriptionError ? .red : .regularBlue, lineWidth: descriptionError ? 2 : 1)
						)
					HStack {
						Spacer()
						Text("\(description.count)/\(maxDescriptionLength)")
							.font(AppFont.smallText)
							.foregroundColor(.white)
					}
					
					Text("How much did it cost?")
						.font(AppFont.smallTitle)
						.foregroundColor(.white)
						.padding(.top, 0)
					
					TextField("", text: $amount)
						.keyboardType(.numberPad)
						.textFieldStyle(.plain)
						.padding(.vertical, 10)
						.padding(.horizontal, 20)
						.accentColor(.lightBlue)
						.background(.slayBlue)
						.foregroundColor(.white)
						.cornerRadius(10)
						.onChange(of: amount) { newAmount in
							let filtered = newAmount.filter { "0123456789".contains($0) }
							if filtered != newAmount {
								self.amount = filtered
							}
							self.amount = self.amount.removePrefix("0")
							if !amount.isEmpty {
								amountError = false
							}
						}
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(amountError ? .red : .regularBlue, lineWidth: amountError ? 2 : 1)
						)
				}
				.padding(.top, 20)
				
				TagsView(tagWasTapped: { tapped in
					selectedCategory = tapped
				})
				
				Button {
					descriptionError = false
					amountError = false
					
					if description.isEmpty {
						descriptionError = true
					}
					if amount.isEmpty || amount == "0" {
						amountError = true
					}
					
					if !descriptionError && !amountError {
						Task {
							if await viewModel.savePurchase(amount: amount, title: description, when: purchaseDate, tag: selectedCategory) {
								dismiss()
							}
						}
					}
				} label: {
					Text("Add purchase")
						.font(AppFont.mediumTitle)
						.foregroundColor(.slayBlue)
						.padding(.vertical, 10)
						.frame(maxWidth: .infinity)
				}
				.buttonStyle(.borderedProminent)
				.accentColor(.regularOrange)
				.cornerRadius(100)
				.padding(.top, 10)
				
				Spacer()
			}
			.padding()
		}
		.sheet(isPresented: $showDatePicker) {
			ZStack {
				Color.mediumBlue.ignoresSafeArea()
				
				VStack {
					DatePicker(selection: $purchaseDate, in: ...Date(), displayedComponents: .date) {
					}
					.datePickerStyle(.graphical)
					.colorScheme(.dark)
					.font(AppFont.body)
					.padding(.top, 20)
					.accentColor(.lightBlue)
					.background(.mediumBlue)
					.foregroundColor(.placeholderWhite)
					
					Button {
						showDatePicker = false
					} label: {
						Text("Use this date")
							.font(AppFont.mediumTitle)
							.foregroundColor(.slayBlue)
							.padding(.vertical, 10)
							.frame(maxWidth: .infinity)
					}
					.buttonStyle(.borderedProminent)
					.accentColor(.lightBlue)
					.cornerRadius(100)
					.padding(.top, 10)
				}
				.presentationDetents([.medium])
				.presentationDragIndicator(.hidden)
				.padding(.horizontal, 20)
				.foregroundColor(.white)
			}
		}
	}
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView()
    }
}
