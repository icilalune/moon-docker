#/bin/sh

/etc/init.d/apache2 start
/opt/graphite/bin/carbon-cache.py start
cd /opt/statsd ; node ./stats.js ./localConfig.js
