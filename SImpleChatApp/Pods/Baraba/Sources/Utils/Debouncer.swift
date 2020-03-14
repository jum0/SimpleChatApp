//
// Debouncer.swift
//
// Copyright (c) 2020 Soojin Ro (https://github.com/nsoojin)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

internal class Debouncer {
    internal let delay: TimeInterval
    
    internal func schedule(block: @escaping () -> Void) {
        queue.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.workItem.cancel()
            
            let newItem = DispatchWorkItem(block: block)
            self.queue.asyncAfter(deadline: .now() + self.delay, execute: newItem)
            self.workItem = newItem
        }
    }
    
    internal init(queue: DispatchQueue = DispatchQueue.main, delay: TimeInterval) {
        self.queue = queue
        self.workItem = DispatchWorkItem(block: {})
        self.delay = delay
    }
    
    private let queue: DispatchQueue
    private var workItem: DispatchWorkItem
}
