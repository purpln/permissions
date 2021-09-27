#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_HEALTH

import HealthKit

public extension Permission {
    static var health: PermissionHealth { PermissionHealth() }
}

public class PermissionHealth: Permission {
    open override var type: Type { .health }
    open var readingDescription: String? { "NSHealthUpdateUsageDescription" }
    open var writingDescription: String? { "NSHealthShareUsageDescription " }
    
    public static func status(for type: HKObjectType) -> Status {
        switch HKHealthStore().authorizationStatus(for: type) {
        case .sharingAuthorized: return .authorized
        case .sharingDenied: return .denied
        case .notDetermined: return .notDetermined
        @unknown default: return .denied
        }
    }
    
    public static func request(reading: Set<HKObjectType>, writing: Set<HKSampleType>, completion: @escaping (() -> Void)) {
        HKHealthStore().requestAuthorization(toShare: writing, read: reading) { _, _ in
            DispatchQueue.main.async { completion() }
        }
    }
    
    @available(*, unavailable)
    open override var authorized: Bool { fatalError() }
    
    @available(*, unavailable)
    open override var denied: Bool { fatalError() }
    
    @available(*, unavailable)
    open override var notDetermined: Bool { fatalError() }
    
    @available(*, unavailable)
    public override var status: Status { fatalError() }
    
    @available(*, unavailable)
    open override func request(completion: @escaping ()->Void) { fatalError() }
}

#endif
