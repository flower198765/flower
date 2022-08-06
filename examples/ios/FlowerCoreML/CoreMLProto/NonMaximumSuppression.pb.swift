// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: NonMaximumSuppression.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2018, Apple Inc. All rights reserved.
//
// Use of this source code is governed by a BSD-3-clause license that can be
// found in LICENSE.txt or at https://opensource.org/licenses/BSD-3-Clause

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

///
/// Non-maximum suppression of axis-aligned bounding boxes.
///
/// This is used primarily for object detectors that tend to produce multiple
/// boxes around a single object.  This is a byproduct of the detector's
/// robustness to spatial translation. If there are two or more bounding boxes
/// that are very similar to one another, the algorithm should return only a
/// single representative.
///
/// Similarity between two bounding boxes is measured by intersection-over-union
/// (IOU), the fraction between the area of intersection and area of the union.
/// Here is an example where the areas can be calculated by hand by counting glyphs::
///
///     +-------+                            +-------+
///     |       |                            |       |
///     |    +------+          +--+          |       +---+
///     |    |  |   |          |  |          |           |
///     +-------+   |          +--+          +----+      |
///          |      |                             |      |
///          +------+                             +------+
///                        Intersection         Union
///      IOU: 0.16      =       12       /       73
///
/// All IOU scores are fractions betwen 0.0 (fully disjoint) and 1.0 (perfect
/// overlap). The standard algorithm (PickTop) is defined as follows:
///
///  1. Sort boxes by descending order of confidence
///  2. Take the top one and mark it as keep
///  3. Suppress (mark it as discard) all boxes within a fixed IOU radius of the
///     keep box
///  4. Go to 2 and repeat on the subset of boxes not already kept or discarded
///  5. When all boxes are processed, output only the ones marked as keep
///
/// Before the algorithm, boxes that fall below the confidence threshold are
/// discarded.
struct CoreML_Specification_NonMaximumSuppression {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  /// Choose which underlying suppression method to use
  var suppressionMethod: CoreML_Specification_NonMaximumSuppression.OneOf_SuppressionMethod? = nil

  var pickTop: CoreML_Specification_NonMaximumSuppression.PickTop {
    get {
      if case .pickTop(let v)? = suppressionMethod {return v}
      return CoreML_Specification_NonMaximumSuppression.PickTop()
    }
    set {suppressionMethod = .pickTop(newValue)}
  }

  ///
  /// Optional class label mapping.
  var classLabels: CoreML_Specification_NonMaximumSuppression.OneOf_ClassLabels? = nil

  var stringClassLabels: CoreML_Specification_StringVector {
    get {
      if case .stringClassLabels(let v)? = classLabels {return v}
      return CoreML_Specification_StringVector()
    }
    set {classLabels = .stringClassLabels(newValue)}
  }

  var int64ClassLabels: CoreML_Specification_Int64Vector {
    get {
      if case .int64ClassLabels(let v)? = classLabels {return v}
      return CoreML_Specification_Int64Vector()
    }
    set {classLabels = .int64ClassLabels(newValue)}
  }

  ///
  /// This defines the radius of suppression. A box is considered to be within
  /// the radius of another box if their IOU score is less than this value.
  var iouThreshold: Double = 0

  ///
  /// Remove bounding boxes below this threshold.  The algorithm run-time is
  /// proportional to the square of the number of incoming bounding boxes
  /// (O(N^2)). This threshold is a way to reduce N to make the algorithm
  /// faster. The confidence threshold can be any non-negative value. Negative
  /// confidences are not allowed, since if the output shape is specified to be
  /// larger than boxes after suppression, the unused boxes are filled with
  /// zero confidence. If the prediction is handled by Core Vision, it is also
  /// important that confidences are defined with the following semantics:
  /// 
  ///   1. Confidences should be between 0 and 1
  ///   2. The sum of the confidences for a prediction should not exceed 1, but is
  ///      allowed to be less than 1
  ///   3. The sum of the confidences will be interpreted as the confidence of
  ///      any object (e.g. if the confidences for two classes are 0.2 and 0.4,
  ///it means there is a 60% (0.2 + 0.4) confidence that an object is
  ///present)
  var confidenceThreshold: Double = 0

  ///
  /// Set the name of the confidence input.
  ///
  /// The input should be a multi-array of type double and shape N x C. N is
  /// the number of boxes and C the number of classes. Each row describes the
  /// confidences of each object category being present at that particular
  /// location. Confidences should be nonnegative, where 0.0 means the highest
  /// certainty the object is not present.
  ///
  /// Specifying shape is optional.
  var confidenceInputFeatureName: String = String()

