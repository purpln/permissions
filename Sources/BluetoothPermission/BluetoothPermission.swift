#if PERMISSIONS_SPM
import Permissions
#endif

#if PERMISSIONS_BLUETOOTH

import Foundation
import CoreBluetooth

public extension Permission {

    static var bluetooth: BluetoothPermission {
        return BluetoothPermission()
    }
}

public class BluetoothPermission: Permission {
    
    open override var type: Type { .bluetooth }
    open var usageDescriptionKey: String? { "NSBluetoothAlwaysUsageDescription" }
    
    public override var status: Status {
        if #available(iOS 13.1, tvOS 13.1, *) {
            switch CBCentralManager.authorization {
            case .allowedAlways: return .authorized
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            case .denied: return .denied
            @unknown default: return .denied
            }
        } else if #available(iOS 13.0, tvOS 13.0, *) {
            switch CBCentralManager().authorization {
            case .allowedAlways: return .authorized
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            case .denied: return .denied
            @unknown default: return .denied
            }
        } else {
            switch CBPeripheralManager.authorizationStatus() {
            case .authorized: return .authorized
            case .denied: return .denied
            case .restricted: return .denied
            case .notDetermined: return .notDetermined
            @unknown default: return .denied
            }
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        BluetoothHandler.shared.completion = completion
        BluetoothHandler.shared.reqeustUpdate()
    }
}

class BluetoothHandler: NSObject, CBCentralManagerDelegate {
    
    var completion: ()->Void = {}
    
    static let shared: BluetoothHandler = .init()
    
    override init() {
        super.init()
    }
    
    var manager: CBCentralManager?
    
    func reqeustUpdate() {
        if manager == nil {
            self.manager = CBCentralManager(delegate: self, queue: nil, options: [:])
        } else {
            completion()
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if #available(iOS 13.0, tvOS 13, *) {
            switch central.authorization {
            case .notDetermined:
                break
            default:
                self.completion()
            }
        } else {
            switch CBPeripheralManager.authorizationStatus() {
            case .notDetermined:
                break
            default:
                self.completion()
            }
        }
    }
}

#endif
