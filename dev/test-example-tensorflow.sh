#!/bin/bash
set -e
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/../

echo "=== test-example-tensorflow.sh ==="

isort --check-only -rc src/flower_example/tf_fashion_mnist  && echo "- isort:  done" &&
black -q --check src/flower_example/tf_fashion_mnist        && echo "- black:  done" &&
# mypy is covered by test.sh
pylint src/flower_example/tf_fashion_mnist                  && echo "- pylint: done" &&
pytest -q src/flower_example/tf_fashion_mnist               && echo "- pytest: done" &&
echo "- All Python checks passed"
