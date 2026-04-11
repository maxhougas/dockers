# Vintage Story

## Help Text
```

Vintage Story Server 1.21.5
Copyright © 2016-2024 Anego Studios

  -v, --version                Print game version and exit

  -h, --help                   Print help info and exit

  -s, --standby                Don't fully launch server. Instead wait until the
                               first connection attempt before launching.

  --tracelog                   Print log also via Trace.WriteLine() to get it to
                               show up in the visual studio output window

  --append                     Do not overwrite log files

  --genconfig                  Generate a new default serverconfig.json and
                               exit. Warning, this deletes any existing config.

  --setconfig                  Set a config value and exit. Generates a
                               serverconfig.json if it doesn't exist. Use the
                               format --setconfig="{ key: 3, foo: 'value' }"

  --withconfig                 Can be used to override any config value.
                               Launches the server. Use the format
                               --withconfig="{ key: 3, foo: 'value' }"

  --dataPath                   Set a custom data path, default is
                               Environment.SpecialFolder.ApplicationData

  --logPath                    Default logs folder is in dataPath/Logs/. This
                               option can only set an absolute path.

  --addOrigin                  Tells the asset manager to also load assets from
                               this path

  --addModPath                 Tells the mod loader to also load mods from this
                               path

  --ip                         Bind server to given ip, overwrites configured
                               value (default: all ips)

  --port                       Bind server to given port, overwrites configured
                               value  (default: 42420)

  --maxclients                 Maximum quantity of clients to be connected at
                               the same time, overwrites configured value
                               (default 16)

  --reducedthreads             If specified, the server aims to use
                               approximately 20% fewer threads in total, where
                               possible, without greatly reducing performance

  --archiveLogFileCount        The Amount of logs to archive and keep. The
                               oldest will be deleted when a new archive is
                               created and the limit is exceeded (default: 5)

  --archiveLogFileMaxSizeMb    The max size (in MB) of a set of log files to be
                               archived. If it exceeds this value it will not be
                               archived. (default: 1024 MB)

  --help                       Display this help screen.

  --version                    Display version information.

```
