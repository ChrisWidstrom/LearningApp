//
//  ContentView.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 3/30/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment:.leading) {
                
                Text("What would you like to do today?")
                    .padding(.leading, 22)
                
                ScrollView {
                    LazyVStack{
                        ForEach (model.modules) { module in
                            
                            NavigationLink(
                                destination:
                                    ContentView()
                                    .onAppear(perform: {
                                                model.moduleIndex(module.id)
                                            }),
                                label: {
                                            HomeViewRow(image: module.content.image, category: "Learn \(module.category)", description: module.content.description, units: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                            })
                            
                            HomeViewRow(image: module.test.image, category: "\(module.category) Test", description: module.test.description, units: "\(module.test.questions.count) Questions", time: module.test.time)
                        }

                    }.padding()
                }.navigationTitle("Get Started")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
