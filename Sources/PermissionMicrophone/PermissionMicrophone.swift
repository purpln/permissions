#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_MICROPHONE

import AVFoundation

public extension Permission {
    static var microphone: PermissionMicrophone { PermissionMicrophone() }
}

public class PermissionMicrophone: Permission {
    open override var type: Type { .microphone }
    open override var description: String { "NSMicrophoneUsageDescription" }
    
    public override var status: Status {
        switch  AVAudioSession.sharedInstance().recordPermission {
        case .granted: return .authorized
        case .denied: return .denied
        case .undetermined: return .notDetermined
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
