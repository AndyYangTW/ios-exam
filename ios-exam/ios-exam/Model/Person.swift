//
//  Person.swift
//  ios-exam
//
//  Created by Andy Yang on 2018/11/23.
//  Copyright © 2018 Andy Yang. All rights reserved.
//

import UIKit

struct PersonListResult: Decodable {
    var results: [Person]?
}

struct Person: Decodable {
    var name: Name?
    var location: Location?
    var email: String?
    var phone: String?
    var cell: String?
    var dob: Dob?
}

struct Name: Decodable {
    var title: String?
    var first: String?
    var last: String?
}

struct Location: Decodable {
    var street: String?
    var city: String?
    var state: String?
}

struct Dob: Decodable {
    var date: String?
    var age: Int?
}
