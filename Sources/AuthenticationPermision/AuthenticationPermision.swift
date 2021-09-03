#if PERMISSIONS_SPM
import Permissions
#endif

#if os(iOS) && PERMISSIONS_AUTHENTICATION

import LocalAuthentication

@available(iOS 10.0, macCatalyst 13.0, *)
public extension Permission {
    static var authentication: AuthenticationPermision { AuthenticationPermision() }
}

@available(iOS 10.0, macCatalyst 13.0, *)
public class AuthenticationPermision: Permission {
    open override var type: Type { .authentication }
    open override var description: String { "NSFaceIDUsageDescription" }
    
    public override var status: Status {
        let context = LAContext()

        var error: NSError?
        let isReady = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        switch error?.code {
            case nil where isReady:
                return .notDetermined
            case -6:
                return .denied
            case -7:
                return .notSupported
            default:
                return .notSupported
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "") { _, _ in
            DispatchQueue.main.async { completion() }
        }
    }
}

#endif
