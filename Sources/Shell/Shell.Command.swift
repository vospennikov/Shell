//
//  File.swift
//  
//
//  Created by Mikhail Vospennikov on 05.05.2023.
//

import Foundation

public extension Shell {
    struct Command {
        var rawValue: String
    }
}

public extension Shell.Command {
    static func plainText(_ command: String) -> Shell.Command {
        .init(rawValue: command)
    }
}
