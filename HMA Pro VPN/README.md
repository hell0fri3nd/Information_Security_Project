# HideMyAss Pro VPN

## Installation
In order to install the vulnerable software, the download can be found at [this link](https://d1llq9kjmh5kle.cloudfront.net/HMA-Pro-VPN-macOS-3.3.0.3.dmg).
The application will open then the installer; a HMA account is needed: it is possibile to open a 7-day trial account in the [register page](https://www.hidemyass.com/it-it/downloads?AFFILIATE=98340).
Once the application is installed, it is only needed to sign in.
### Issues
Since the connection should be possible from the virtual machine to the host machine, a host-only network should be activated. For Virtualbox, [this guide](https://condor.depaul.edu/glancast/443class/docs/vbox_host-only_setup.html) explains how to do it.
## Exploit
The exploit is automated: the Bash script should be downloaded on the attacker machine (we tested it on a Kali machine); it will generate two files. Those files should be moved into the victim machine, the same where the HMA Pro VPN is installed, keeping them in the same folder: here the bash file should be executed.
Right after it, it will be possible to activate the VPN: the reverse shell will be visible on the Kali terminal.
