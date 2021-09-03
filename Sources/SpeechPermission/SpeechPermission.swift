#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_SPEECH

import Speech

public extension Permission {
    static var speech: SpeechPermission { SpeechPermission() }
}

public class SpeechPermission: Permission {
    open override var type: Type { .speech }
    open override var description: String { "NSSpeechRecognitionUsageDescription" }
    
    public override var status: Status {
        switch SFSpeechRecognizer.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        SFSpeechRecognizer.requestAuthorization { _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