  ///
  /// Set the name of the coordinates input.
  ///
  /// The input should be a multi-array of type double and shape N x 4. The
  /// rows correspond to the rows of the confidence matrix. The four values
  /// describe (in order):
  ///
  ///  - x (center location of the box along the horizontal axis)
  ///  - y (center location of the box along the vertical axis)
  ///  - width (size of box along the horizontal axis)
  ///  - height (size of box on along the vertical axis)
  ///
  /// Specifying shape is optional.
  var coordinatesInputFeatureName: String = String()

  ///
  /// The iouThreshold can be optionally overridden by specifying this string
  /// and providing a corresponding input of type double. This allows changing
  /// the value of the parameter during run-time.
  ///
  /// The input should be a scalar double between 0.0 and 1.0. Setting it to 1.0
  /// means there will be no suppression based on IOU.
  var iouThresholdInputFeatureName: String = String()

  ///
  /// The confidenceThreshold can be optionally overridden by specifying this
  /// string and providing a corresponding input. This allows changing the
  /// value of the parameter during run-time, which can aid setting it just
  /// right for a particular use case.
  ///
  /// The input should be a scalar double with nonnegative value.
  var confidenceThresholdInputFeatureName: String = String()

  ///
  /// Set the name of the confidence output. The output will be the same type
  /// and shape as the corresponding input. The only difference is that the
  /// number of rows may have been reduced.
  ///
  /// Specifying shape is optional. One reason to specify shape is to limit
  /// the number of output boxes. This can be done is several ways:
  ///
  /// Fixed shape:
  /// The output can be pinned to a fixed set of boxes. If this number is larger
  /// than the number of boxes that would have been returned, the output is padded
  /// with zeros for both confidence and coordinates. Specifying a fixed shape
  /// can be done by setting either shape (deprecated) or allowedShapes set to
  /// fixedsize.
  ///
  /// Min/max:
  /// It is also possible to set both a minimum and a maximum. The same zero-padding
  /// as for fixed shape is applied when necessary. Setting min/max is done by defining
  /// two allowedShapes, where the first dimension uses a rangeofsizes defining lowerbound
  /// and upperbound.
  var confidenceOutputFeatureName: String = String()

  ///
  /// Set the name of the coordinates output. The output will be the same type
  /// and shape as the corresponding input. The only difference is that the
  /// number of rows may have been reduced.
  ///
  /// Specifying shape is optional. See confidence output for a more detailed
  /// description. Note that to achieve either fixed shape output or a
  /// constraint range of boxes, only one of confidence or coordinates need to
  /// set a shape. Both shapes are allowed to be defined, but in such case they
  /// have to be consistent along dimension 0.
  var coordinatesOutputFeatureName: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  ///
  /// Choose which underlying suppression method to use
  enum OneOf_SuppressionMethod: Equatable {
    case pickTop(CoreML_Specification_NonMaximumSuppression.PickTop)

