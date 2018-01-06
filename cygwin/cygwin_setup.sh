mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
wget https://raw.githubusercontent.com/kou1okada/apt-cyg/master/apt-cyg
chmod +x apt-cyg
mv apt-cyg /bin
apt-cyg --version
apt-cyg -m http://ftp.iij.ad.jp/pub/cygwin update