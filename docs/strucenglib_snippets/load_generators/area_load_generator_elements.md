# StrucEngLib Server

The StrucEng Library features a server component to run FEA solvers on a remote host.
This simplifies configuration setup and increases execution speed as FEA computations are remotely executed.

## Running StrucEngLib Server
A server instance is deployed on ibkpika host. When connected to ETH network, browse [http://ibkpika.ethz.ch:8080/](http://ibkpika.ethz.ch:8080/) to access the server log.

[
![image](https://user-images.githubusercontent.com/2311941/213932152-da7c3f7e-8d11-403d-b5a7-00c9f6040f9a.png)](http://ibkpika.ethz.ch:8080/)

The server log shows remote computation status logs. You may access the log during remote computations to keep track of computation results.

## Connecting with StrucEngLibrary Plugin
In Rhino 3D, ensure to have latest strucenglib plugin version installed. Ensure to re-run `StrucEnglibInstallDependencies` command in Rhino to update all Python dependencies.

### Enable Remote Computations
Configure the remote server in _Settings Tab_. Set the remote server to endpoint `ws://ibkpika.ethz.ch:8080/api/compute`.

![image](https://user-images.githubusercontent.com/2311941/213937093-aed1cc52-7856-4e73-ae8a-637b4ea03b6a.png)


 Select _Execute on Remote Server_ and inspect or execute model. The FEA computation will then be executed on remote server.


 ![image](https://user-images.githubusercontent.com/2311941/206236821-20bd1d30-06cb-4fd0-94b9-c9b5c9c90b4d.png)

!!! note
    - You must be connected to ETH VPN to issue requests to the server (Wifi connection itself is not sufficient)

### Generated Code
Remote computations outsource Compas FEA `analyse_and_extract` invocations to the server. 
The following snippet is auto generated with Rhino 3D StrucEng Library Plugin.


```python
from compas_fea.structure import Structure
from strucenglib_connect import connect

mdl = Structure(name='Rahmen', path='C:\Temp')
# ...

# 1. Run locally
mdl.analyse_and_extract(software='abaqus', fields=[ 'sf', 'sm' ] )

# 2. or Run on Sever instead
mdl = connect.analyse_and_extract('ws://ibkpika.ethz.ch:8080/api/compute', mdl, software='abaqus',  fields=[ 'sf', 'sm' ])

# ...
```
Analyse_and_extract can either be executed locally (1.) or remotely (2.).
Remote and local invocations accept the same set of compas FEA parameters.

## Source Code
The server component is hosted on [GitHub](https://github.com/kfmResearch-NumericsTeam/Struc_Eng_Library_Server).

