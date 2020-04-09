#!/bin/bash
set -e
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/../

isort --skip src/flower/proto --skip src/flower_benchmark --skip src/flower_example --skip src/flower_ops --check-only -rc src && echo "- isort:  done" &&
black --exclude "src\/(flower\/proto|flower_benchmark|flower_example|flower_ops)" --check src                                  && echo "- black:  done" &&
mypy src                                                                                                                       && echo "- mypy:   done" &&
pylint --ignore=src/flower/proto src/flower src/flower_tool                                                                    && echo "- pylint: done" &&
pytest src/flower src/flower_tool                                                                                              && echo "- pytest: done" &&
echo "- All Python checks passed"
