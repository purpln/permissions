#if PERMISSIONS_SPM
import Permissions
#endif

#if PERMISSIONS_BLUETOOTH

import CoreBluetooth

public extension Permission {
    static var bluetooth: BluetoothPermission { BluetoothPermission() }
}

public class BluetoothPermission: Permission {
    open override var type: Type { .bluetooth }
    open override var description: String { "NSBluetoothAlwaysUsageDescription" }
    
    public override var status: Status {
        if #available(iOS 13.1, tvOS 13.1, macOS 10.15, *) {
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
        BluetoothHandler.shared = BluetoothHandler()
        BluetoothHandler.shared?.request {
            DispatchQueue.main.async {
                completion()
                BluetoothHandler.shared = nil
            }
        }
    }
}

class BluetoothHandler: NSObject {
    static var shared: BluetoothHandler?
    lazy var manager: CBCentralManager = CBCentralManager()
    var completion: ()->Void = {}
    
    func request(_ completion: @escaping () -> Void) {
        self.completion = completion
        manager.delegate = self
    }
    
    override init() { super.init() }
    deinit { manager.delegate = nil }
}

extension BluetoothHandler: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if #available(iOS 13.0, tvOS 13, *) {
            switch CBPeripheralManager().authorization {
            case .notDetermined: break
            default: self.completion()
            }
        } else {
            switch CBPeripheralManager.authorizationStatus() {
            case .notDetermined: break
            default: self.completion()
            }
        }
    }
}

#endif
