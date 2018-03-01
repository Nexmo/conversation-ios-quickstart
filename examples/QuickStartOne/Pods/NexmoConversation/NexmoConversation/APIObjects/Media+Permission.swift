//
//  Media+Permission.swift
//  NexmoConversation
//
//  Created by Shams Ahmed on 13/10/17.
//  Copyright © 2017 Nexmo. All rights reserved.
//

import Foundation
import AVFoundation

extension Media {
    
    // MARK:
    // MARK: Privacy
    
    /// Check user permission
    @discardableResult
    internal func hasAudioPermission() throws -> Bool {
        guard controller.device.hasAudioPermission else { throw Errors.userHasNotGrantedPermission }

        return true
    }
}
