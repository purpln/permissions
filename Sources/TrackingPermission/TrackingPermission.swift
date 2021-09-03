#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_TRACKING

import AppTrackingTransparency

@available(iOS 14.5, tvOS 14.5, *)
public extension Permission {
    static var tracking: TrackingPermission { TrackingPermission() }
}

@available(iOS 14.5, tvOS 14.5, *)
public class TrackingPermission: Permission {
    open override var type: Type { .tracking }
    open override var description: String { "NSUserTrackingUsageDescription" }
    
    public override var status: Status {
        switch ATTrackingManager.trackingAuthorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted : return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        ATTrackingManager.requestTrackingAuthorization { _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
