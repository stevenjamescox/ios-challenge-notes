//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var bodyField: UITextView!
    
    override func viewDidLoad() {
        if let note = note {
            updateWithNote(note)
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateWithNote(note: Note) {
        bodyField.text = note.body
    }
    
    // MARK: Action Button(s)
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let note = note {
            note.body = bodyField.text ?? ""
            NoteController.sharedController.saveToPersistentStorage()
        } else {
            let note = Note(body: bodyField.text ?? "" )
            NoteController.sharedController.addNote(note)
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

