# radarr-tak

## Snap Description
Canonical Snap for Radarr Release 5.9.1.9070+\
https://snapcraft.io/radarr-tak

## Radarr Description
Radarr is a movie collection manager for Usenet and BitTorrent users.\
It can monitor multiple RSS feeds for new movies and will interface
with clients and indexers to grab, sort, and rename them.
It can also be configured to automatically upgrade the quality
of existing files in the library when a better quality format becomes
available. Note that only one type of a given movie is supported.
If you want both an 4k version and 1080p version of a given movie
you will need multiple instances.

See https://radarr.video for more details.

## Information

The web interface is accessible by default at http://localhost:7878

Radarr Release 5.9.1.9070+\
Core20 is still required for Radarr dependencies\
Service is restarted on any condition.

Post install commands required to access media folders and see resources :
```
sudo snap connect radarr-tak:removable-media
sudo snap connect radarr-tak:mount-observe
```
