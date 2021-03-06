#!/usr/bin/env bash

set -e

mkdir -p ~/.vim/bundle/vim-tests/plugin ~/.vim/autoload

cat >> ~/.vim/bundle/vim-tests/plugin/vim_tests.vim <<"EOF"
function! vim_tests#main()
  echo "foo"
endfunction
EOF

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/junegunn/vim-easy-align.git ~/.vim/bundle/vim-easy-align

ln -s "/home/ubuntu/.vim/bundle/vim-easy-align" ~/vim-easy-align

curl -O https://raw.githubusercontent.com/igncp/environment/master/arch-linux/provision/vim-base.sh

sh vim-base.sh

rm -rf vim-base.sh

cat >> ~/.vimrc <<"EOF"
execute pathogen#infect()
filetype plugin indent on
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
EOF

cp ~/.vimrc ~/.vimrc_normal

cd ~/.vim/bundle/vim-easy-align

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
# cd vim-easy-align; sh ~/test.sh
cp ~/.vimrc_test ~/.vimrc
vim -c 'Vader! test/*' > /dev/null
EXIT_CODE=$?
cp ~/.vimrc_normal ~/.vimrc
exit $EXIT_CODE
EOF

rm -rf ~/setup_docker.sh
