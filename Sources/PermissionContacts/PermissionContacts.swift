#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_CONTACTS

import Contacts

public extension Permission {
    static var contacts: PermissionContacts { PermissionContacts() }
}

public class PermissionContacts: Permission {
    open override var type: Type { .contacts }
    open override var description: String { "NSContactsUsageDescription" }
    
    public override var status: Status {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { _, _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
