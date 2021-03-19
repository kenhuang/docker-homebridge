FROM oznu/homebridge:latest

WORKDIR /defaults

# milight setup
#https://github.com/dotsam/homebridge-milight
RUN npm install homebridge-milight

# npm install homebridge-platform-wemo
RUN npm install homebridge-platform-wemo

# mi-ir-remote setup
#https://github.com/Zzm317/homebridge-mi-ir-remote
RUN npm install miio homebridge-mi-ir-remote
RUN npm install miio --global

# https://github.com/YinHangCode/homebridge-mi-outlet
RUN npm install homebridge-mi-outlet

# homebridge-camera-ffmpeg setup
#https://github.com/KhaosT/homebridge-camera-ffmpeg
RUN apk add --no-cache ffmpeg
RUN npm install homebridge-camera-ffmpeg

# homebridge-yeelight setup (not working yet)
RUN npm install homebridge-yeelight

# homebridge-videodoorbell setup
#https://github.com/Samfox2/homebridge-videodoorbell
RUN npm install homebridge-videodoorbell

# Alexa version of homebridge
# https://github.com/oznu/docker-homebridge/issues/30
RUN npm install https://github.com/NorthernMan54/homebridge --global

# homebridge-mi-aqara setup
#https://github.com/YinHangCode/homebridge-mi-aqara
RUN npm install homebridge-mi-aqara

COPY defaults/startup.sh /defaults/startup.sh

WORKDIR /homebridge
