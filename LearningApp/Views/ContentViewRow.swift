//
//  SwiftUIView.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 4/11/21.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model:ContentModel
    var index:Int
    
    var body: some View {
        
        let lesson = model.selectedModule!.content.lessons[index]
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 80)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 5 )
                .padding([.leading, .trailing], 10)
            
            HStack{
                Text(String(lesson.id + 1))
                    .padding(.leading, 30)
                    .padding(.trailing, 20)
                
                VStack(alignment: .leading, spacing: 3){
                    Text(lesson.title)
                        .font(.callout)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Video - \(lesson.duration)")
                        .font(.footnote)
                }
                Spacer()
            }
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewRow()
//    }
//}
