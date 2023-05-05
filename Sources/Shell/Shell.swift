//
//  Shell.swift
//
//
//  Created by Mikhail Vospennikov on 05.05.2023.
//

import Foundation

public struct Shell {
    public var execute: (_ command: Shell.Command) throws -> String?
    
    public init(execute: @escaping (_: Shell.Command) throws -> String?) {
        self.execute = execute
    }
}
