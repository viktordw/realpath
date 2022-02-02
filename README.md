# realpath
Način za dobijanje apsolutne putanje do skripti.

Izlaz komande:

```
user@USER:~/realpath$ pwd
/home/user/realpath
user@USER:~/realpath$ ls
includes  README.md  script.sh
user@USER:~/realpath$ ./script.sh
==================================================
Trenutna putanja je:
  /home/user/realpath
Putanja do glavnog fajla je:
  /home/user/realpath/script.sh
Putanja do skripte hello je:
  /home/user/realpath/includes/hello.sh
==================================================
```
