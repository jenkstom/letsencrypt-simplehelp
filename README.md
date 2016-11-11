Letsencrypt importer for SimpleHelp server.

This presumes you are on Linux and have openssl installed. Change
the following:

* server_name to your servername used
by letsencrypt (look in /etc/letsencrypt/live/ to see what it is).

* mypass to a random password used to protect keystores. You'll need
to put this into the server configuration at least once.

* shlocation to the install location for SimpleHelp.
