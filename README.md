# Manifesto/Why

My principal here is things being open makes them better.

At the same time, privacy is important to me, not because I have anything I specifically want to hide, but because I think it is important 

I think buying things from the likes of Nest, Canary, Ring, Hive while they all build wonderful products, they work wonderfully, and are demonstrations of incredible innovation, they are not built with privacy, they incite a *"Works with X"* attitude.

I have a myriad of 'things', bathroom scales, ovens, coffee machine, hob, cameras, lights, laptops, phones, vacuum cleaner, thermostats, burglar alarm, temperature/humidity sensors, motion sensors, door sensors, light sensors and many more.

I want to be able to use all those things beyond the life span their manufacturer decides to support the cloud service that accomponies them.

Realistically its just not feasible to expect to be able to buy a product for under £100 that will benefit from reliable availability, security updates, general maintenance and maybe even a feature or integration for very long.

I want to own a thermostat that will last for 30+ years, possibly outlive me!

I want to not have a phone home screen full of icons and have to scroll endlessly when I just want to turn a light down.

I want to know a thing I just bought will still work if the company that made it releases a new shiny version they'd like me to upgrade to.

This will be my journey to try and abstract, secure, isolate, and automate my home.

I've decided to abstract everything I can to MQTT, I've currently gone with the AWS-IOT implementation because I like how its formalised the pattern of 'things' scalability, persistence, that said it definitely has its limitations (such as 4kb payload size) which don't help. And it does ultimately mean a subscription. However, Lambda (especially locally with Greengrass) are strong winners.

My devices, servers and things should be treated like cattle, note pets. So I try to avoid persistence where possible, and when I do need it, I have gone to s3 knowing that there are open alternatives I could migrate to if I needed to.

This unfortunately isn't something for the masses to try, it's proving to be a very up hill battle, if I considered the value of time, pragmatically I could easily afford all the subscriptions of other suppliers, but that's not the point of this project.

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
- [x] interm host based replicated volume storage
    - gluster
- [x] resiliant and self recovering clustered mqtt
    - https://github.com/pinked/clustered-verneMQ
- [x] ingress DNS based controller
    - https://github.com/pinked/infra
- [x] https on ingress
    - http://api.heartinternet.co.uk/api2.html#uid-d--dns-commands--update-dns
    - https://github.com/Neilpang/acme.sh
    - https://github.com/hamburml/docker-flow-letsencrypt
    - https://customer.heartinternet.uk/manage/api
- [x] CI/CD
    - https://github.com/pinked/clustered-drone
    - [x] external access via localtunnel.me
    - [x] application firewall/naxsi between localtunnel.me and drone to verify its a valid request from github
      - https://github.com/chrisns/localtunnel-whitelisted
    - [x] drone doing deploys to the swarm
    - [x] drone volume persistence in swarm [blocked by no gluster]
- [x] pin zwave+rfxcom docker containers to hardware that supports it
    - docker swarm labels

## Components and interfaces
- [ ] magic mirror interface
- [ ] mobile interface
- [x] surveillance camera recording
     - https://www.synology.com/en-uk/surveillance/7.2

## MQTT Integration
- [ ] MQTT testing
     - https://github.com/mcollina/mosca/wiki/Mosca-advanced-usage#--nothing
- [x] IP Presence > mqtt
     - ~~https://github.com/chrisns/ifttt-ip-presence~~
- [x] Phone location > mqtt
     - http://owntracks.org
- [x] Phone location events > mqtt
     - http://owntracks.org
- [ ] Find my iphone < mqtt
     - https://github.com/matt-kruse/find-my-iphone
     - https://hub.docker.com/r/rossdargan/findwifesphone/
- [x] zwave <-> mqtt
     - using domoticz for the minute
     - https://github.com/simook/zwave-mqtt-broker
     - https://github.com/chrisns/iot-zwave
- [x] sonos <-> mqtt
     - ~~https://github.com/jpmens/mqttwarn~~ - couldn't use mqttwarn because doesn't support shared subscriptions so doesn't scale
     - https://github.com/pinked/rules_engine
     - https://github.com/jishi/node-sonos-http-api
- [ ] rfxcom <-> mqtt
     - https://github.com/Anton04/RFXcom-MQTT-bridge
     - https://github.com/leachj/mqtt-rfxcom
- [x] weather > mqtt
     - https://github.com/pinked/darksky-poller-mqtt
- [ ] lifx <-> mqtt
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
- [x] alarm <-> http proof of concept
     - https://github.com/barcar/visonic_control
- [x] alarm <-> mqtt
     - couldn't get RS232 port to work so refactored an integration using the hosted visonic go / power manage service https://github.com/chrisns/visonic_control/tree/node_js_rewrite
     - ~~https://github.com/nlrb/com.visonic.powermax/tree/master/node_modules/powermax-api~~
     - ~~https://www.domoticaforum.eu/viewtopic.php?f=68&t=6581~~
     - ~~https://github.com/barcar/visonic_control~~
     - ~~https://github.com/DomotiGa/DomotiGa/blob/master/DomotiGa3/.src/CVisonic.class~~
     - ~~https://github.com/irekzielinski/PowerMaxAlarm~~
     - ~~https://domotiga.nl/projects/domotiga/wiki/Visonic~~
     - ~~http://www.domoticz.com/forum/viewtopic.php?f=38&t=11134~~
     - ~~https://www.domoticaforum.eu/viewtopic.php?f=68&t=7152&sid=82be8c37b9336ae49a43b14eadf33bd2&start=75#p65514~~
- [ ] logitech harmony <-> mqtt
     - https://github.com/maddox/harmony-api
- [x] mqtt -> time series reporting
     - influxdb
- [x] mqtt <-> rules
     - ~~openhab2~~
     - ~~node-red~~
     - ~~home-assistant.io~~
     - https://github.com/pinked/rules_engine/
- [x] mqtt <-> prowl notifications
     - https://github.com/pinked/rules_engine/
     - ~~https://github.com/jpmens/mqttwarn~~ - couldn't use mqttwarn because doesn't support shared subscriptions so doesn't scale
- [ ] withings > mqtt
     - maybe node-red / openhab?
- [x] (mobile) presence > mqtt
     - http://owntracks.org + Bluetooth 
     - IFTT
     - bluetooth
     - z-wave presence detectors
- [x] UI <-> MQTT
     - http://www.hivemq.com/demos/websocket-client/
     - https://github.com/edfungus/Crouton
- [x] Facebook messenger <-> MQTT
     - https://github.com/chrisns/mqtt-chatbot-bridge
     - ~~https://www.npmjs.com/package/fbmessenger~~
- [ ] Waterrower > MQTT
     - https://www.npmjs.com/package/node-waterrower
     - https://www.npmjs.com/package/waterrower
