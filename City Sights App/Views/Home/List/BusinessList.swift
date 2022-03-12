//
//  BusinessList.swift
//  City Sights App
//
//  Created by Evelina Semezyte on 2022-03-09.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var  model: ContentModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Restaurants", business: model.restaurants)
                
                BusinessSection(title: "Sights", business: model.sights)
            }
        }
        
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
            .environmentObject(ContentModel())
    }
}
