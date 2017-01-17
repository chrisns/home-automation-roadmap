# Roadmap
This roughly describes the roadmap (not in order) for automating my home

I'm trying to approach it with a BDD approach and will aim to document the requirements with [Gherkin style feature files](./Features)

## Cluster
- [ ] mixed x64, x86, arm docker swarm cluster (swarm over kubenetes only for native simplicity)
    - https://docs.docker.com/docker-cloud/apps/stack-yaml-reference/
- [x] resiliant and self recovering clustered mqtt
    - https://github.com/pinked/clustered-verneMQ
- [ ] pin zwave+rfxcom docker containers to hardware that supports it
    - docker swarm labels

## Components and interfaces
- [ ] magic mirror interface
- [ ] mobile interface
- [ ] surveillance camera recording
     - https://www.synology.com/en-uk/surveillance/7.2

## MQTT Integration
- [ ] zwave <-> mqtt
     - https://github.com/simook/zwave-mqtt-broker
- [ ] sonos <-> mqtt
     - https://github.com/jpmens/mqttwarn
     - https://github.com/jishi/node-sonos-http-api
- [ ] rfxcom <-> mqtt
     - https://github.com/Anton04/RFXcom-MQTT-bridge
     - https://github.com/leachj/mqtt-rfxcom
- [ ] lifx <-> mqtt
     - https://github.com/joshproehl/lifx-wrangler
     - https://github.com/stormboy/node-meem-lifx
     - https://github.com/hlfshell/lifx-mqtt
- [ ] alexa <-> mqtt
     - maybe node-red / openhab?
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
    

