//
//  Uptime.swift
//  
//
//  Created by VOSPENNIKOV Mikhail on 11.05.2023.
//

import Foundation

public extension Shell.Command {
    static var uptime: Shell.Command {
        .init(rawValue: "uptime")
    }
}
