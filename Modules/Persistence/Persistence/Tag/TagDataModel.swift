//
//  TagDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import FirebaseFirestoreSwift

public class TagDataModel: Codable {
	@DocumentID public var id: String?
	public var title: String
	
	public init() {
		title = ""
	}
	
	public init(_ model: Tag) {
		self.title = model.title
	}
	
	public func toDomainModel() -> Tag {
		return Tag(
			id: id ?? UUID().uuidString,
			title: title
		)
	}
}
