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

    var images = [ImageObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageObject.fetchImages { (images) in
            self.images = images
            self.tableView.reloadData()
        }
    }

    // MARK: - UITableView Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath) as! PictureTableViewCell
        
        cell.startLoadingAnimation()
        _ = cell.pictureImageView.setImage(images[indexPath.row].standardResolution, completion: { image in
            cell.stopLoadingAnimation()
        })
        cell.pictureImageView.layer.cornerRadius = 100
        
        return cell
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
