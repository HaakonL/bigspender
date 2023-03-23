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
	
	@ObservedObject private var viewModel: TagsViewModel = Resolver.resolve()
	
	@State private var showAddTagView = false
	@State private var newCategoryText = ""
		
    var body: some View {
		VStack(alignment: .leading) {
			WrappingHStack (id: \.self, alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
				ForEach(viewModel.getTagsWithAddButton(), id: \.self) { tag in
					if tag.title == "+" {
						
						Button {
							withAnimation {
								showAddTagView.toggle()
							}
							if !showAddTagView {
								newCategoryText = ""
							}
						} label: {
							Image(systemName: showAddTagView ? "minus.square" : "plus.square.on.square")
								.accentColor(.lightBlue)
								.font(AppFont.smallTitle)
								.padding(.leading, 7)
						}
					} else {
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
								.background(viewModel.selectedTag == tag ? .lightBlue : .slayBlue)
								.cornerRadius(5)
								.foregroundColor(viewModel.selectedTag == tag ? .darkBlue : .lightBlue)
								.font(AppFont.body)
						}
						.disabled(viewModel.selectedTag == tag || viewModel.canSelectTags == false)
					}
				}
			}
			
			VStack(alignment: .leading) {
				HStack(alignment: .bottom) {
					let prompt: Text = Text("Enter new category name")
						.font(AppFont.body)
						.foregroundColor(.placeholderWhite)
					
					TextField("", text: $newCategoryText, prompt: prompt)
						.padding(.horizontal, 20)
						.padding(.vertical, 10)
						.background(RoundedRectangle(cornerRadius: 10).fill(.slayBlue))
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.regularBlue, lineWidth: 1)
						)
					
					Button {
						Task {
							let result = await viewModel.saveTag(title: newCategoryText)
							if result {
								newCategoryText = ""
								withAnimation {
									showAddTagView.toggle()
								}
							}
						}
					} label: {
						Text("Add")
							.padding(.vertical, 3)
					}
					.font(AppFont.body)
					.buttonStyle(.borderedProminent)
					.accentColor(.regularBlue)
					.foregroundColor(.white)
				}
				
				Spacer()
					.frame(height: 30)
			}
			.padding(.top, 10)
			.font(AppFont.body)
			.foregroundColor(.white)
			.frame(height: showAddTagView ? nil : 0, alignment: .bottom)
			.clipped()
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
				TagsView(tagWasTapped: nil)
				Spacer()
			}
		}
    }
}
