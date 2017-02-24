//
//  MessageCell.swift
//  parseChat
//
//  Created by Shreyas Tawre on 2/24/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit
import Parse

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var results: [PFObject] = []
    func refresh() {
        let query = PFQuery(className: "Message")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                // The find succeeded.
                //print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    
                    for object in objects {
                        self.results.append(object)
                        self.messageLabel.text = object.value(forKey: "message") as? String
                    }
                }
            } else {
                // Log details of the failure
                print("Error")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MessageCell.refresh), userInfo: nil, repeats: true)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
