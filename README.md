# docker-subsonic-centos

## Description
The latest Subsonic running on the latest Centos with full transcoding support

## Ports

Port  | Protocol | Purpose      |
----- | -------- | ------------ |
4444  | http     | web UI & API |


## Data
Uses the default /var/subsonic folder for data.

## User
Add the environmental variable SUBSONIC_USER to change the user the subsonic process runs as.
SUBSONIC_USER_UID specifies the UID of the user, and is optional.

## Example
```
docker run -d \
  -e SUBSONIC_USER=subsonic \
  -e SUBSONIC_USER_UID=10000 \
  -v '/var/subsonic:/var/subsonic' \
  -v '/vat/music:/mnt/music' \
  -p 4444:4444 \
  --name subsonic \
  lambdadriver/docker-subsonic-centos
```
