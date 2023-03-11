//
//  Bootstrap.swift
//  Bootstrap
//
//  Created by Haakon Langaas Lageng on 31/01/2023.
//

import Resolver
import Core
import Services
import Persistence

extension Resolver {
	public static func bootstrapDomain() {
		register { PeriodService() as PeriodServiceProtocol }
		register { PurchaseService() as PurchaseServiceProtocol }
		register { TagService() as TagServiceProtocol }
		
#if DEBUG || TEST
		//register { FriendsMockService() as FriendsServiceProtocol }
		//register { InMemoryDataManager() as DataManagerProtocol }
#endif
	}
	
	public static func bootstrapPersistence() {
		register { PeriodRepository() as PeriodRepositoryProtocol }
		register { PurchaseRepository() as PurchaseRepositoryProtocol }
		register { TagRepository() as TagRepositoryProtocol }
	}
}

