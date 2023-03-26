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

enum FocusedField {
	case none, description, amount
}

struct AddPurchaseView: View {
	@Environment(\.dismiss) var dismiss
	
	@ObservedObject private var viewModel: AddPurchaseViewModel = Resolver.resolve()
	@FocusState private var focusedField: FocusedField?
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
	
	func submit() {
		descriptionError = false
		amountError = false
		
		if description.isEmpty {
			descriptionError = true
		}
		
		if amount.isEmpty || amount == "0" {
			amountError = true
		}
		
		if !descriptionError && !amountError {
			focusedField = FocusedField.none
			Task {
				if await viewModel.savePurchase(amount: amount, title: description, when: purchaseDate, tag: selectedCategory) {
					dismiss()
				}
			}
		} else if descriptionError {
			focusedField = FocusedField.description
		} else if amountError {
			focusedField = FocusedField.amount
		} else {
			focusedField = FocusedField.none
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
					.focused($focusedField, equals: FocusedField.none)
					.font(AppFont.mediumTitle)
					.foregroundColor(.white)
				
				VStack {
					VStack(spacing: 0) {
						HStack(spacing: 0) {
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
						}
						.sheet(isPresented: $showDatePicker) {
							datePickerView
						}
						
						TextFieldView(label: "Describe your purchase", value: $description, error: $descriptionError)
							.focused($focusedField, equals: FocusedField.description)
							.onChange(of: description) { newDescription in
								self.description = newDescription.prefix(maxDescriptionLength).description
								if !description.isEmpty {
									descriptionError = false
								}
							}
							.onSubmit {
								if amount.isEmpty {
									self.focusedField = FocusedField.amount
								} else {
									submit()
								}
							}
							.padding(.vertical, 7)
						
						HStack {
							Spacer()
							Text("\(description.count)/\(maxDescriptionLength)")
								.font(AppFont.smallText)
								.foregroundColor(.white)
						}
					}
					
					TextFieldView(label: "How much did it cost?", value: $amount, error: $amountError)
						.focused($focusedField, equals: FocusedField.amount)
						.keyboardType(.numberPad)
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
						.onSubmit {
							if description.isEmpty {
								self.focusedField = FocusedField.description
							} else {
								submit()
							}
						}
						.padding(.top, 10)
				}
				.padding(.top, 10)
				.task {
					self.focusedField = .description
				}
				
				TagsView(tagWasTapped: { tapped in
					selectedCategory = tapped
				})
				.padding(.top, 20)
				
				Button {
					submit()
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
	}
	
	
	// MARK: - DatePicker for selecting purchase date
	
	var datePickerView: some View {
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

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView()
    }
}
