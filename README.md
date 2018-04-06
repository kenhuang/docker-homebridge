# Docker Homebridge 

## Features

* Able to use Alexa control all the HomeKit supported lights
* Able to control IR device like Air conditioner, TV etc
* Able to control wifi enable RGB LED lights (MiLight)
* Able to review IP camera within iOS home app
* Able to trigger video door bell from iOS home app
* Able to control WeMo switch/motion sensor

## Quick Start

### Step 1
```shell
docker run \
  --net=host \
  --name=homebridge \
  -e HOMEBRIDGE_DEBUG=1 \
  -e HOMEBRIDGE_CONFIG_UI=1 \
  -e HOMEBRIDGE_CONFIG_UI_PORT=8888 \
  -e PUID=1000 -e PGID=1000 \
  -e TZ=Pacific/Auckland \
  -e PACKAGES=ffmpeg,openssh \
  -v /homebridge:/homebridge \
  kenhuang/docker-homebridge:latest
  
docker run \
  --net=host \
  --name=homebridge \
  -e HOMEBRIDGE_DEBUG=1 \
  -e HOMEBRIDGE_CONFIG_UI=1 \
  -e HOMEBRIDGE_CONFIG_UI_PORT=8888 \
  -e PUID=1000 -e PGID=1000 \
  -e TZ=Pacific/Auckland \
  -e PACKAGES=ffmpeg,openssh \
  -v /homebridge:/homebridge \
  kenhuang/docker-homebridge:raspberry-pi  
```

### Step 2

update /homebridge/config.json, [sample-config.json](https://github.com/kenhuang/docker-homebridge/blob/master/sample-config.json)

### Step 3 

restart container

### Step 4

add HomeBridge to iOS home app, check container logs get the QR code then add it as accessory in iOS home app 


<img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG67.jpeg" height="480" width="270"> <img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG68.jpeg" height="480" width="270">

<img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG69.jpeg" height="480" width="270"> <img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG72.jpeg" height="480" width="270">

<img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG70.jpeg" height="384" width="512">
<img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG71.jpeg" height="384" width="512">
<img src="https://raw.githubusercontent.com/kenhuang/docker-homebridge/master/images/IMG73.jpeg" height="384" width="512">

## Included plugins 
* homebridge-milight, https://github.com/dotsam/homebridge-milight
* homebridge-mi-ir-remote, https://github.com/Zzm317/homebridge-mi-ir-remote
* homebridge-mi-outlet, https://github.com/YinHangCode/homebridge-mi-outlet
* homebridge-camera-ffmpeg, https://github.com/KhaosT/homebridge-camera-ffmpeg
* homebridge-videodoorbell, https://github.com/Samfox2/homebridge-videodoorbell
* homebridge-platform-wemo, https://github.com/rudders/homebridge-platform-wemo
* Alexa version of homebridge, https://github.com/NorthernMan54/homebridge-alexa

## Gear list

* DLink cameras (DSC-700L, DSC-932L, DSC-942L, DSC-5020L)
* MiLight 
* XiaoMi Universal IR Remote Controller 
* WeMo Switch/Motion sensor
* Amazon echo
* Server(ubuntu16.04) or Raspberry pi 3 (Not tested yet)
* Apple TV(4th gen) or iPad running as HomeKit hub


## Usage

### start homebridge container
```shell
docker run \
  --net=host \
  --name=homebridge \
  -e PUID=<UID> -e PGID=<GID> \
  -e TZ=<timezone> \
  -v </path/to/config>:/homebridge \
  kenhuang/docker-homebridge

Example:  
docker run \
  --net=host \
  --name=homebridge \
  -e PUID=1000 -e PGID=1000 \
  -e TZ=Pacific/Auckland \
  -v /homebridge:/homebridge \
  kenhuang/docker-homebridge
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
for ChuangmiIRPlatform, you will need to find out the following information

* MIIO_TOKEN

    execute the following command inside the container to find out miio token
    ```shell
    docker exec -it homebridge sh
    miio --discover
    ```

* MI_LEARNED_CODE

    trigger MiLean switch on iOS then watch the container log to find out the IR command


### Camera
Check tested camera configuration here: https://github.com/KhaosT/homebridge-camera-ffmpeg/wiki/Tested-Configuration


### HomeKit Hub
* Make sure enable iCloud two factor authentication
* Turn off auto sleep for the HomeKit Hub device

