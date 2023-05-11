//
//  Shell.swift
//
//
//  Created by Mikhail Vospennikov on 05.05.2023.
//

import Foundation

public struct Shell {
    private var execute: (_ command: Shell.Command) throws -> String
    
    @discardableResult
    public func callAsFunction(_ command: Shell.Command) throws -> String {
        try execute(command)
    }
    
    public init(execute: @escaping (Shell.Command) throws -> String) {
        self.execute = execute
    }
}
