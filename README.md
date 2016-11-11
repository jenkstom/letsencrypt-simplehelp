Letsencrypt importer for SimpleHelp server.

This presumes you are on Linux and have openssl installed. Change
the following:

* server_name to your servername used
by letsencrypt (look in /etc/letsencrypt/live/ to see what it is).

* mypass to a random password used to protect keystores. You'll need
to put this into the server configuration at least once.

* shlocation to the install location for SimpleHelp.

## Instructions

You need to setup SimpleHelp and letsencrypt first. Add an autorenew
for letsencrypt to your crontab, then add the import_key_for_simplehelp.sh
script for a few minutes later.

The first time you run this script should be manually. Download the
keystore file from $shlocation/configuration/sslconfig/keystore. Then
upload it through the admin configuration screen and enter the password
used in the script ($mypass). Once it is loaded initially you should
be able to forget about it and let this script updated the keystore
via cron.

NOTE: The newer version (4.4) of the SimpleHelp server will support
letsencrypt certificates directly. So this is probably a temporary fix.


