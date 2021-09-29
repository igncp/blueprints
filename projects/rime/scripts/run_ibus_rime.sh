#!/bin/bash

set -e

cat > /tmp/ibus_rime_debug.sh <<"EOF"
#!/bin/bash

set -e

(cd librime && make release)
(cd librime && sudo make install)

make ibus-engine-rime
sudo make install

killall ibus-daemon || true

ibus-daemon -rx -v # This avoids running it as a daemon, and also includes the `-v` flag for verbose
EOF

chmod +x /tmp/ibus_rime_debug.sh

tmux split-window "sh /tmp/ibus_rime_debug.sh"
