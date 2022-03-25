//
//  BusinessDetail.swift
//  City Sights App
//
//  Created by Evelina Semezyte on 2022-03-25.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader(){ geometry in
                    // Business Image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        
                }
                .ignoresSafeArea(.all, edges: .top)
                
                
                // Open / Closed indacator
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? Color(red: 60 / 255, green: 64 / 255, blue: 71 / 255): Color(red: 9 / 255, green: 128 / 255, blue: 164 / 255))
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            
            Group {
                // Business Name
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                
                // Loop through display address
                if business.location?.displayAddress != nil{
                    
                    ForEach(business.location!.displayAddress!, id : \.self) { displayLine in
                        Text(displayLine)
                            .padding(.horizontal)
                    }
                }
                // Rating
                Image("regular_\(business.rating ?? 0)")
                    .padding()
                
                Divider()
                
                // Phone
                HStack{
                    Text("Phone: \(business.phone ?? "")")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                
                Divider()
                
                // Reviews
                HStack{
                    Text("Reviews: \(business.reviewCount ?? 0)")
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
                
                //Website
                HStack{
                    Text("Website: \(business.url ?? "")")
                        .lineLimit(1)
                    Spacer()
                   Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
            }
            
            // Get directions button
            Button {
               // TODO: Show directions
            } label: {
                ZStack{
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(Color(red: 9 / 255, green: 128 / 255, blue: 164 / 255))
                        .cornerRadius(10)
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                        
                }
            }
            .padding()

            
        }
    }
}

