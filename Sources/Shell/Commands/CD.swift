//
//  CD.swift
//  
//
//  Created by Mikhail Vospennikov on 11.05.2023.
//

import Foundation

public extension Shell.Command {
    static func cd(_ path: String) -> Shell.Command {
        .plain("cd", arguments: [path])
    }
}
