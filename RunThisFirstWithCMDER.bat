vagrant plugin install vagrant-hostsupdater

bash init.sh

ssh-keygen -t rsa -b 4096 -C "mastergrean@gmail.com" -f %HOMEDRIVE%%HOMEPATH%\.ssh\homestead -N ""

cp %HOMEDRIVE%%HOMEPATH%\.homestead\Homestead.yaml %HOMEDRIVE%%HOMEPATH%\.homestead\Homestead.yaml.bk

sed -i.bak "s/2048/1024/g;s/id_rsa/homestead/g;s/~\/Code/~\/Dropbox\/Private\/myscript\/deploy/g;0,/Code/s//deploy/;" %HOMEDRIVE%%HOMEPATH%\.homestead\Homestead.yaml

