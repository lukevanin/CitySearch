import Foundation

import TextIndex
import SwiftPack

extension CaseInsensitiveTextIndex: DataCodable where Index: DataCodable {
    
    func encode(encoder: DataEncoder) {
        index.encode(encoder: encoder)
    }
    
    init(decoder: DataDecoder) throws {
        self.init(try Index(decoder: decoder))
    }
}
