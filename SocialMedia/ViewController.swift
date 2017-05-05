//
//  ViewController.swift
//  SocialMedia
//
//  Created by Owen Duignan on 04/05/2017.
//  Copyright © 2017 Owen Duignan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // Create an array of all the “nssl” pictures
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title in the navigation controller
        title = "Storm Viewer"
        
        // Load the list of files that are inside the app bundle
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Loop through the images for images beginning with "nssl"
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    
    // The number of rows in the scction based on the size of the array
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Recycle cells that are required to display each row
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    //
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // 1: Try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: Success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: Now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

































































