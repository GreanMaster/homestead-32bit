# upgrade
apt-get update -y
apt-get upgrade -y

# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -s https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
wget https://github.com/ruby/ruby/commit/801e1fe46d83c856844ba18ae4751478c59af0d1.diff -O openssl.patch
# rvm install --patch ./openssl.patch 2.2.3

# install openshift ruby
rvm install ruby-2.0.0-p645 --patch ./openssl.patch

# delete ruby patch file
rm ./openssl.patch

# install ruby bundler
gem install bundler