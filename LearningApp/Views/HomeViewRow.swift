//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 4/3/21.
//

import SwiftUI

struct HomeViewRow: View {
    
    let image:String
    let category:String
    let description:String
    let units:String
    let time:String
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .aspectRatio(/*@START_MENU_TOKEN@*/CGSize(width: 16, height: 9)/*@END_MENU_TOKEN@*/, contentMode: .fit)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 5)
            
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding()
                
                VStack(alignment: .leading, spacing: 10){
                    Text("\(category)")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(description)
                        .font(.caption)
                    Spacer()
                    HStack(spacing: 20) {
                        Text("\(Image(systemName: "text.book.closed"))\(units)")
                        Text("\(Image(systemName: "clock"))\(time)")
                    }.font(.caption)
                    
                }.padding([.top, .bottom], 40)
                 .padding(.trailing, 10)
            }.frame(height:220)
            
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image:"swift", category: "Swift", description: "Understand the fundamentals of the Swift programming language.", units: "20 units", time: "3 Hours")
    }
}
