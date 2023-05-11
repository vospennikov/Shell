//
//  Shell.Error.swift
//  
//
//  Created by Mikhail Vospennikov on 05.05.2023.
//

import Foundation

public extension Shell {
    struct Error: Swift.Error {
        public let terminationStatus: Int32
        public let stdErr: Data
        public let stdOut: Data
        public let description: String
    }
}

extension Shell.Error {
    init(terminationStatus: Int32, stdErr: Data, stdOut: Data) {
        self.terminationStatus = terminationStatus
        self.stdErr = stdErr
        self.stdOut = stdOut
        self.description = String(data: stdErr, encoding: .utf8) ?? "Unknown"
    }
}
