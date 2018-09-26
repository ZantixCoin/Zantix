## Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git
brew install git

# Remove any old qt5 lingering around
brew uninstall qt5

# Make sure we have the C libs we need
brew install boost@1.60 pkg-config automake

# Install some deps
brew install qt@5.5 protobuf miniupnpc openssl qrencode berkeley-db4 zlib libevent librsvg libtool python zmq

# Make sure our stuff is linked in our path
brew link automake autoconf
brew link qt@5.5 --force
brew link boost@1.60 --force