  #if !swift(>=4.1)
    static func ==(lhs: CoreML_Specification_NonMaximumSuppression.OneOf_SuppressionMethod, rhs: CoreML_Specification_NonMaximumSuppression.OneOf_SuppressionMethod) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.pickTop, .pickTop): return {
        guard case .pickTop(let l) = lhs, case .pickTop(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      }
    }
  #endif
  }

  ///
  /// Optional class label mapping.
  enum OneOf_ClassLabels: Equatable {
    case stringClassLabels(CoreML_Specification_StringVector)
    case int64ClassLabels(CoreML_Specification_Int64Vector)

  #if !swift(>=4.1)
    static func ==(lhs: CoreML_Specification_NonMaximumSuppression.OneOf_ClassLabels, rhs: CoreML_Specification_NonMaximumSuppression.OneOf_ClassLabels) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.stringClassLabels, .stringClassLabels): return {
        guard case .stringClassLabels(let l) = lhs, case .stringClassLabels(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.int64ClassLabels, .int64ClassLabels): return {
        guard case .int64ClassLabels(let l) = lhs, case .int64ClassLabels(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  ///
  /// Pick the bounding box of the top confidence, suppress all within a radius.
  struct PickTop {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    ///
    /// Suppression is only done among predictions with the same label
    /// (argmax of the confidence).
    var perClass: Bool = false

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "CoreML.Specification"

extension CoreML_Specification_NonMaximumSuppression: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".NonMaximumSuppression"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pickTop"),
    100: .same(proto: "stringClassLabels"),
    101: .same(proto: "int64ClassLabels"),
    110: .same(proto: "iouThreshold"),
    111: .same(proto: "confidenceThreshold"),
    200: .same(proto: "confidenceInputFeatureName"),
    201: .same(proto: "coordinatesInputFeatureName"),
    202: .same(proto: "iouThresholdInputFeatureName"),
    203: .same(proto: "confidenceThresholdInputFeatureName"),
    210: .same(proto: "confidenceOutputFeatureName"),
    211: .same(proto: "coordinatesOutputFeatureName"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: CoreML_Specification_NonMaximumSuppression.PickTop?
        var hadOneofValue = false
        if let current = self.suppressionMethod {
          hadOneofValue = true
          if case .pickTop(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.suppressionMethod = .pickTop(v)
        }
      }()
      case 100: try {
        var v: CoreML_Specification_StringVector?
        var hadOneofValue = false
        if let current = self.classLabels {
          hadOneofValue = true
          if case .stringClassLabels(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.classLabels = .stringClassLabels(v)
        }
      }()
      case 101: try {
        var v: CoreML_Specification_Int64Vector?
        var hadOneofValue = false
        if let current = self.classLabels {
          hadOneofValue = true
          if case .int64ClassLabels(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.classLabels = .int64ClassLabels(v)
        }
      }()
      case 110: try { try decoder.decodeSingularDoubleField(value: &self.iouThreshold) }()
      case 111: try { try decoder.decodeSingularDoubleField(value: &self.confidenceThreshold) }()
      case 200: try { try decoder.decodeSingularStringField(value: &self.confidenceInputFeatureName) }()
      case 201: try { try decoder.decodeSingularStringField(value: &self.coordinatesInputFeatureName) }()
      case 202: try { try decoder.decodeSingularStringField(value: &self.iouThresholdInputFeatureName) }()
      case 203: try { try decoder.decodeSingularStringField(value: &self.confidenceThresholdInputFeatureName) }()
      case 210: try { try decoder.decodeSingularStringField(value: &self.confidenceOutputFeatureName) }()
      case 211: try { try decoder.decodeSingularStringField(value: &self.coordinatesOutputFeatureName) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if case .pickTop(let v)? = self.suppressionMethod {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    switch self.classLabels {
    case .stringClassLabels?: try {
      guard case .stringClassLabels(let v)? = self.classLabels else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 100)
    }()
    case .int64ClassLabels?: try {
      guard case .int64ClassLabels(let v)? = self.classLabels else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 101)
    }()
    case nil: break
    }
    if self.iouThreshold != 0 {
      try visitor.visitSingularDoubleField(value: self.iouThreshold, fieldNumber: 110)
    }
    if self.confidenceThreshold != 0 {
      try visitor.visitSingularDoubleField(value: self.confidenceThreshold, fieldNumber: 111)
    }
    if !self.confidenceInputFeatureName.isEmpty {
      try visitor.visitSingularStringField(value: self.confidenceInputFeatureName, fieldNumber: 200)
    }
    if !self.coordinatesInputFeatureName.isEmpty {
      try visitor.visitSingularStringField(value: self.coordinatesInputFeatureName, fieldNumber: 201)
    }
    if !self.iouThresholdInputFeatureName.isEmpty {
      try visitor.visitSingularStringField(value: self.iouThresholdInputFeatureName, fieldNumber: 202)
    }
    if !self.confidenceThresholdInputFeatureName.isEmpty {
      try visitor.visitSingularStringField(value: self.confidenceThresholdInputFeatureName, fieldNumber: 203)
    }
    if !self.confidenceOutputFeatureName.isEmpty {
      try visitor.visitSingularStringField(value: self.confidenceOutputFeatureName, fieldNumber: 210)
    }
    if !self.coordinatesOutputFeatureName.isEmpty {
      try visitor.visitSingularStringField(value: self.coordinatesOutputFeatureName, fieldNumber: 211)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CoreML_Specification_NonMaximumSuppression, rhs: CoreML_Specification_NonMaximumSuppression) -> Bool {
    if lhs.suppressionMethod != rhs.suppressionMethod {return false}
    if lhs.classLabels != rhs.classLabels {return false}
    if lhs.iouThreshold != rhs.iouThreshold {return false}
    if lhs.confidenceThreshold != rhs.confidenceThreshold {return false}
    if lhs.confidenceInputFeatureName != rhs.confidenceInputFeatureName {return false}
    if lhs.coordinatesInputFeatureName != rhs.coordinatesInputFeatureName {return false}
    if lhs.iouThresholdInputFeatureName != rhs.iouThresholdInputFeatureName {return false}
    if lhs.confidenceThresholdInputFeatureName != rhs.confidenceThresholdInputFeatureName {return false}
    if lhs.confidenceOutputFeatureName != rhs.confidenceOutputFeatureName {return false}
    if lhs.coordinatesOutputFeatureName != rhs.coordinatesOutputFeatureName {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CoreML_Specification_NonMaximumSuppression.PickTop: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = CoreML_Specification_NonMaximumSuppression.protoMessageName + ".PickTop"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "perClass"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.perClass) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.perClass != false {
      try visitor.visitSingularBoolField(value: self.perClass, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CoreML_Specification_NonMaximumSuppression.PickTop, rhs: CoreML_Specification_NonMaximumSuppression.PickTop) -> Bool {
    if lhs.perClass != rhs.perClass {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
