#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_LOCATION_ALWAYS

import MapKit

public extension Permission {
    static var locationAlways: PermissionLocationAlways { PermissionLocationAlways() }
}

public class PermissionLocationAlways: Permission {
    open override var type: Type { .locationAlways }
    open override var description: String { "NSLocationAlwaysAndWhenInUseUsageDescription" }
    
    public override var status: Status {
        let authorizationStatus: CLAuthorizationStatus = {
            let locationManager = CLLocationManager()
            if #available(iOS 14.0, tvOS 14.0, *) {
                return locationManager.authorizationStatus
            } else {
                return CLLocationManager.authorizationStatus()
            }
        }()
        
        switch authorizationStatus {
        #if os(iOS)
        case .authorized: return .authorized
        #endif
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .authorizedAlways: return .authorized
        case .authorizedWhenInUse: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        LocationAlwaysHandler.shared = LocationAlwaysHandler()
        LocationAlwaysHandler.shared?.request {
            DispatchQueue.main.async {
                completion()
                LocationAlwaysHandler.shared = nil
            }
        }
    }
}

class LocationAlwaysHandler: NSObject {
    static var shared: LocationAlwaysHandler?
    lazy var manager = CLLocationManager()
    var completion: () -> Void = {}
    
    func request(_ completion: @escaping () -> Void) {
        self.completion = completion
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            manager.delegate = self
            manager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            manager.delegate = self
            manager.requestAlwaysAuthorization()
        default:
            self.completion()
        }
    }
    
    override init() { super.init() }
    deinit { manager.delegate = nil }
}

extension LocationAlwaysHandler: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined { return }
        completion()
    }
}

#endif
