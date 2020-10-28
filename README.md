# packer-homer

A [packer](https://www.packer.io/) template to build an AMI running homer, postgresql and (optionally) influxdb and telegraf.  The base linux distro is Debian 9 (stretch).

## Installing 

```
$  packer build -color=false template.json
```

### variables
There are many variables that can be specified on the `packer build` command line; however defaults (which are shown below) are appropriate for building an "all in one" homer server that includes influxdb and telegraf.

```
"region": "us-east-1"
```
The region to create the AMI in

```
"ami_description": "homer monitoring"
```
AMI description.

```
"instance_type": "t2.medium"
```
EC2 Instance type to use when building the AMI.

```
"homer_user": "homer_user",
```
homer username

```
"homer_password": "XcapJTqy11LnsYRtxXGPTYQkAnI",
```
homer password -- it is strongly recommended that you pass a randomly generated password as a command line variable

```
"install_influxdb":  "yes"
```
change to an empty string if you do not want to install influxdb and telegraf.