#!/bin/sh
# MWG-C v1.4-1219

# create working directory & install prereqs
mkdir ~/mwgrinpool
 
cd ~/mwgrinpool
 
apt-get update
sudo apt-get install git
 
sudo apt-get install -y curl git cmake make zlib1g-dev pkgconf ncurses-dev libncursesw5-dev linux-headers-generic g++ libssl-dev
 
curl https://sh.rustup.rs -sSf | sh
 
source $HOME/.cargo/env

# Get the miner source code & build it
 
git clone https://github.com/mimblewimble/grin-miner.git
cd grin-miner
git submodule update --init

# Configure what to build
 
cat /proc/cpuinfo | grep avx2 | wc -l

# opt1: No avx2 support if it prints 0 but anything above 0 means it does support
 
sed -i 's/^plugin_name =.*/plugin_name = "cuckaroo_cpu_avx2_29"/' grin-miner.toml

# Build it
 
cargo build --release

# Configure miner to stratum.MWGrinPool.com
 
sed -i 's/stratum_server_addr.*/stratum_server_addr = "stratum.mwgrinpool.com:3333"/' grin-miner.toml

#Configure mining account---strong usrnm and psswrd
 
printf "\nUsername: " && read username && sed -i 's/.*stratum_server_login.*/stratum_server_login = "'$username'"/' grin-miner.toml
 
printf "\nPassword: " && read password && sed -i 's/.*stratum_server_password.*/stratum_server_password = "'$password'"/' grin-miner.toml
 
 # configure what to run & how many processors are available

grep -c ^processor /proc/cpuinfo

# don't choose all processors, might crash, recc 1-3 MAYBE 3-4
 
printf "\nNumber of Processors: " && read nthreads && sed -i 's/^nthreads.*/nthreads = '$nthreads'/' grin-miner.toml
 
# Start miner and verify its running, then check MWGrinPool stats

./target/release/grin-miner