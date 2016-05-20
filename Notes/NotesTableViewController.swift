//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.sharedController.notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)
        let note = NoteController.sharedController.notes[indexPath.row]
        cell.textLabel?.text = note.body
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let note = NoteController.sharedController.notes[indexPath.row]
            NoteController.sharedController.removeNote(note)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        } else if editingStyle == .Insert {
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addSegue" {
        } else if segue.identifier == "editSegue"{
            let notesDetailViewController = segue.destinationViewController as? NotesDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let note = NoteController.sharedController.notes[indexPath.row]
                notesDetailViewController?.note = note
            }
        }
    }
    
    
}
