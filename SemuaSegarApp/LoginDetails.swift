//
//  LoginDetails.swift
//  SemuaSegarApp
//
//  Created by prk on 08/02/23.
//

import CoreData

class LoginDetails: NSManagedObject {
    @NSManaged var username: String!
    @NSManaged var passwrod: String!
}
