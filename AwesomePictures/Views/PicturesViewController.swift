//
//  PicturesViewController.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 1/25/17.
//  Copyright © 2017 Evandro Harrison Hoffmann. All rights reserved.
//

import UIKit
import AwesomeData

class PicturesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageObject.fetchImages { (images) in
            print("Count: \(images.count)")
        }
    }

    // MARK: - UITableView Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath) as! PictureTableViewCell
        
        _ = cell.pictureImageView.setImage("https://www.askideas.com/media/07/Keep-Calm-Cause-Im-Awesome.png", completion: nil)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 75
        }
        
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableViewAutomaticDimension
        }
        
        return 200
    }
    
}
