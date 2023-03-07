//
//  FirestoreInstance.swift
//  FirestoreInstance
//
//  Created by Haakon Langaas Lageng on 12/02/2023.
//

import FirebaseCore
import FirebaseFirestore

public final class FirestoreInstance {
	private static var db: Firestore?
	
	public static func database(for collection: String) -> CollectionReference {
		return FirestoreInstance.database.collection(collection)
	}
	
	public static var database: Firestore  {
		get {
			if FirestoreInstance.db == nil {
				FirebaseApp.configure()
				FirestoreInstance.db = Firestore.firestore()
			}
			return FirestoreInstance.db!
		}
	}
}
