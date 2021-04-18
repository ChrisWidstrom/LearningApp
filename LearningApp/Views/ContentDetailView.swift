//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 4/17/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.selectedLesson
        let url = URL(string: Constants.videoUrl + (lesson?.video ?? ""))
        
        VStack {
            
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!)).cornerRadius(10)
            }

            ContentStyleView()
            
            if model.lastLesson() == false {
                
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .cornerRadius(10)
                            .foregroundColor(.green)
                        
                        Text("Next lesson: \(model.selectedModule!.content.lessons[model.lessonIndex + 1].title)")
                            .foregroundColor(.white)
                    }
                    
                })
                
            }
            
        }.padding()

    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

