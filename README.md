# SAP NetWeaver ABAP running on vagrant

SAP NetWeaver ABAP running on vagrant.

This automates the steps listed on [the SAP post](https://blogs.sap.com/2017/09/04/newbies-guide-installing-abap-as-751-sp02-on-linux/).

### Prerequisites

- 50GB hard disk space for installation and setup files.
- 8GB RAM (16GB recommended).
- A motherboard which allows Virtualization.
- VirtualBox (6.0.14+).
- Vagrant (2.2.6+).
- SAP NetWeaver trial (7.52 SP04+).
- Windows 10 (It probably works on Linux, but this guide focus on Windows).
- Time. Downloading and installing takes a few minutes.

See detailed setup below.

## Setup

### 1 - Install virtualbox

- Download and install [VirtualBox](https://www.virtualbox.org/).

### 2 - Install vagrant

Before installing vagrant, you will need to make sure Virtualization and Hyper-V are enabled in your computer. You can follow [this guide](https://mashtips.com/enable-virtualization-windows-10/) to enable it. Then:

- Install [vagrant](https://www.vagrantup.com/).
- Check You will probably need to restart your computer.

- Install disk size plugin by opening your terminal (in Windows <kbd>Win</kbd>+<kbd>X</kbd> then <kbd>I</kbd>): 
  - `vagrant plugin install vagrant-disksize`


### 3 - Download ABAP on vagrant latest release

- Download [ABAP on vagrant latest release](https://github.com/EduardoCopat/sap-nw-abap-vagrant/releases) and download latest zip. 
- Extract the zip (recommended: `C:/vagrant-netweaver`). 

### 4 - Download and extract NetWeaver trial

- SAP allows you to download trials at [developers.sap.com]( https://developers.sap.com/trials-downloads.html).
- I recommend you download the same version I used: [SAP NetWeaver AS ABAP Developer Edition 7.52 SP04](https://developers.sap.com/trials-downloads.html?search=SAP%20NetWeaver%20AS%20ABAP%20Developer%20Edition%207.52%20SP04).
- Extract from zip (11 parts, as of 7.52 SP04).
- Move extracted content to a `NW` folder where you downloaded ABAP on vagrant latest release (e.g.:`C:/vagrant-netweaver/NW`)

### 5 - Start your Virtual Machine with vagrant

- Open the terminal and go to your folder (e.g. `cd C:\git\sap-nw-abap-vagrant\`).
- Run `vagrant up`. This will download an Ubuntu VM ([bionic64](https://app.vagrantup.com/hashicorp)).
- Run `vagrant ssh` to connect to Vagrant VM.
- Run `sudo su` to get root priviliges.
- Run `cd /vagrant` to go to the mounted folder.
- Run `./prepare.sh`. This will install necessary dependencies and enable automation of installation.

### 6 - Install Netweaver

- Run `./nw_install.sh`. This may take a few minutes. It will automatically accept SAP license and programatically install SAP NetWeaver.
> If the screen stops output in PowerShell, click <kbd>Enter</kbd> to resume.
- The last message you should see is `Installation of NPL successful`.

### 7 - Connect to your SAP system via SAP Logon

- Open SAP Logon
  > If you don't have SAP logon, you need an S-User to download it: https://launchpad.support.sap.com/#/softwarecenter. Alternatively, connect with Abap Development Tools.
- Click to add a new system:
    - Connection type: `Custom application server`
    - Description: `NPL`
    - Application server: `localhost`
    - Instance Number: `00`
    - System ID: `NPL`
    - SAPRouter String: empty

- You can find the user list at `/NW/readme.html`:

| username  | client(s)  |  password  | description   | 
|---|---|---|---|---|
| DEVELOPER  | 001  |  Down1oad |  Developer User |   
|  BWDEVELOPER |  001 | Down1oad  | Developer User  |   
| DDIC  |  000/001 | Down1oad  | Data Dictionary User  |   
| SAP*  | 000/001  | Down1oad  |  SAP Administrator |   



- Follow the items 3 to 6 in [post-installation steps. Start at "ABAP License Key"](https://blogs.sap.com/2016/11/03/sap-nw-as-abap-7.50-sp2-developer-edition-to-download-consise-installation-guide/). Note that the password to login is Down1oad.



## Running again

In case you stopped your VM or rebooted your computer. Start again by:
- Run `vagrant up`.
- Connect using `vagrant ssh`.
- Run `sudo su`.
- Run `cd /vagrant`.
- Run `./run.sh`.

## Credits

Based on Tobias Hofmann's [sap-nw-abap-docker](https://github.com/tobiashofmann/sap-nw-abap-docker).


