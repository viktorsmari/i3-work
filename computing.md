# Computing / setup

Documenting custom setup

## Browsing

Firefox: switch between tabs when using scroll wheel.

In URL bar enter: `about:config`

Change:

`toolkit.tabbox.switchByScrolling = true`


### Audio

TODO: Ardour setup + Jack

LMMS?

### Video

#### OBS with a DSLR camera and Jitsi

Goal: Connect a Canon 550d camera via USB to a computer, send the signal to OBS and send OBS output to Jitsi.

Install if needed:

`sudo apt install -y obs-studio gphoto2 v4l2loopback v4l2loopback-dkms`

Clone and install:

https://github.com/umlaeute/v4l2loopback

Monitor dmesg output:

`dmesg -wT`

Load the kernel module for 2 devices, one for the camera, and one for sending

`sudo modprobe v4l2loopback video_nr=9 devices=2 card_label="Canon"`

2 new devices should now appear, nr 9 and another incremented from next available nr from 0

`ll /dev/video?`

Capture from Camera and send it to `/dev/video9`

`gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video9`

Use this to check camera abilities

`gphoto2 --abilities`


#### OBS sink plugin to output everything to a new /dev/video device

Follow the plugin setup instructions

https://github.com/umlaeute/v4l2loopback

In my case the plugin ended up in the wrong place, so I had to copy it to the correct OBS plugin folder.

`sudo cp /usr/lib/obs-plugins/v4l2sink.so /usr/lib/x86_64-linux-gnu/obs-plugins`

Start OBS with the terminal `obs` if you need to debug where the correct plugin folder is.

Start OBS, click *Tools* and select *v4l2sink*

### Imaging

#### Scanning

scanimage -x102 -y155 --mode=color --format=tiff  > image --resolution 200 --progress | convert - -quality 50 qual50.jpg
