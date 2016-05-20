//
//  Note.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private var keyBody = "keyBody"
    
    var body: String
    
    var dictionaryCopy: [String: AnyObject]{
        return [keyBody: body]
    }
    
    init(body: String){
        self.body = body
    }
    
    init?(dictionary: [String:AnyObject]){
        guard let body = dictionary[keyBody] as? String else
        {return nil}
        self.body = body
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.body == rhs.body
    
}






