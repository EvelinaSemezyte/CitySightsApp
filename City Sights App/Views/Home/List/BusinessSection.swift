//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Evelina Semezyte on 2022-03-09.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var business: [Business]
    
    
    var body: some View {
        
        Section(header: BusinessSectionHeader(title: title)) {
            
            ForEach(business) { business in
                
                NavigationLink {
                    BusinessDetail(business: business)
                } label: {
                    BusinessRow(business: business)
                }

            }
        }
    }
}


