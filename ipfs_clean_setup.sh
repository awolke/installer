#!/bin/sh
#-----------------------------------------------------------------------------
# Example install IPFS on baremetal Ubuntu 14.04
#
# The author DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL the author BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#-----------------------------------------------------------------------------
cd ~

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install npm -y

cd /usr/local/
wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
sudo tar -xzf go1.4.2linux-amd64.tar.gz

sudo echo "export PATH=$PATH:/usr/local/go/bin">> /etc/profile

sudo echo export "GOROOT=/usr/local/go">> ~/.bashrc
sudo echo export "export GOPATH=$HOME/go">> ~/.bashrc
sudo echo export "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin">> ~/.bashrc

# --- Install IPFS via GO
go get -u github.com/ipfs/go-ipfs/cmd/ipfs

# /etc/ssh/sshd_config
# GatewayPorts yes
# GatewayPorts clientspecified
