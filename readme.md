```swift
import Permissions
import PermissionAuthentication
import PermissionBluetooth
import PermissionCalendar
import PermissionCamera
import PermissionContacts
import PermissionHealth
import PermissionLocationAlways
import PermissionLocationWhenInUse
import PermissionMicrophone
import PermissionMotion
import PermissionMusic
import PermissionNotification
import PermissionPhotos
import PermissionReminders
import PermissionSiri
import PermissionSpeech
import PermissionTracking

let permissions: [Permission] = [.authentication, .bluetooth, .calendar, .camera, .contacts, .health, .locationAlways, .locationWhenInUse, .microphone, .motion, .music, .notification, .photos, .reminders, .siri, .speech, .tracking]

permissions.forEach { permission in
    permission.request {
        print(permission.status)
    }
}
```
