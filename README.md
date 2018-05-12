Kevin-Cookbook
==============

A Chef Cookbook To Deploy Kevin on Linux Servers.


Usage
-----

- Add the following recipes to your node run list.

```bash
{
    "run_list": [
        "recipe[kevin-cookbook::default]"
    ]
}
```

- Also add the following attributes to the node.

```bash
{
    "mysql": {
        "install": true, // To install MySQL
        "create_db": true // To Create the DB
    },
    "app": {
        "fqdn": "206.189.1.19" // Server Domain or IP
    }
}
```

We recommend to install MySQL manually on the same server or other server. So

- The node should be something like that:

```bash
{
    "name": "node-01",
    "chef_environment": "_default",
    "normal": {
        "tags": [

        ],
        "mysql": {
            "install": true,
            "create_db": true
        },
        "app": {
            "fqdn": "206.189.1.19"
        }
    },
    "policy_name": null,
    "policy_group": null,
    "run_list": [
        "recipe[kevin-cookbook::default]"
    ]
}
```

- Finally run the `chef-client` on your node.


Misc
====

Changelog
---------
Version 1.0.0:
```
Coming Soon :D
```

Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Kevin-Cookbook** is authored and maintained by [@clivern](http://github.com/clivern).
