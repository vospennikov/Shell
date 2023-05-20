//
//  Xcodebuild.swift
//  
//
//  Created by Mikhail Vospennikov on 11.05.2023.
//

import Foundation

public extension Shell.Command {
    static func xcodebuild(
        workspace: URL,
        scheme: String,
        configuration: String = "Debug",
        sdk: String = "iphonesimulator",
        options: XcodebuildOptions...
    ) -> Self {
        .plain(
            "xcodebuild",
            arguments: [
                "-workspace \(workspace.path())",
                "-scheme \(scheme)",
                "-configuration \(configuration)",
                "-sdk \(sdk)",
                options.map { $0.rawValue }.joined(separator: " ")
            ]
        )
    }
}

public enum XcodebuildOptions: String {
    case clean, build
}
