# Repetier Server for RPi

### Installation

```sh
$ docker run -it --device /dev/ttyUSB0 -v /var/lib/Repetier-Server:/var/lib/Repetier-Server -p 3344:3344 -d negash/rpi-repetier-server
```
And you get Repetier Server on `:3344` port and saved data in `/var/lib/Repetier-Server`.

`--device /dev/ttyUSB0` - this is usb with 3D printer
