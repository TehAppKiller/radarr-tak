# radarr-tak

## Snap Description
Canonical Snap for Radarr Release 5+\
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

Radarr Release 5+\
Core20 is still required for Radarr dependencies\
Service is restarted on any condition.

Post install commands required to access media folders and see resources :
```
sudo snap connect radarr-tak:removable-media
sudo snap connect radarr-tak:mount-observe
```

## FAQ
### How to access /home folder ?
`removable-media` interface allows direct access to /media and /mnt folders\
Easiest way to access your /home folder is by adding a symlink to your /media folder:
```
sudo ln -s /home/<username> /media/home
```
You can now access your /home folder in the app through `/media/home`.

## Building
The snap requires Core20 for .NET Radarr source dependencies.
### Build from GitHub (Cannonical Launchpad automatized building)
[Canonical Launchpad build farm](https://snapcraft.io/docs/build-from-github) allows to compile for every port automaticaly.\
But **BEWARE**, the farm has not always last snapcraft version and may fail on some ports while it will work locally (w/ or w/o cross-compilation).
### Build locally
Go in base directory and build:
```
snapcraft -v
```
### Troubleshoot
To resolve problems, you may check [snapcraft documentation](https://snapcraft.io/docs).\
Easy resolution is often to perform a clean:
```
snapcraft clean
```
### Cross compilation with Core20
Cross compilation requires target architectures repositories to be able to find the snap's required packages.

Add target architecture sources (armhf, arm64):
```
sudo dpkg --add-architecture armhf
sudo dpkg --add-architecture arm64
```
Add package repository sources at end of sources.list.d:
```
sudo nano /etc/apt/sources.list.d/ubuntu.sources
```
You should notice `Architectures: amd64` added to the 2 original parts to avoid non-resolved ports\
(armhf and arm64 does not exist in http://archive.ubuntu.com/ubuntu ).\
Noble (Core24) and Focal (Core20) repositories are then added\
(armhf, arm64 and other different ports are in http://ports.ubuntu.com/ubuntu-ports ).
```
# This is the content of /etc/apt/sources.list.d/ubuntu.sources

# System repository (amd64 system here)
Types: deb
URIs: http://archive.ubuntu.com/ubuntu
Suites: noble noble-updates noble-backports
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
Architectures: amd64

Types: deb
URIs: http://security.ubuntu.com/ubuntu
Suites: noble-security
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
Architectures: amd64

# X-Compilation noble (armhf, arm64)
Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports
Suites: noble noble-updates noble-backports
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
Architectures: armhf arm64

Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports
Suites: noble-security
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
Architectures: armhf arm64

# X-Compilation focal (armhf, arm64)
Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports
Suites: focal focal-updates focal-backports focal-security
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
Architectures: armhf arm64
```
- [ ] TODO: Add library dependencies checking procedure
      
Build with:
```
snapcraft --enable-experimental-target-arch --target-arch=armhf --destructive-mode
snapcraft --enable-experimental-target-arch --target-arch=arm64 --destructive-mode
```
## Versionning
Versionning of the snap follows the exact same one from the source.\
If a re-build is needed, new build version appends source version with a '-v2' ; following builds increment this one '-v3', '-v4',... etc\
Even if not ideal, to simplify the management with snapcraft, re-build increment is based on current stable published version for now (i.e. there can be several different -v2 rc/beta/edge releases published ; but each stable release has a different version)
- [ ] TODO: Modifiy if there is a way with snapcraft to have build versionning and update with final version
