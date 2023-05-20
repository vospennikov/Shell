//
//  Plain.swift
//  
//
//  Created by Mikhail Vospennikov on 11.05.2023.
//

import Foundation

public extension Shell.Command {
    static func plain(_ command: String, arguments: [String] = []) -> Shell.Command {
        .init(rawValue: "\(command) \(arguments.joined(separator: " "))")
    }
}
