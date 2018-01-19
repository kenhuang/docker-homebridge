# Docker Homebridge 

## Features

* Able to use Alexa control all the lights
* Able to control IR device like Air conditioner
* Able to control RGB LED lights (MiLight)
* Able to trigger video Door Bell

## Quick Start
TODO

![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG67.jpg)
![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG68.jpg)
![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG69.jpg)
![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG70.jpg)
![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG71.jpg)
![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG72.jpg)
![](https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG73.jpg)

## Installed plugins 
* homebridge-milight, https://github.com/dotsam/homebridge-milight
* homebridge-mi-ir-remote, https://github.com/Zzm317/homebridge-mi-ir-remote
* homebridge-camera-ffmpeg, https://github.com/KhaosT/homebridge-camera-ffmpeg
* homebridge-videodoorbell, https://github.com/Samfox2/homebridge-videodoorbell
* Alexa version of homebridge, https://github.com/NorthernMan54/homebridge-alexa

## Gear list

* DLink cameras (DSC-700L, DSC-932L, DSC-942L, DSC-5020L)
* MiLight 
* XiaoMi Universal IR Remote Controller 
* Amazon echo
* Server(ubuntu16.04) or Raspberry pi 3 (Not tested yet)


## Usage

### start homebridge container
```shell
docker run \
  --net=host \
  --name=homebridge \
  -e PUID=<UID> -e PGID=<GID> \
  -e TZ=<timezone> \
  -v </path/to/config>:/homebridge \
  kenhuang/homebridge

Example:  
docker run \
  --net=host \
  --name=homebridge \
  -e PUID=1000 -e PGID=1000 \
  -e TZ=Pacific/Auckland \
  -v /homebridge:/homebridge \
  kenhuang/homebridge  
```

### check homebridge container logs
```shell
docker logs -f homebridge
```

### run command in homebridge container
```shell
docker exec -it homebridge sh
```

## Configuration

### Example config
[sample-config.json](https://github.com/kenhuang/docker-homebridge/blob/master/sample-config.json)

### Alexa
Say "Alexa discovery devices" after start up the container, it should expose all the lights as Alexa supported devices

* Alexa, turn on the _______
* Alexa, turn off the _______
* Alexa, set ______ to number percent

### Siri

* Hey Siri, set Office Aircon to Off
* Hey Siri, set Office Aircon to Cool
* Hey Siri, set Office Aircon to ______ degree
* Hey Siri, turn on the ______
* Hey Siri, set ______ to number percent


### Trigger DoorBell
```shell
curl -X POST -d 'ding=dong&dong=ding' http://HOME_BRIDGE_IP:5005
```

### MI IR Remote
MIIO_TOKEN
execute the following command inside the container to find out miio token
```shell
miio --discover
```

MI_LEAN_COMMAND
trigger MiLean switch on iOS then watch the container log to find out the IR command


### Camera
Check tested camera configuration here: https://github.com/KhaosT/homebridge-camera-ffmpeg/wiki/Tested-Configuration




