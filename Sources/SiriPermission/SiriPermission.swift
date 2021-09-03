#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_SIRI

import Intents

public extension Permission {
    static var siri: SiriPermission { SiriPermission() }
}

public class SiriPermission: Permission {
    open override var type: Type { .siri }
    open override var description: String { "NSSiriUsageDescription" }
    
    public override var status: Status {
        switch INPreferences.siriAuthorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        INPreferences.requestSiriAuthorization { _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
