//
//  Album.swift
//  Albums
//
//  Created by macbook on 10/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct Album: Codable {
    
    enum AlbumKeys: String, CodingKey {
        case name
        case artist
        case genres
        case coverURLs = "coverArt"
        case songTitle
        case songDuration
        case id
        case songs
    }
    enum SongKeys: String, CodingKey {
        case title
        case duration
        case id
        
        enum SongNameKeys: String, CodingKey {
            case title
        }
        
    }
    
    let artist: String
    let coverURLs: [URL]
    let genres: [String]
    let songs: [String]
    let name: String
    let id: Int
    
//    let songTitle: String
//    let songDuration: String
    
    
    // Making a custom decoder:
    init(from decoder: Decoder) throws {
        
        //telling the decoder that you want a dictionary that has AlbumKeys in it:
        //this entire initializer throws, so you have to try everything you do
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        artist = try container.decode(String.self, forKey: .artist)
        
        do {
            id = try container.decode(Int.self, forKey: .id)
        } catch {
            let idString = try container.decode(String.self, forKey: .id)
            id = Int(idString) ?? 0
        }
        
        let songString = try container.decode([String].self, forKey: .songs)
        songs = songString.compactMap { string: $0 }
        
        coverURLs = try container.decode([URL].self, forKey: .coverURLs)
        genres = try container.decode([String].self, forKey: .genres)
//        songs = try container.decode([String], forKey: <#T##Album.AlbumKeys#>)
        
        
        
        
//
//        var songsContainer = try container.nestedUnkeyedContainer(forKey: .songs)
//
//        var songNames: [String] = []
//
//        while !songsContainer.isAtEnd {
////            let songDescriptionContainer = try songsContainer.nestedContainer(keyedBy: PokemonKeys.AbilityDescriptionKeys.self)
//
//            let songContainer = try songsContainer.nestedContainer(keyedBy: SongKeys.SongNameKeys.self)
//
//            let songTitle = try songContainer.decode(String.self, forKey: .title)
//            songNames.append(songTitle)
//        }
//
//        songs = songNames
        
        
        
    }
    
    
    
    
}

struct Song: Codable {
    let title: String
    let duration: String
    let id: Int
    
    init(from decoder: Decoder) throws {
        
    }
    
}
