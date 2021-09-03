import Foundation

open class Permission: Equatable {
    
    open var authorized: Bool { status == .authorized }
    open var denied: Bool { status == .denied }
    open var notDetermined: Bool { status == .notDetermined }
    open var debug: String { type.description }
    open var description: String? { nil }
    
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
        case authentication, bluetooth, calendar, camera, contacts, health, locationAlways, locationWhenInUse, microphone, motion, music, notification, photos, reminders, siri, speech, tracking
        
        public var description: String {
            switch self {
            case .authentication: return "Authentication"
            case .bluetooth: return "Bluetooth"
            case .calendar: return "Calendar"
            case .camera: return "Camera"
            case .contacts: return "Contacts"
            case .health: return "Health"
            case .locationAlways: return ""
            case .locationWhenInUse: return ""
            case .microphone: return "Microphone"
            case .motion: return "Motion"
            case .music: return "Music"
            case .notification: return "Notification"
            case .photos: return "Photos"
            case .reminders: return "Reminders"
            case .siri: return "Siri"
            case .speech: return "Speech"
            case .tracking: return "Tracking"
            }
        }
    }
    
    public static func ==(lhs: Permission, rhs: Permission) -> Bool { lhs.type == rhs.type }
    public init() {}
}
