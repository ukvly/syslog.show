# The Syslog Podcast

![Upload](https://github.com/ukvly/syslog.show/workflows/Upload/badge.svg)

This repository contains the Jekyll sources for the Syslog podcast.

## Uploading

Every commit merged into master will upload automatically to
[syslog.show](https://syslog.show/).

Manual uploads can be done via the upload script. Generate one using:

```sh
% nix-build ./nix/release.nix -A upload
```

Then you can upload to a SFTP server using:

```sh
% ./result/bin/upload user password a.host.name
```

