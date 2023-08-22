Flower Framework Documentation
==============================

Welcome to Flower's documentation. `Flower <https://flower.dev>`_ is a friendly federated learning framework.


Join the Flower Community
-------------------------

The Flower Community is growing quickly - we're a friendly group of researchers, engineers, students, professionals, academics, and other enthusiasts.

.. button-link:: https://flower.dev/join-slack
    :color: primary
    :shadow:

    Join us on Slack


Flower Framework
----------------

The user guide is targeted at researchers and developers who want to use Flower
to bring existing machine learning workloads into a federated setting. One of
Flower's design goals was to make this simple. Read on to learn more.

Tutorials
~~~~~~~~~

A learning-oriented series of federated learning tutorials, the best place to start.

.. toctree::
   :maxdepth: 1
   :caption: Tutorial

   tutorial-what-is-federated-learning
   tutorial-get-started-with-flower-pytorch
   tutorial-use-a-federated-learning-strategy-pytorch
   tutorial-build-a-strategy-from-scratch-pytorch
   tutorial-customize-the-client-pytorch

.. toctree::
   :maxdepth: 1
   :caption: Quickstart tutorials
   :hidden:

   tutorial-quickstart-pytorch
   tutorial-quickstart-tensorflow
   tutorial-quickstart-huggingface
   tutorial-quickstart-jax
   tutorial-quickstart-pandas
   tutorial-quickstart-fastai
   tutorial-quickstart-pytorch-lightning
   tutorial-quickstart-mxnet
   tutorial-quickstart-scikitlearn
   tutorial-quickstart-xgboost
   tutorial-quickstart-android
   tutorial-quickstart-ios

QUICKSTART TUTORIALS: :ref:`PyTorch <tutorial-quickstart-pytorch>` | :ref:`TensorFlow <tutorial-quickstart-tensorflow>` | :ref:`🤗 Transformers <tutorial-quickstart-huggingface>` | :ref:`JAX <tutorial-quickstart-jax>` | :ref:`Pandas <tutorial-quickstart-pandas>` | :ref:`fastai <tutorial-quickstart-fastai>` | :ref:`PyTorch Lightning <tutorial-quickstart-pytorch-lightning>` | :ref:`MXNet <tutorial-quickstart-mxnet>` | :ref:`scikit-learn <tutorial-quickstart-scikitlearn>` | :ref:`XGBoost <tutorial-quickstart-xgboost>` | :ref:`Android <tutorial-quickstart-android>` | :ref:`iOS <tutorial-quickstart-ios>`

.. grid:: 2

  .. grid-item-card::  PyTorch

    ..  youtube:: jOmmuzMIQ4c
       :width: 100%

  .. grid-item-card::  TensorFlow

    ..  youtube:: FGTc2TQq7VM
       :width: 100%

How-to guides
~~~~~~~~~~~~~

Problem-oriented how-to guides show step-by-step how to achieve a specific goal.

.. toctree::
   :maxdepth: 1
   :caption: How-to guides

   how-to-install-flower
   how-to-configure-clients
   how-to-use-strategies
   how-to-implement-strategies
   how-to-aggregate-evaluation-results
   how-to-save-and-load-model-checkpoints
   how-to-monitor-simulation
   how-to-configure-logging
   how-to-enable-ssl-connections
   how-to-upgrade-to-flower-1.0

.. toctree::
   :maxdepth: 1
   :caption: Legacy example guides

   example-walkthrough-pytorch-mnist
   example-pytorch-from-centralized-to-federated
   example-mxnet-walk-through
   example-jax-from-centralized-to-federated
   example-fedbn-pytorch-from-centralized-to-federated

Explanations
~~~~~~~~~~~~

Understanding-oriented concept guides explain and discuss key topics and underlying ideas behind Flower and collaborative AI.

.. toctree::
   :maxdepth: 1
   :caption: Explanations

   explanation-federated-evaluation
   explanation-differential-privacy

References
~~~~~~~~~~

Information-oriented API reference and other reference material.

.. toctree::
   :maxdepth: 2
   :caption: API reference

   ref-api-flwr
   ref-api-cli

.. toctree::
   :maxdepth: 1
   :caption: Reference docs

   ref-example-projects
   ref-telemetry
   ref-changelog
   ref-faq


Contributor Guide
-----------------

The Flower authors welcome external contributions. The following guides are
intended to help along the way.

.. toctree::
   :maxdepth: 1
   :caption: Contributor guide

   first-time-contributors
   getting-started-for-contributors
   good-first-contributions
   recommended-env-setup
   contributor-setup
   write-documentation
   architecture
   secagg
   release-process
   creating-new-messages
   devcontainer
   fed/index


.. Indices and tables
.. ------------------

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
