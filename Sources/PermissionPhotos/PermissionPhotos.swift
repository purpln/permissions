#if PERMISSIONS_SPM
import Permissions
#endif

#if PERMISSIONS_PHOTOS

import Photos

public extension Permission {
    static var photos: PermissionPhotos { PermissionPhotos() }
}

public class PermissionPhotos: Permission {
    open override var type: Type { .photos }
    open override var description: String? { "NSPhotoLibraryUsageDescription" }
    
    public override var status: Status {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .limited: return .authorized
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization { _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
