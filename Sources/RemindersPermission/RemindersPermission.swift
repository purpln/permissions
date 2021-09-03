#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_REMINDERS

import EventKit

public extension Permission {
    static var reminders: RemindersPermission { RemindersPermission() }
}

public class RemindersPermission: Permission {
    open override var type: Type { .reminders }
    open override var description: String { "NSRemindersUsageDescription" }
    
    public override var status: Status {
        switch EKEventStore.authorizationStatus(for: .reminder) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        let eventStore = EKEventStore()
        eventStore.requestAccess(to: .reminder) { _, _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
