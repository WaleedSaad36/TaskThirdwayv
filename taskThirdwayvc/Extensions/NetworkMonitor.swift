//
//  NetworkMonitor.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import Foundation
import Network

final class NetWorkMonitor{
    static let shared = NetWorkMonitor()
    
    private let queue = DispatchQueue.global()
    private var monitor = NWPathMonitor()
    
    public private(set) var isConnection:Bool = false
    public private(set) var connectionType:ConnectionTyoe?
    private init(){
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring (){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            self.isConnection = path.status == .satisfied
            self.getConnectionType(path: path)
            
        }
    }
    
    public func stopMoitoring(){
        monitor.cancel()
    }
    private func getConnectionType(path:NWPath){
        if path.usesInterfaceType(.wifi){
            connectionType = .wifi
        }else if path.usesInterfaceType(.cellular){
            connectionType = .celluar
        }else if path.usesInterfaceType(.wiredEthernet){
            connectionType = .etherNet
        }else{
            connectionType = .unknow
        }
    }
    enum ConnectionTyoe{
        case wifi
        case celluar
        case etherNet
        case unknow
    }

}
