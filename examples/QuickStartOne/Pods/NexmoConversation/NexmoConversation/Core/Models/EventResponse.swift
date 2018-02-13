//
//  EventResponse.swift
//  NexmoConversation
//
//  Created by shams ahmed on 11/10/2016.
//  Copyright © 2016 Nexmo. All rights reserved.
//

import Foundation
import Gloss

/// Response model from making a event request
internal struct EventResponse: Gloss.JSONDecodable {
    
    /// ID of event from backend side
    internal let id: String
    
    /// Internal link used for primary id from backend database
    internal let href: String
    
    /// Timestamp of event
    internal let timestamp: Date
    
    // MARK:
    // MARK: Initializers
    
    internal init?(json: JSON) {
        guard let href: String = "href" <~~ json else { return nil }
        guard let idValue: Int32 = "id" <~~ json else { return nil }
        guard let formatter = DateFormatter.ISO8601,
            let timestamp: Date = Decoder.decode(dateForKey: "timestamp", dateFormatter: formatter)(json) else {
            return nil
        }

        self.id = "\(idValue)"
        self.href = href
        self.timestamp = timestamp
    }
}
