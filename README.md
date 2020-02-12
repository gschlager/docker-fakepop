# docker-fakepop
Docker image for [fakepop](https://packages.debian.org/jessie/fakepop).

> fakepop is a fake pop3 daemon. It returns always the same messages to all users, it does not care about usernames and passwords. All user/pass combinations are accepted.

[![](https://images.microbadger.com/badges/image/gschlager/fakepop.svg)](https://microbadger.com/images/gschlager/fakepop)

## How to use

* Create a directory which will contain the emails that *fakepop* should serve.
  ```bash
  mkdir ~/fake_emails
  ```

* Put all messages that you want *fakepop* to deliver in the `~/fake_emails` directory.\
  Some filenames are not considered as messages:
  - filenames begining with '.' (hidden files)
  - filenames begining with 'readme' (case insensitive)
  - filenames ending in '~' (backup files)

* Run *fakepop* by mounting your email directory. It will run as daemon in the background.
  ```bash
  docker run --rm -d --name fakepop -v ${PWD}:/etc/fakepop -p 127.0.0.1:110:110 gschlager/fakepop
  ```

* You can stop the daemon with
  ```bash
  docker stop fakepop
  ```

## Connecting to the POP3 server

* **Hostname**: localhost
* **Port**: 110
* **Username**: whatever you want
* **Password**: whatever you want
* **Connection security**: None

### Connecting from Discourse
You can connect from Discourse by changing the following site settings:
* disable `pop3_polling_ssl`
* disable `pop3_polling_openssl_verify`
* `pop3_polling_host`: localhost
* `pop3_polling_port`: 110
* `pop3 polling username`: whatever you want
* `pop3 polling password`: whatever you want
* enable `pop3_polling_enabled`
* enable `email_in`

Then create a group or category and configure an email address for it.
