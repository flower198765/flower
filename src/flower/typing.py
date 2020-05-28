# Copyright 2020 Adap GmbH. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
"""Flower type definitions."""


from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple

import numpy as np

Weights = List[np.ndarray]


@dataclass
class Parameters:
    """Model parameters."""

    tensors: List[bytes]
    tensor_type: str


@dataclass
class ParametersRes:
    """Response when asked to return parameters."""

    parameters: Parameters


FitIns = Tuple[Parameters, Dict[str, str]]  # model parameters, config
FitRes = Tuple[
    Parameters, int, int, float
]  # model parameters, num_examples_processed, num_examples_ceil, fit_duration
EvaluateIns = Tuple[Parameters, Dict[str, str]]  # model parameters, config
EvaluateRes = Tuple[int, float, Optional[float]]  # num_examples, loss, accuracy
