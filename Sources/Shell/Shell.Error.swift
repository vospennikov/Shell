//
//  File.swift
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
    }
}
