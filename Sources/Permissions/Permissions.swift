import Foundation

open class Permission: Equatable {
    
    open var authorized: Bool {
        return status == .authorized
    }
    
    open var denied: Bool {
        return status == .denied
    }
    
    open var notDetermined: Bool {
        return status == .notDetermined
    }
    
    open var debug: String {
        return type.name
    }
    
    open var type: Type {
        preconditionFailure("This method must be overridden.")
    }
    
    open var status: Status {
        preconditionFailure("This method must be overridden.")
    }
    
    open func request(completion: @escaping ()->Void) {
        preconditionFailure("This method must be overridden.")
    }
    
    public enum Status: Int {
        case authorized
        case denied
        case notDetermined
        case notSupported
    }
    
    public enum `Type`: Int {
        case notification
        case bluetooth
        
        public var name: String {
            switch self {
            case .notification: return "Notification"
            case .bluetooth: return "Bluetooth"
            }
        }
    }
    
    public static func == (lhs: Permission, rhs: Permission) -> Bool {
        return lhs.type == rhs.type
    }
    
    public init() {}
}
