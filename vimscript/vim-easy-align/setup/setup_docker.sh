#!/usr/bin/env bash

set -e

git clone https://github.com/junegunn/vim-easy-align.git

cd vim-easy-align

git reset --hard 12dd631

git clone https://github.com/junegunn/vader.vim.git
git clone https://github.com/tpope/vim-repeat

cat >> ~/.vimrc_test <<"EOF"
filetype off
set rtp+=vader.vim
set rtp+=vim-repeat
set rtp+=.
filetype plugin indent on
syntax enable
EOF

cat >> ~/test.sh <<"EOF"
# setup:
# cd vim-easy-align; sh ../test.sh
cp ~/.vimrc_test ~/.vimrc
vim -c 'Vader! test/*' > /dev/null
EOF
