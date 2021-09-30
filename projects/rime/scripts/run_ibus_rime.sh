#!/bin/bash

set -e

# This script takes around 10 minutes when running from scratch with the option
# `--all`

cat > /tmp/ibus_rime_debug.sh <<"EOF"
#!/bin/bash

set -e

sudo pacman -R ibus-rime --noconfirm || true
sudo pacman -R librime --noconfirm || true

sudo rm -f /usr/lib/librime*

if [[ "$*" == *"--all"* ]]; then
  if [[ "$*" == *"--debug"* ]]; then
    echo "Removing debug"
    rm -rf librime/debug
  else
    echo "Removing build"
    rm -rf librime/build
  fi
fi

if [[ "$*" == *"--debug"* ]]; then
  echo "Installing debug librime"
  (cd librime && make debug)
  (cd librime && sudo make install-debug)
else
  echo "Installing normal librime"
  (cd librime && make release)
  (cd librime && sudo make install)
fi

if [[ "$*" == *"--debug"* ]]; then
  sudo cp librime/debug/lib/* /usr/lib/
else
  sudo cp librime/build/lib/* /usr/lib/
fi

if [[ "$*" == *"--debug"* ]]; then
  echo "Removing debug"
  rm -rf debug
else
  echo "Removing build"
  rm -rf build
fi

make ibus-engine-rime
sudo make install

killall ibus-daemon || true

ibus-daemon -rx -v # This avoids running it as a daemon, and also includes the `-v` flag for verbose
EOF

chmod +x /tmp/ibus_rime_debug.sh

CMD="bash /tmp/ibus_rime_debug.sh $@"

echo "Command: $CMD"

tmux split-window "$CMD"
