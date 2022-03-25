//
//  HomeView.swift
//  City Sights App
//
//  Created by Evelina Semezyte on 2022-03-09.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                // Determine if we should show lis or map
                if !isMapShowing {
                    
                    // Show list
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "mappin")
                                .font(.title3)
                            
                            Text("New York")
                                .font(.title3)
                                .bold()
                            
                            Spacer()
                            
                            Button {
                                self.isMapShowing = true
                            } label: {
                                Text("Swith to Map View")
                                    .font(.title3)
                            }
                            
                        }
                        
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                    BusinessMap()
                        .ignoresSafeArea()
                    
                }
            }
        }
        else {
            // Still waiting for data so show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
