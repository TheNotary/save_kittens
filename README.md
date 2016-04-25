## README

## Deployment instructions

### System Dependency Guide (debian based)

```
$  apt-get install memcached
```

### App Notes
The app forces ssl, run two instances of thin, one ssl mode on port 443, and the other non-ssl on port 80.  The non-ssl connection will be upgraded.

Don't forget to precompile the assets.  Due to memory limits, you'll need to enable the swapfile, https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-12-04

    $  RAILS_ENV=production rake assets:precompile

    $  RAILS_ENV=production thin start -p 80 -P /tmp/non_ssl_pid -d
    $  RAILS_ENV=production thin start -p 443 --ssl -d

    $  cd ~/dev/fayecom; forever start app.js

On first boot, the app will run the initializers/populate_database.rb code to make the user.  This only runs if the users table exists, and if there are 0 users in that table.  Now that binstubs is around, this can mess with my bootup script, so you might need to manually invoke the function populate_database after you clear out the users table.

## Getting Started

```
$  cp config/application.yml.example config/application.yml
$  # setup the configurations in your new application.yml file
```




## Testing
Start fayecom in a terminal and run rake

    $  forever start `which fayecom`
    $  rake # in second terminal

    $  forever stop 0  # this shuts down the websocket server


Tests run faster with fayecom running (they need to wait for a timeout otherwise)
