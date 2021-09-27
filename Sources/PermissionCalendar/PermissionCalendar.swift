#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_CALENDAR

import EventKit

public extension Permission {
    static var calendar: PermissionCalendar { PermissionCalendar() }
}

public class PermissionCalendar: Permission {
    open override var type: Type { .calendar }
    open override var description: String { "NSCalendarsUsageDescription" }
    
    public override var status: Status {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        let eventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { _, _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
