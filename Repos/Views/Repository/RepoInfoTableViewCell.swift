//
//  RepoInfoTableViewCell.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import UIKit

class RepoInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadImage(url: String) {
        if let url = URL(string: url) {
            let imagesHelper = ImagesHelper()
            imagesHelper.downloadImage(from:url , success: { (image) in
                self.repoImage.image = image

            }, failure: { (failureReason) in
                print(failureReason)
            })
        }
    }

}
