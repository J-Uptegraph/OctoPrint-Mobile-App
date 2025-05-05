import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let sd: [SD]
    let state: [State]
    let temperature: [Temperature]
}

// MARK: - SD
struct SD: Codable {
    let ready: Bool
}

// MARK: - State
struct State: Codable {
    let error: String
    let flags: Flags
    let text: String
}

// MARK: - Flags
struct Flags: Codable {
    let cancelling, closedOrError, error, finishing: Bool
    let operational, paused, pausing, printing: Bool
    let ready, resuming, sdReady: Bool
}

// MARK: - Temperature
struct Temperature: Codable {
    let bed, tool0: Bed
}

// MARK: - Bed
struct Bed: Codable {
    let actual: Double
    let offset, target: Int
}
