# upgrade
apt-get update -y
apt-get upgrade -y

# install rvm
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -s https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
# \curl -sSL https://get.rvm.io | bash -s stable
# source /etc/profile.d/rvm.sh
# wget https://github.com/ruby/ruby/commit/801e1fe46d83c856844ba18ae4751478c59af0d1.diff -O openssl.patch
# rvm install --patch ./openssl.patch 2.2.3

# install openshift ruby
# rvm install ruby-2.0.0-p645 --patch ./openssl.patch

# install ruby dependencies
apt-get install -y patchutils git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# remove unuse package
apt-get -y autoremove

# install rbenv
sudo -H -u vagrant bash -i -c "
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
sudo chown -R vagrant:vagrant ~/.rbenv
echo 'export PATH=\"\$HOME/.rbenv/bin:\$PATH\"' >> ~/.bashrc
echo 'eval \"\$(rbenv init -)\"' >> ~/.bashrc
source ~/.bashrc


# install rbenv plugins
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH=\"\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH\"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash


# downlaod patch and remove Changlog entry
wget https://github.com/ruby/ruby/commit/801e1fe46d83c856844ba18ae4751478c59af0d1.diff -O openssl.patch
filterdiff -x a/ChangeLog <./openssl.patch | tee openssl.patch


# install ruby via rbenv
rbenv install --patch 2.2.3 < ./openssl.patch
rbenv global 2.2.3
ruby -v


# install openstack ruby
rbenv install --patch 2.0.0-p645 < ./openssl.patch

# tell Rubygems not to install the documentation for each package locally
echo \"gem: --no-ri --no-rdoc\" > ~/.gemrc

# install bundler gem
gem install bundler

# delete ruby patch file
rm ./openssl.patch
"
# thank to https://gorails.com/setup/ubuntu/14.04 for ruby install step

# thank to https://github.com/npm/npm/issues/7308#issuecomment-84214837
echo "alias npm='npm --no-bin-links'" >> /home/vagrant/.bashrc