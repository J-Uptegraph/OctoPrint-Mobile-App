# OctoPrint Mobile (iOS)

**OctoPrint Mobile** is a native iOS app built on top of the OctoPrint web interface. Developed in Swift, it allows users to remotely monitor, control, and manage 3D prints through their OctoPrint server. Designed for convenience and mobility, the app supports real-time printer status, remote login, file queueing, and essential printer controls—all from your iPhone or iPad.

> ⚠️ This project is a personal project and **not** affiliated with or meant to compete with the official [OctoPrint project](https://octoprint.org/).  
> I built this app for my own personal use and programming practice. It is free, open-source, and I do not intend to monetize it.

---

## Features

| Capability        | Description                                                                  |
|------------------|------------------------------------------------------------------------------|
| Remote Login      | Enter credentials via embedded browser and JavaScript injection.             |
| Live Monitoring   | View temperature data, print progress, and webcam feed.                      |
| Printer Control   | Home axes, pause/resume/cancel jobs, and adjust temperatures.                |
| File Queueing     | Upload G-code files and start prints directly from your device.              |
| Web Launch Option | Opens the OctoPrint web UI for full-feature access if desired.               |

---

## Tech Stack

- **Language**: Swift 5
- **UI Framework**: UIKit + WebKit
- **Backend**: OctoPrint server (with REST API)
- **Web Automation**: JavaScript injection for login
- **Networking**: `URLSession`, `WKWebView`

---

## Login Logic Example

```swift
func loginCredentials(username: String, password: String) {
    guard let url = URL(string: "http://octopi.local/login") else { return }
    let request = URLRequest(url: url)
    webView.load(request)

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        webView.evaluateJavaScript("document.getElementById('login-user').value = '\(username)';", completionHandler: nil)
        webView.evaluateJavaScript("document.getElementById('login-password').value = '\(password)';", completionHandler: nil)
        webView.evaluateJavaScript("document.getElementById('login-button').click();", completionHandler: nil)
    }
}
