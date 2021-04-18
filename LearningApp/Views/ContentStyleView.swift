//
//  ContentStyleView.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 4/18/21.
//

import SwiftUI
import UIKit

struct ContentStyleView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        // Set the attributed text for the lesson
        textView.attributedText = model.lessonDescription
        
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
}

struct ContentStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentStyleView()
    }
}
