//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Evelina Semezyte on 2022-03-08.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total: Int? = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}


