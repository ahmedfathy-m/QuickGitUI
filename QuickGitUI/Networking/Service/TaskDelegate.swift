//
//  URLSessionDelegate.swift
//  QuickGitUI
//
//  Created by Ahmed Fathy on 04/11/2022.
//

import Foundation

class TaskDelegate: NSObject, URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        metrics.transactionMetrics.forEach { metric in
            print("RETRIEVING METRICS...")
            print("FOR REQUEST: [\(metric.request)]")
            print("RESPONSE STATUS CODE: [\((metric.response as? HTTPURLResponse)?.statusCode ?? 0)]")
            print("\(metric.resourceFetchType.cacheStatus)")
            print("CURRENT DISK USAGE FOR URL CACHE: \((session.configuration.urlCache?.currentDiskUsage ?? 0) / 1024) kB \n")
        }
    }
    
    func urlSession(_ session: URLSession, didCreateTask task: URLSessionTask) {
        print(task)
    }
}


// MARK: - HELPER STATUS STRING
extension URLSessionTaskMetrics.ResourceFetchType {
    var cacheStatus: String {
        switch self {
            case .unknown: return "UNKNOWN"
            case .networkLoad: return "NETWORK LOAD"
            case .serverPush: return "SERVER PUSH"
            case .localCache: return "LOCAL CACHE"
        @unknown default:
            fatalError()
        }
    }
}
