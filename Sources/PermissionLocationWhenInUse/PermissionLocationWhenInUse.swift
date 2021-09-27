#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_LOCATION_WHENINUSE

import MapKit

public extension Permission {
    static var locationWhenInUse: PermissionLocationWhenInUse { PermissionLocationWhenInUse() }
}

public class PermissionLocationWhenInUse: Permission {
    open override var type: Type { .locationWhenInUse }
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
        case .authorizedAlways: return .denied
        case .authorizedWhenInUse: return .authorized
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        LocationWhenInUseHandler.shared = LocationWhenInUseHandler()
        LocationWhenInUseHandler.shared?.request {
            DispatchQueue.main.async {
                completion()
                LocationWhenInUseHandler.shared = nil
            }
        }
    }
}

class LocationWhenInUseHandler: NSObject {
    static var shared: LocationWhenInUseHandler?
    lazy var manager = CLLocationManager()
    var completion: () -> Void = {}
    
    func request(_ completion: @escaping () -> Void) {
        self.completion = completion
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            manager.delegate = self
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            manager.delegate = self
            manager.requestWhenInUseAuthorization()
        default:
            self.completion()
        }
    }
    
    override init() { super.init() }
    deinit { manager.delegate = nil }
}

extension LocationWhenInUseHandler: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined { return }
        completion()
    }
}

#endif
