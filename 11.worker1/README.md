[koseki@mymac 11.worker1]$ vagrant snapshot worker-backup
This command was not invoked properly. The help for this command is
available below.

Usage: vagrant snapshot <subcommand> [<args>]

Available subcommands:
     delete
     list
     pop
     push
     restore
     save

For help on any individual subcommand run `vagrant snapshot <subcommand> -h`
        --[no-]color                 Enable or disable color output
        --machine-readable           Enable machine readable output
    -v, --version                    Display Vagrant version
        --debug                      Enable debug output
        --timestamp                  Enable timestamps on log output
        --debug-timestamp            Enable debug output with timestamps
        --no-tty                     Enable non-interactive output

[koseki@mymac 11.worker1]$ vagrant snapshot save worker-backup
==> default: Snapshotting the machine as 'worker-backup'...
==> default: Snapshot saved! You can restore the snapshot at any time by
==> default: using `vagrant snapshot restore`. You can delete it using
==> default: `vagrant snapshot delete`.

