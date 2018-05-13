Kevin-Cookbook
==============

A Chef Cookbook To Deploy Kevin on Linux Servers.


Usage
-----

1. Add the following recipes to your node run list.

```bash
{
    "run_list": [
        "recipe[kevin-cookbook::default]"
    ]
}
```

2. Also add the following attributes to the node.

```bash
{
    "mysql": {
        "install": true, // To install MySQL
        "create_db": true // To Create the DB
    },
    "app": {
        "branch": "master",
        "repository": "https://github.com/Clivern/Kevin.git",
        "fqdn": "xxx.xxx.x.xx", // Server Domain or IP
        "env": {
            "APP_KEY": "yxyxyxyxsydysyayysysysys",
            "DB_CONNECTION": "mysql",
            "DB_HOST": "127.0.0.1",
            "DB_PORT": "3306",
            "DB_DATABASE": "kevin",
            "DB_USERNAME": "root",
            "DB_PASSWORD": "root"
        }
    }
}
```

We recommend to install MySQL manually on the same server or other server. So

3. The node should be something like that:

```bash
{
    "name": "node-01",
    "chef_environment": "_default",
    "normal": {
        "tags": [

        ],
        "mysql": {
            "install": true, // To install MySQL
            "create_db": true // To Create the DB
        },
        "app": {
            "branch": "master",
            "repository": "https://github.com/Clivern/Kevin.git",
            "fqdn": "xxx.xxx.x.xx", // Server Domain or IP
            "env": {
                "APP_KEY": "yxyxyxyxsydysyayysysysys",
                "DB_CONNECTION": "mysql",
                "DB_HOST": "127.0.0.1",
                "DB_PORT": "3306",
                "DB_DATABASE": "kevin",
                "DB_USERNAME": "root",
                "DB_PASSWORD": "root"
            }
        }
    },
    "policy_name": null,
    "policy_group": null,
    "run_list": [
        "recipe[kevin-cookbook::default]"
    ]
}
```

4. Finally run the `chef-client` on your node.


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
