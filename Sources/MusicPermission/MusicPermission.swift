#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_MUSIC

import MediaPlayer

public extension Permission {
    static var music: MusicPermission { MusicPermission() }
}

public class MusicPermission: Permission {
    open override var type: Type { .music }
    open override var description: String { "NSAppleMusicUsageDescription" }
    
    public override var status: Status {
        switch MPMediaLibrary.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        MPMediaLibrary.requestAuthorization() { finished in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
