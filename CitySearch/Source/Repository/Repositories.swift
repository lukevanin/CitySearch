import Foundation

import SwiftPack


///
/// A geographical location on the earth
///
/// A coordinate is defined by two positions:
/// - Latitude: north to south, -90º to +90º, with 0º being at the equater.
/// - Longitude: east to west: 0º to 180º, with both being at the prime meridian
///
/// The specification for this structure is defined using JSON as follows:
///
/// ```
/// "coord":{
///     "lon": 34.283333,
///     "lat": 44.549999
/// }
/// ```
///
struct Coordinate: Equatable {
    
    // Longitude (-90...+90)
    let lon: Double
    
    // Latitude: (0...180)
    let lat: Double
}

extension Coordinate: Decodable {
    
}

extension Coordinate: DataCodable {
    init(decoder: DataDecoder) throws {
        self.init(
            lon: try Double(decoder: decoder),
            lat: try Double(decoder: decoder)
        )
    }
    
    func encode(encoder: DataEncoder) {
        lon.encode(encoder: encoder)
        lat.encode(encoder: encoder)
    }
}


///
/// A description of a city
///
/// Includes the name of the city, the country in which the city is location, the geopgraphical location where the
/// city is situated (presumably indicating the centre or major district), and a number that uniquely identifies
/// the city relative to others in a collection.
///
/// The specification for this structure is defined using JSON as follows:
///
/// ```
/// {
///     "country":"UA",
///     "name":"Hurzuf",
///     "_id":707860,
///     "coord":{
///         "lon":34.283333,
///         "lat":44.549999
///     }
/// }
/// ```
///
struct City: Equatable {
    
    /// Unique identifier
    let _id: UInt64
    
    /// Country
    let country: String
    
    /// Name of the city
    let name: String
    
    /// Geographic location of the city
    let coord: Coordinate
}

extension City: Decodable {
}

extension City: DataCodable {
    init(decoder: DataDecoder) throws {
        self.init(
            _id: try UInt64(decoder: decoder),
            country: try String(decoder: decoder),
            name: try String(decoder: decoder),
            coord: try Coordinate(decoder: decoder)
        )
    }
    
    func encode(encoder: DataEncoder) {
        _id.encode(encoder: encoder)
        country.encode(encoder: encoder)
        name.encode(encoder: encoder)
        coord.encode(encoder: encoder)
    }
}


///
/// Provides access to a collection of citiies.
///
/// The method used to provide cities depends on the implementation. Dor example, the implementation may
/// use a database, web service, or other means to supply information about cities.
///
protocol CitiesRepositoryProtocol {
    func searchByName(prefix: String) async -> AnyCollection<City>
}
