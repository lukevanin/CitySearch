import Foundation

import TextIndex
import SwiftPack

extension CaseInsensitiveTextIndex: DataCodable where Index: DataCodable {
    
    public func encode(encoder: DataEncoder) {
        index.encode(encoder: encoder)
    }
    
    public init(decoder: DataDecoder) throws {
        self.init(try Index(decoder: decoder))
    }
}
