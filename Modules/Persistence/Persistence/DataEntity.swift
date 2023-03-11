//
//  DataEntity.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/03/2023.
//

import Foundation
import Core

public protocol DataEntity {
	func toDomainObject() -> DomainObject
}
