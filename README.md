# Roadmap
This roughly describes the roadmap (not in order) for automating my home

I'm trying to approach it with a BDD approach and will aim to document the requirements with [Gherkin style feature files](./Features)

## Cluster
- [x] mixed x64, x86, arm docker swarm cluster (swarm over kubenetes only for native simplicity)
    - https://github.com/pinked/infra
    - https://docs.docker.com/docker-cloud/apps/stack-yaml-reference/
    - https://medium.com/@chanwit/cross-platform-hybrid-cloud-with-docker-ded000f792fb
- [ ] long term containerized volume on demand distributed + replicated persistence magic
    - https://github.com/djmaze/docker-gluster-cluster
    - https://github.com/aravindavk/glusterfs-rest
- [ ] interm host based replicated volume storage
    - gluster
- [x] resiliant and self recovering clustered mqtt
    - https://github.com/pinked/clustered-verneMQ
- [x] ingress DNS based controller
    - https://github.com/pinked/infra
- [ ] https on ingress
    - http://api.heartinternet.co.uk/api2.html#uid-d--dns-commands--update-dns
    - https://github.com/Neilpang/acme.sh
    - https://github.com/hamburml/docker-flow-letsencrypt
    - https://customer.heartinternet.uk/manage/api
- [ ] pin zwave+rfxcom docker containers to hardware that supports it
    - docker swarm labels

## Components and interfaces
- [ ] magic mirror interface
- [ ] mobile interface
- [ ] surveillance camera recording
     - https://www.synology.com/en-uk/surveillance/7.2

## MQTT Integration
- [ ] IP Presence > mqtt
     - https://github.com/chrisns/ifttt-ip-presence
- [ ] Phone location > mqtt
     - http://owntracks.org
- [ ] Find my iphone < mqtt
     - https://github.com/matt-kruse/find-my-iphone
     - https://hub.docker.com/r/rossdargan/findwifesphone/
- [ ] zwave <-> mqtt
     - https://github.com/simook/zwave-mqtt-broker
- [ ] sonos <-> mqtt
     - https://github.com/jpmens/mqttwarn
     - https://github.com/jishi/node-sonos-http-api
- [ ] rfxcom <-> mqtt
     - https://github.com/Anton04/RFXcom-MQTT-bridge
     - https://github.com/leachj/mqtt-rfxcom
- [x] lifx <-> mqtt
     - https://github.com/pinked/clustered-lifx-mqtt
       - https://github.com/joshproehl/lifx-wrangler
       - https://github.com/stormboy/node-meem-lifx
       - https://github.com/hlfshell/lifx-mqtt
- [ ] alexa <-> mqtt
     - maybe node-red / openhab?
     - https://github.com/arlogilbert/echo-sonos-apple-music
     - https://developer.amazon.com/blogs/post/Tx3828JHC7O9GZ9/Using-Alexa-Skills-Kit-and-AWS-IoT-to-Voice-Control-Connected-Devices
     - https://www.hackster.io/fileark/alexapi-mqtt-smart-hub-984dcf
- [ ] d-link <-> mqtt
     - https://github.com/bikerp/dsp-w215-hnap/wiki
- [ ] alarm decoder <-> mqtt
     - http://www.eyezon.com/?page_id=176
     - https://github.com/rjferguson21/envisalink-to-mqtt
     - https://github.com/dretay/mqtt-eyezon
- [ ] logitech harmony <-> mqtt
     - https://github.com/maddox/harmony-api
- [ ] mqtt -> time series reporting
     - for now rely on mqtt inbuilt logging, maybe push to elasticcache for querying?
- [ ] mqtt <-> rules
     - openhab2
     - node-red
     - home-assistant.io
- [ ] mqtt <-> prowl notifications
     - https://github.com/jpmens/mqttwarn
- [ ] mqtt <-> email notification
     - https://github.com/jpmens/mqttwarn
- [ ] withings > mqtt
     - maybe node-red / openhab?
- [ ] (mobile) presence > mqtt
     - IFTT
     - bluetooth
     - z-wave presence detectors
- [ ] UI <-> MQTT
     - http://www.hivemq.com/demos/websocket-client/
- [ ] Facebook messenger <-> MQTT
     - https://www.npmjs.com/package/fbmessenger
- [ ] Waterrower > MQTT
     - https://www.npmjs.com/package/node-waterrower
     - https://www.npmjs.com/package/waterrower