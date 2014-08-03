:cd \Desktop
ftp -s:cygwin_setup.ftp
setup-x86_64.exe --root c:\cygwin --site http://ftp.iij.ad.jp/pub/cygwin/x86_64/ --local-package-dir %CD% --quiet-mode --packages git,git-completion,tar,bzip2,gawk,make,patch,openssl-devel,wget,mintty,openssh,rsync,screen,vim,zsh,gnupg
sh ~/Desktop/dotfiles-master/dotfilesLink.sh
notepad C:\cygwin64\etc\passwd
cd ~/Desktop
& './\Cygwin64 Terminal.lnk'