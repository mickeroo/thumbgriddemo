//
//  ContentItemStruct.swift
//  ThumbGridDemo
//
//  Created by Michael Eaton on 9/25/16.
//  Copyright © 2016 Michael Eaton. All rights reserved.
//

import Foundation

struct ContentItem {
    var thumb: String
    var label: String
    var topic: String
    var descriptionTitle: String
    var description: String
    var video: String
    init() {
        topic = ""
        thumb = ""
        label = ""
        descriptionTitle = ""
        description = ""
        video = ""
    }
}
