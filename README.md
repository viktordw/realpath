# realpath
### Način za dobijanje apsolutne putanje do skripti.

Pokretanje:

```
git clone https://github.com/viktordw/realpath.git
cd realpath/
chmod +x script.sh
```

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

Putanja do glavnog fajla se kalkuliše na sledeći način:

```
SCRIPT=`realpath $0`
```

### Kalkulacija putanje do spoljnih skripti

S obzirom na to da skripte koje su dodate u glavnu skriptu pomoću `source` komande imaju istu putanju, jer zapravo predstavljaju deo iste skripte, putanja do skripti u poddirektorijumima se dobija tako što se komandom `dirname` dobije naziv direktorijuma u kome se nalazi glavna skripta (u toj glavnoj skripti), a na dobijeni naziv direktorijuma se dodaje doslovni string sa putanjom (u spoljnoj skripti).

Ovaj proces funkcioniše tako što se prvo pronađe putanja do skripte sa `realpath $0`, a ta vrednost se koristi kao parametar na osnovu koga `dirname` pronalazi putanju do direktorijuma u kome se nalazi fajl koji se pokreće.

Varijabla u kojoj je ta vrednost sačuvana se eksportuje, kako bi bila dostupna u okviru čitavog okruženja.