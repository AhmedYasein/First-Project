//
//  MediaCell.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/10/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import UIKit
import SDWebImage
class MediaCell: UITableViewCell {
    
    @IBOutlet weak var imageOfMedia: UIImageView!
    @IBOutlet weak var mediaName: UILabel!
    @IBOutlet weak var MediaLongDescripion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureMediaCell(media: Media){
        let mediaType = media.getType()
        if mediaType == MediaType.TVShow {
            self.mediaName.text = media.artistName ?? ""
            
        } else {
            self.mediaName.text = media.trackName ?? ""
        }
        if mediaType == MediaType.Music {
            self.MediaLongDescripion.text = media.artistName ?? ""
        } else {
            self.MediaLongDescripion.text = media.longDescription ?? ""
        }
        let imageUrl: String? = media.artworkUrl100
   
        imageOfMedia.sd_setImage(with: URL(string: imageUrl ?? "placeholder.png"), placeholderImage: UIImage(named: "placeholder.png"))
        
    }
}
