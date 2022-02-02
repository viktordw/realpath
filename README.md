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

realpath.sh

```
#!/bin/bash

export SCRIPT=`realpath $0`
export SCRIPTPATH=`dirname $SCRIPT`

function divider () {
  printf '=%.0s' {1..50} && printf '\n'
}
source "${SCRIPTPATH}/includes/hello.sh"

divider
printf "Trenutna putanja je:\n  ${PWD}\n"
printf "Putanja do glavnog fajla je:\n  ${SCRIPT}\n"
hello
divider
```

includes/hello.sh

```
function hello () {
printf "Putanja do skripte hello je: \n  ${SCRIPTPATH}/includes/hello.sh\n"
}
```