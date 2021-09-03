#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_MOTION

import CoreMotion

public extension Permission {
    static var motion: MotionPermission { MotionPermission() }
}

public class MotionPermission: Permission {
    open override var type: Type { .motion }
    open override var description: String { "NSMotionUsageDescription" }
    
    public override var status: Status {
        if #available(iOS 11.0, *) {
            switch CMMotionActivityManager.authorizationStatus() {
            case .authorized: return .authorized
            case .denied: return .denied
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            @unknown default: return .denied
            }
        } else {
            if CMSensorRecorder.isAuthorizedForRecording() {
                return .authorized
            } else {
                return .denied
            }
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        let manager = CMMotionActivityManager()
        let today = Date()
        
        manager.queryActivityStarting(from: today, to: today, to: OperationQueue.main) { _, _ in
            completion()
            manager.stopActivityUpdates()
        }
    }
}

#endif
