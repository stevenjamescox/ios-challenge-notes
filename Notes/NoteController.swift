//
//  NoteController.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    static let sharedController = NoteController()
    
    private let keyNote = "keyNote"
    
    var notes: [Note] = []
    
    init(){
        loadFromPersistentStorage()}
    
    func addNote(note: Note){
        notes.append(note)
        saveToPersistentStorage()
    }
    
    func removeNote(note: Note){
        if let index = notes.indexOf(note){
            notes.removeAtIndex(index)
            saveToPersistentStorage()
        }
    }
    
    func saveToPersistentStorage(){
        NSUserDefaults.standardUserDefaults().setObject(notes.map{$0.dictionaryCopy}, forKey: keyNote)
    }
    
    func loadFromPersistentStorage(){
        guard let notesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(keyNote) as? [[String:AnyObject]] else {
            return
        }
        self.notes = notesDictionaryArray.flatMap{Note(dictionary: $0)}
    }
    
}
