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
"""Flower type definitions"""


from collections.abc import Mapping
from typing import List, Tuple

import numpy as np

Weights = List[np.ndarray]

FitIns = Tuple[Weights, Mapping]  # weights, config
FitRes = Tuple[Weights, int]  # weights, num_examples
EvaluateIns = Tuple[Weights, Mapping]  # weights, config
EvaluateRes = Tuple[int, float]  # num_examples, loss
