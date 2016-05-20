//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Steve Cox on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, UITextFieldDelegate {
    
    var notes = [Note]()
    var filteredNotes = [Note]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredNotes = notes.filter({( note: Note) -> Bool in
            return note.body.lowercaseString.containsString(searchText.lowercaseString)
        })
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredNotes.count
        }
        return NoteController.sharedController.notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)
        let note: Note
        if searchController.active && searchController.searchBar.text != "" {
            note = filteredNotes[indexPath.row]
            cell.textLabel?.text = note.body
        } else {
            note = NoteController.sharedController.notes[indexPath.row] }
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

extension NotesTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(searchBar: UISearchBar) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension NotesTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
