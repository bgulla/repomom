# Repomom
```
 ____                  __  __                 
|  _ \ ___ _ __   ___ |  \/  | ___  _ __ ___  
| |_) / _ \ '_ \ / _ \| |\/| |/ _ \| '_ ` _ \ 
|  _ <  __/ |_) | (_) | |  | | (_) | | | | | |
|_| \_\___| .__/ \___/|_|  |_|\___/|_| |_| |_|
          |_|                                 
```

## What is `repomom`?
`repomom` is a quick and dirty way to pull down an entire yum-repo for local-hosting or airgap preparation. It is best used for ad-hoc or `cron` based scheduling.

## How to use?
`repomom` fires up a centos container and performs a `reposync` action on any repos that are listed in the `REPO_NAMES` environment variable. Note: if you would like to include yum repos that are not included in default `centos:7` container image, then mount any neccessary `.repo` files in the container's `/etc/yum.repos.d/` directory. All data will live in `/data` directory of the container, so be sure to mount something to grab the bits.

```bash
nerdctl run --rm \
  -v ${PWD}/data:/data \
  -v ${PWD}/rancher-rke2.repo:/etc/yum.repos.d/rancher-rke2.repo \
  -e "REPO_NAME=rancher-rke2-common-latest,rancher-rke2-1-18-latest" \
  -t bgulla/reposync
```

## TODO
* cicd via drone
* SUSE/SLES support
* Ubuntu support
* Add flag to pull down any dependencies with pkgs