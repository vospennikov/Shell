//
//  XED.swift
//  
//
//  Created by Mikhail Vospennikov on 20.05.2023.
//

import Foundation

public extension Shell.Command {
    static func xed(_ arguments: String...) -> Shell.Command {
        .plain("xed", arguments: arguments)
    }
}
