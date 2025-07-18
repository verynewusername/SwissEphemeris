//
//  Planet.swift
//  
//
//  07.12.19.
//

import Foundation

/// Models all celestial objects available in SwissEphemeris.
/// The raw `Int32` values map to the IPL planetary bodies.
public enum Planet: Int32 {
    case sun = 0
    case moon = 1
    case mercury = 2
    case venus = 3
    case mars = 4
    case jupiter = 5
    case saturn = 6
    case uranus = 7
    case neptune = 8
    case pluto = 9
    case meanNode = 10      // Mean lunar node
    case trueNode = 11      // True lunar node
    case meanApogee = 12    // Mean lunar apogee (Lilith)
    case oscuApogee = 13    // Osculating lunar apogee
    case earth = 14
    case chiron = 15
    case pholus = 16
    case ceres = 17
    case pallas = 18
    case juno = 19
    case vesta = 20
    
    /// The symbol commonly associated with the celestial body.
    public var symbol: String {
        switch self {
        case .sun:
            return "☉"
        case .moon:
            return "☾"
        case .mercury:
            return "☿"
        case .venus:
            return "♀"
        case .mars:
            return "♂︎"
        case .jupiter:
            return "♃"
        case .saturn:
            return "♄"
        case .uranus:
            return "♅"
        case .neptune:
            return "♆"
        case .pluto:
            return "♇"
        case .meanNode:
            return "☊"  // North Node
        case .trueNode:
            return "☊"  // North Node (True)
        case .meanApogee:
            return "⚸"  // Black Moon Lilith
        case .oscuApogee:
            return "⚸"  // Black Moon Lilith (Osculating)
        case .earth:
            return "🜨"  // Earth symbol
        case .chiron:
            return "⚷"  // Chiron
        case .pholus:
            return "⯛"  // Pholus
        case .ceres:
            return "⚳"  // Ceres
        case .pallas:
            return "⚴"  // Pallas
        case .juno:
            return "⚵"  // Juno
        case .vesta:
            return "⚶"  // Vesta
        }
    }
    
    /// The name of the celestial body formatted with the `symbol`.
    public var formatted: String {
        switch self {
        case .sun:
            return "☉ Sun"
        case .moon:
            return "☾ Moon"
        case .mercury:
            return "☿ Mercury"
        case .venus:
            return "♀ Venus"
        case .mars:
            return "♂️ Mars"
        case .jupiter:
            return "♃ Jupiter"
        case .saturn:
            return "♄ Saturn"
        case .uranus:
            return "♅ Uranus"
        case .neptune:
            return "♆ Neptune"
        case .pluto:
            return "♇ Pluto"
        case .meanNode:
            return "☊ Mean Node"
        case .trueNode:
            return "☊ True Node"
        case .meanApogee:
            return "⚸ Mean Apogee (Lilith)"
        case .oscuApogee:
            return "⚸ Osculating Apogee"
        case .earth:
            return "🜨 Earth"
        case .chiron:
            return "⚷ Chiron"
        case .pholus:
            return "Pholus"
        case .ceres:
            return "⚳ Ceres"
        case .pallas:
            return "⚴ Pallas"
        case .juno:
            return "⚵ Juno"
        case .vesta:
            return "⚶ Vesta"
        }
    }
    
    /// Returns true if this is a traditional planet (Sun through Pluto)
    public var isTraditionalPlanet: Bool {
        return rawValue <= 9
    }
    
    /// Returns true if this is a lunar node
    public var isLunarNode: Bool {
        return self == .meanNode || self == .trueNode
    }
    
    /// Returns true if this is a lunar apogee (Lilith)
    public var isLunarApogee: Bool {
        return self == .meanApogee || self == .oscuApogee
    }
    
    /// Returns true if this is an asteroid
    public var isAsteroid: Bool {
        return [.ceres, .pallas, .juno, .vesta].contains(self)
    }
    
    /// Returns true if this is a centaur
    public var isCentaur: Bool {
        return [.chiron, .pholus].contains(self)
    }
}

// MARK: CelestialBody Conformance

extension Planet: CelestialBody {
    public var value: Int32 { rawValue }
}
