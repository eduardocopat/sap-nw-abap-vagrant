#/bin/bash

# Stop SAP with npladm user
/usr/sbin/uuidd
su -c "stopsap" npladm
