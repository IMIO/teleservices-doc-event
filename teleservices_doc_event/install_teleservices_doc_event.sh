#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.

# installation path
install_path="/usr/lib/teleservices_doc_event"

echo "--- Install passerelle settings passerelle iA.Délib"
if [ ! -f "/etc/passerelle/settings.d/delib.py" ] || [ ! -s "/etc/passerelle/settings.d/delib.py" ]; then
  cp $install_path/passerelle/delib.py /etc/passerelle/settings.d/
fi

service passerelle restart

sudo -u hobo hobo-manage imio_indus_deploy --directory $install_path