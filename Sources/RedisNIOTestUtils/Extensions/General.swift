//===----------------------------------------------------------------------===//
//
// This source file is part of the RedisNIO open source project
//
// Copyright (c) 2019 RedisNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of RedisNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import NIO

private let allocator = ByteBufferAllocator()

extension String {
    /// The UTF-8 byte representation of the string.
    public var bytes: [UInt8] { return .init(self.utf8) }
    
    /// Creates a `NIO.ByteBuffer` with the string's value written into it.
    public var byteBuffer: ByteBuffer {
        var buffer = allocator.buffer(capacity: self.count)
        buffer.writeString(self)
        return buffer
    }
}