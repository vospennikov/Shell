//
//  File.swift
//  
//
//  Created by Mikhail Vospennikov on 05.05.2023.
//

import Foundation
import Dispatch

public extension Shell {
    static var live = Shell(
        execute: { command in
            let outputQueue = DispatchQueue(label: "shell-output-queue")
            
            let process = Process()
            process.environment = ProcessInfo.processInfo.environment
            process.arguments = ["-c", command.rawValue]
            process.executableURL = URL(fileURLWithPath: "/bin/zsh")
            
            let outputPipe = Pipe()
            let errorPipe = Pipe()
            process.standardOutput = outputPipe
            process.standardError = errorPipe
            
            var outputData = Data()
            var errorData = Data()
            outputPipe.fileHandleForReading.readabilityHandler = { handler in
                let data = handler.availableData
                outputQueue.async {
                    outputData.append(data)
                }
            }
            errorPipe.fileHandleForReading.readabilityHandler = { handler in
                let data = handler.availableData
                outputQueue.async {
                    errorData.append(data)
                }
            }
            
            try process.run()
            process.waitUntilExit()
            
            outputPipe.fileHandleForReading.readabilityHandler = nil
            errorPipe.fileHandleForReading.readabilityHandler = nil
            
            return try outputQueue.sync {
                if process.terminationStatus != 0 {
                    throw Shell.Error(
                        terminationStatus: process.terminationStatus,
                        stdErr: errorData,
                        stdOut: outputData
                    )
                }
                
                guard let output = String(data: outputData, encoding: .utf8) else {
                    return ""
                }
                
                guard !output.hasSuffix("\n") else {
                    let endIndex = output.index(before: output.endIndex)
                    return String(output[..<endIndex])
                }
                
                return output
            }
        }
    )
}
