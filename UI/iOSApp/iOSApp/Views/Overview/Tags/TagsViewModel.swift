//
//  TagsViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 17/03/2023.
//

import Foundation
import Core
import Resolver

public class TagsViewModel: ObservableObject {
	@Injected private var tagService: TagServiceProtocol
	
	@Published public private(set) var tags: [Tag]?
	@Published public private(set) var selectedTag: Tag?
	
	public var canSelectTags = true
	
	/*init() {
		NotificationCenter.default.addObserver(self, selector: #selector(tagWasAdded), name: .addTag, object: nil)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	@objc private func tagWasAdded() {
		Task {
			await loadTags()
		}
	}*/
	
	public func getTagsWithAddButton() -> [Tag] {
		let tag = Tag(id: UUID(), title: "+", isDefault: false)
		if var tags = self.tags {
			tags.append(tag)
			return tags
		}
		return [tag]
	}
	
	public func selectTag(id: UUID) {
		if canSelectTags {
			DispatchQueue.main.async {
				self.selectedTag = self.tags?.first { $0.id == id }
			}
		}
	}
	
	public func selectTag(tag: Tag) {
		if canSelectTags {
			DispatchQueue.main.async {
				self.selectedTag = tag
			}
		}
	}
	
	public func loadTags() async {
		if let allTags = await tagService.getAllTags() {
			DispatchQueue.main.async {
				self.tags = allTags
			}
			
			// Make sure we have the default tag as a minimum
			if allTags.isEmpty {
				_ = await tagService.saveTag(Tag(id: UUID(), title: "Default", isDefault: true))
				
				let tags = ["Groceries", "Apparel", "Dining out", "Entertainment", "Bar", "Travel", "Transportation", "Self care", "Pharmacia"]
				for tag in tags {
					_ = await tagService.saveTag(Tag(id: UUID(), title: tag, isDefault: false))
				}
				
				await loadTags()
				return
			}
			
			DispatchQueue.main.async {
				if let selected = self.tags?.first(where: { $0.isDefault == true }) {
					self.selectTag(tag: selected)
				}
			}
		}
	}
	
	public func saveTag(title: String, isDefault: Bool = false) async -> Bool {
		if tags?.first(where: { $0.title.lowercased() == title.lowercased() }) != nil {
			return false
		}
		
		let tag = Tag(id: UUID(), title: title, isDefault: isDefault)
		let isSuccess = await tagService.saveTag(tag) ?? false
		
		if isSuccess {
			Task {
				await loadTags()
			}
		}
		
		//NotificationCenter.default.post(name: .addTag, object: tag, userInfo: nil)
		return isSuccess
	}
}
