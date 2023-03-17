//
//  Tags.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import SwiftUI
import WrappingStack
import Core
import Resolver

struct TagsView: View {
	var tagWasTapped: ((Tag) -> Void)?
	var addTagEnabled = false
	
	@ObservedObject private var viewModel: TagsViewModel = Resolver.resolve()
	
	@State private var showAddTagView = false
	@State private var newCategoryText = ""
		
    var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .center) {
				Text("Category")
					.foregroundColor(.white)
					.font(AppFont.mediumTitle)
				
				if addTagEnabled {
					Button {
						withAnimation {
							showAddTagView.toggle()
							if !showAddTagView {
								newCategoryText = ""
							}
						}
					} label: {
						Image(systemName: showAddTagView ? "minus.square" : "plus.square.on.square")
							.accentColor(.lightBlue)
							.font(AppFont.smallTitle)
							.padding(.leading, 7)
							.animation(nil)
					}
				}
			}
			
			VStack(alignment: .leading) {
				HStack {
					let prompt: Text = Text("Enter new category name")
						.font(AppFont.body)
						.foregroundColor(.placeholderWhite)
					
					TextField("", text: $newCategoryText, prompt: prompt)
						.padding(.horizontal, 20)
						.padding(.vertical, 10)
						.background(RoundedRectangle(cornerRadius: 10).fill(.mediumBlue))
					
					Button {
						Task {
							let result = await viewModel.saveTag(title: newCategoryText)
							if result {
								newCategoryText = ""
							}
						}
					} label: {
						Text("Add")
							.padding(.vertical, 3)
					}
					.font(AppFont.bodyBold)
					.buttonStyle(.borderedProminent)
					.accentColor(.mediumBlue)
					.foregroundColor(.regularOrange)
				}

				Spacer()
					.frame(height: 30)
			}
			.font(AppFont.body)
			.foregroundColor(.white)
			.frame(height: showAddTagView ? nil : 0, alignment: .top)
			.clipped()
			
			if let tags = viewModel.tags, !tags.isEmpty {
				WrappingHStack (id: \.self, alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
					ForEach(tags, id: \.self) { tag in
						Button {
							if tagWasTapped != nil {
								withAnimation(nil) {
									viewModel.selectTag(tag: tag)
								}
								tagWasTapped!(tag)
							}
						} label: {
							Text("\(tag.title)")
								.padding(.horizontal, 8)
								.padding(.vertical, 3)
								.background(viewModel.selectedTag == tag ? .lightBlue : .mediumBlue)
								.cornerRadius(5)
								.foregroundColor(viewModel.selectedTag == tag ? .darkBlue : .lightBlue)
								.font(AppFont.body)
						}
						.disabled(viewModel.selectedTag == tag || viewModel.canSelectTags == false)
					}
				}
			} else if viewModel.canSelectTags {
				Text("No categories, create one now?")
					.foregroundColor(.lightBlue)
					.font(AppFont.body)
			}
		}
		.onAppear {
			viewModel.canSelectTags = tagWasTapped != nil
		}
		.task {
			await viewModel.loadTags()
		}
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black.ignoresSafeArea()
			VStack {
				Spacer().frame(height: 100)
				TagsView(tagWasTapped: nil, addTagEnabled: true)
				Spacer()
			}
		}
    }
}
