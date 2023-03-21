
This page shows the workflow how to use the function ``area_load_generator_elements``. 

The load area can be defined using a polyline in Rhino. The polyline is to be stored in a separate layer (here with the name area_load).

![BSP_area_load_generator](https://user-images.githubusercontent.com/49633262/226637930-a71a9aa0-46d4-4235-89be-0b1a2d3f2793.png)

A list of loaded elements (corresponding to the elements whose geometric center lies within the polyline) are calculated using the function ``area_load_generator_elements`` where the string ``layer`` correspond to the name of the layer defined in Rhino. The structure object named "mdl" is used inside the function ``area_load_generator_elements`` to extract the element numbers.

```python
from compas_fea.structure import Structure
from strucenglib.prepost_functions import area_load_generator_elements

name = 'Example_area_load_generator_elements'
path = 'C:\Temp\\'
mdl = Structure(name=name, path=path)
# ...

# Calculate Element numbers within the polyline
loaded_element_numbers=area_load_generator_elements(mdl,layer='area_load') # 

# ...
```

## Add the loaded element to the **Structure** object 
Coming soo

## Add the areas load to the steps
Coming soon

----OLD
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

This page shows how different types of **Element** objects are added and edited with the **Structure** object, here the example **Structure** object is given as ``mdl``. The **Element** objects represent linear, surface and solid finite elements connecting different nodes of the structure.
