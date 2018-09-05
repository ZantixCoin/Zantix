Mac OS X Build Instructions and Notes
====================================
This guide will show you how to build zantixd (headless client) for OSX.

Notes
-----

* Tested on OS X 10.7 Yosemite through 10.13 High Sierra on 64-bit Intel processors only.
* Building with downloaded Qt binaries is not officially supported. See the notes in #7714
* All of the commands should be executed in a Terminal application. The
built-in one is located in `/Applications/Utilities/Terminal.app`.

Preparation
-----------
Install the macOS command line tools:

`xcode-select --install`

When the popup appears, click `Install`.

Then install [Homebrew](https://brew.sh).

Dependencies
----------------------

    brew install automake berkeley-db4 libtool boost miniupnpc openssl pkg-config protobuf python qt libevent qrencode

See [dependencies.md](dependencies.md) for a complete overview.

If you want to build the disk image with `make deploy` (.dmg / optional), you need RSVG

    brew install librsvg

Berkeley DB
-----------
    It is recommended to use Berkeley DB 4.8. If you have to build it yourself,
    you can use [the installation script included in contrib/](/contrib/install_db4.sh)
    like so

    ```shell
    ./contrib/install_db4.sh .
    ```

    from the root of the repository.

    **Note**: You only need Berkeley DB if the wallet is enabled (see the section *Disable-Wallet mode* below).

Build Zantix Core
    ------------------------

    1. Clone the Zantix Core source code and cd into `Zantix`

            git clone https://github.com/ZantixCoin/Zantix.git
            cd Zantix

    2.  Build Zantix Core:

        Configure and build the headless Zantix Core binaries as well as the GUI (if Qt is found).

        You can disable the GUI build by passing `--without-gui` to configure.

            ./autogen.sh
            ./configure
            make

    3.  It is recommended to build and run the unit tests:

            make check

    4.  You can also create a .dmg that contains the .app bundle (optional):

            make deploy


Running
-------

It's now available at `./src/zantixd`

Before running, it's recommended that you create an RPC configuration file.

Run `./zantixd` to get the filename where it should be put, or just try these
commands:

    echo -e "rpcuser=zantixrpc\nrpcpassword=$(xxd -l 16 -p /dev/urandom)" > "/Users/${USER}/Library/Application Support/Zantix/zantix.conf"
    chmod 600 "/Users/${USER}/Library/Application Support/Zantix/zantix.conf"

The next time you run it, it will start downloading the blockchain, but it won't
output anything while it's doing this. This process may take several hours;
you can monitor its process by looking at the debug.log file, like this:

    tail -f $HOME/Library/Application\ Support/Zantix/debug.log

Other commands:
-------

    ./zantixd -daemon # Starts the zantix daemon.
    ./zantix-cli --help  # Outputs a list of command-line options.
    ./zantix-cli help    # Outputs a list of RPC commands when the daemon is running
