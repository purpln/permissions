#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_CAMERA

import AVFoundation

@available(iOS 10.0, macCatalyst 14.0, *)
public extension Permission {
    static var camera: CameraPermission { CameraPermission() }
}

@available(iOS 10.0, macCatalyst 14.0, *)
public class CameraPermission: Permission {
    open override var type: Type { .camera }
    open override var description: String { "NSCameraUsageDescription" }
    
    public override var status: Status {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
