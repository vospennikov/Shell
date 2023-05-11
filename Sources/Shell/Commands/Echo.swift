//
//  Echo.swift
//  
//
//  Created by VOSPENNIKOV Mikhail on 11.05.2023.
//

import Foundation

public extension Shell.Command {
    static func echo(_ arguments: String...) -> Shell.Command {
        .plain("echo", arguments: arguments)
    }
}
