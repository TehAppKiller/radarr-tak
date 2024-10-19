# radarr-tak
[![radarr-tak](https://snapcraft.io/radarr-tak/badge.svg)](https://snapcraft.io/radarr-tak)

## Snap Description
Canonical Snap for Radarr Release 5+\
https://snapcraft.io/radarr-tak

## Radarr Description
<img src="/icon.svg" width="100">
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

Radarr Release 5+\
Core20 is still required for dependencies\
Service is restarted on any condition.

Post install commands required to access media folders and see resources :
```
sudo snap connect radarr-tak:removable-media
sudo snap connect radarr-tak:mount-observe
```

Post install commands required to access home folder :
```
sudo snap connect radarr-tak:home
```
**!!! Files can only be written in a directory owned by 'root' !!!**\
This is due to current behavior and restrictions of snaps running as daemon by Canonical.

## FAQ
See my common doc about [FAQ](https://github.com/TehAppKiller/Snapcraft-common-doc/tree/main#FAQ).

## Building
The snap requires Core20 for .NET Radarr source dependencies.\
See my common doc about [building a snap](https://github.com/TehAppKiller/Snapcraft-common-doc/tree/main#Building).
## Versionning
See my common doc about [versionning](https://github.com/TehAppKiller/Snapcraft-common-doc/tree/main#Versionning).
