//
//  Note.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    var title: String
    var body: String
    
    init(title: String, body: String){
        self.title = title
        self.body = body
        
        
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.title == rhs.title && lhs.body == rhs.body
    
    
}






