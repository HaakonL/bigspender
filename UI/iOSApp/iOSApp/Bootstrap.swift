//
//  Bootstrap.swift
//  App
//
//  Created by Haakon Langaas Lageng on 08/01/2023.
//

import Resolver
import Bootstrap

extension Resolver: ResolverRegistering {
	public static func registerAllServices() {
		Resolver.bootstrapApp()
		Resolver.bootstrapDomain()
		Resolver.bootstrapPersistence()
	}
	
	public static func bootstrapApp() {
		register { PeriodViewModel() }
		register { OverviewViewModel() }
		register { PhoneNumberViewModel() }
		register { AddPurchaseViewModel() }
	}
}
