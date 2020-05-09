//
//  MediaType.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/11/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import Foundation
public enum MediaType: String {
    case Music = "music"
    case Movie = "movie"
    case TVShow = "tvShow"
    case All = "all"
}

struct Media: Codable {
    var artworkUrl100: String
    var artistName: String?
    var trackName: String?
    var longDescription: String?
    var previewUrl: String?
    var kind: String?
    
    
    
    
  func getType() -> MediaType {
    switch self.kind {
    case "Song":
        return MediaType.Music
    case "feature-movie":
        return MediaType.Movie
    case "tv-episode":
        return MediaType.TVShow
    default:
        return MediaType.Music
     }
  }
}
