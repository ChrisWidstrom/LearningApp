//
//  ContentModel.swift
//  LearningApp
//
//  Created by Christoffer Widstrom on 3/30/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    @Published var selectedModule:Module?
    var moduleIndex = 0
    
    @Published var selectedLesson:Lesson?
    var lessonIndex = 0
    
    @Published var lessonDescription = NSAttributedString()
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        // 1. Get URL
        
        let dataUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // 2. Create Data object
            let data = try Data(contentsOf: dataUrl!)
            let styleData = try Data(contentsOf: styleUrl!)
            // 3. Decode Data object and return array of Modules
            
            do {
                
                let decoder = JSONDecoder()
                
                let modules = try decoder.decode([Module].self, from: data)

                self.modules = modules
                self.styleData = styleData
                
            } catch {
                print("Decoder error.")
            }
            
            
        } catch {
            print("Data error.")
        }
        
    }
    
    func moduleIndex(_ moduleId:Int) {
        for i in 0..<modules.count {
            if modules[i].id == moduleId {
                moduleIndex = i
                break
            }
        }
        selectedModule = modules[moduleIndex]
    }
    
    func lessonIndex(index: Int) {
        
        if index < selectedModule!.content.lessons.count {
            lessonIndex = index
        } else {
            lessonIndex = 0
        }
        
        selectedLesson = selectedModule!.content.lessons[index]
        lessonDescription = styledHTML(selectedLesson!.explanation)
    }
    
    func nextLesson() {
        
        if lessonIndex + 1 < selectedModule!.content.lessons.count {
            lessonIndex += 1
            selectedLesson = selectedModule!.content.lessons[lessonIndex]
            lessonDescription = styledHTML(selectedLesson!.explanation)
        }
    }
    
    func lastLesson() -> Bool {
        
        return lessonIndex == selectedModule!.content.lessons.count - 1
        
    }
    
    func styledHTML(_ htmlString:String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        // Add the styling data
        if styleData != nil {
            data.append(styleData!)
        }
        
        // Add the html data
        data.append(Data(htmlString.utf8))
        
        // Convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributedString
        }
        
        return resultString
    }
}
