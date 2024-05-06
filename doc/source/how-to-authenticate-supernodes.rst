Authenticate SuperNodes
=======================

Flower has built-in support for authenticated SuperNodes that you can use to verify the identities of each SuperNode connecting to a SuperLink.
Flower node authentication works similar to how GitHub SSH authentication works:

* SuperLink (server) stores a list of known (client) node public keys
* Using ECDH, both SuperNode and SuperLink independently derive a shared secret
* Shared secret is used to compute the HMAC value of the message sent from SuperNode to SuperLink as a token
* SuperLink verifies the token

You can find the complete code example demonstrating federated learning with Flower in an authenticated setting
`here <https://github.com/adap/flower/tree/main/examples/flower-client-authentication>`_.

.. note::
    This guide covers a preview feature that might change in future versions of Flower.

.. note::
    For increased security, node authentication can only be used when encrypted connections (SSL/TLS) are enabled.

Enable node authentication in :code:`SuperLink`
-----------------------------------------------

To enable node authentication, first you need to configure SSL/TLS connections to secure the SuperLink<>SuperNode communication. You can find the complete guide
`here <https://flower.ai/docs/framework/how-to-enable-ssl-connections.html>`_.
After configuring secure connections, you can enable client authentication in a long-running Flower :code:`SuperLink`.
Use the following terminal command to start a Flower :code:`SuperNode` that has both secure connections and node authentication enabled:

.. code-block:: bash

    flower-superlink
        --certificates certificates/ca.crt certificates/server.pem certificates/server.key
        --require-client-authentication ./keys/client_public_keys.csv ./keys/server_credentials ./keys/server_credentials.pub
    
Let's break down the :code:`--require-client-authentication` flag:

1. The first argument is a path to a CSV file storing all known node public keys. You need to store all known node public keys that are allowed to participate in a federation in one CSV file (:code:`.csv`).
2. The second and third arguments are paths to the server's private and public keys. For development purposes, you can generate a private and public key pair using :code:`ssh-keygen -t ecdsa -b 384`.

.. note::
    In Flower 1.9, there is no support for dynamically removing, editing, or adding known node public keys to the SuperLink.
    To change the set of known nodes, you need to shut the server down, edit the CSV file, and start the server again.
    Support for dynamically changing the set of known nodes is on the roadmap to be released in Flower 1.10 (ETA: June).


Enable node authentication in :code:`SuperNode`
-------------------------------------------------

Similar to the long-running Flower server (:code:`SuperLink`), you can easily enable node authentication in the long-running Flower client (:code:`SuperNode`).
Use the following terminal command to start an authenticated :code:`SuperNode`:

.. code-block:: bash
    
    flower-client-app client:app
        --root-certificates certificates/ca.crt
        --server 127.0.0.1:9092
        --authentication-keys ./keys/client_credentials ./keys/client_credentials.pub

The :code:`--authentication-keys` flag expects two arguments: a path to the node's private key file and a path to the node's public key file. For development purposes, you can generate a private and public key pair using :code:`ssh-keygen -t ecdsa -b 384`.


Security notice
---------------

The system's security relies on the credentials of the SuperLink and each SuperNode. Therefore, it is imperative to safeguard and safely store the credentials to avoid security risks such as Public Key Infrastructure (PKI) impersonation attacks.
The node authentication mechanism also involves human interaction, so please ensure that all of the communication is done in a secure manner, using trusted communication methods.


Conclusion
----------

You should now have learned how to start a long-running Flower server (:code:`SuperLink`) and client (:code:`SuperNode`) with node authentication enabled. You should also know the significance of the private key and store it safely to minimize security risks.
