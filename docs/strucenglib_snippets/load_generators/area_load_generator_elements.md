

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

**Element** objects are added to the **Structure** object with the ``.add_element()`` and ``.add_elements()`` methods, by giving the list(s) of nodes that the element(s) connect to, as well as the element type as a string. If a single element is being added with ``.add_element()``, then the node numbers are given in ``nodes``, while if multiple elements are added with ``.add_elements()``, lists of nodes are given through ``elements``. The **Element** objects are added to the ``.elements`` dictionary of the **Structure**, from the classes found in module **compas_fea.structure.element**, where the class names match the string entered for the element type ``type``.

The element types include, amongst others, 1D elements: **SpringElement**, **BeamElement**, **TrussElement**, 2D elements: **ShellElement**, **MembraneElement**, and 3D elements: **PentahedronElement**, **TetrahedronElement**, **HexahedronElement**. **Note**: to date, not all elements types are consistently available across all FE solvers, Abaqus, OpenSees and Ansys.

As with nodes, the elements will be added with integer keys numbered sequentially starting from 0. **Note**: currently no more than one element can exist for the same collection of nodes, i.e. no overlapping elements are allowed. If you use ``.add_element()`` and an element already exists, nothing else will be added.

.. code-block:: python

    mdl.add_element(nodes=[0, 1, 4], type='ShellElement')  # a single element added

    mdl.add_elements(elements=[[0, 4], [1, 4], [2, 4], [3, 4]], type='BeamElement')  # multiple elements added

For Abaqus, adding elements will also create a set for each individual element. So for example, when element 4 is written to the input file, an element set named **element_4** (corresponding to element number 5 in Abaqus) will also be created. The utility of this is that individual elements can be referenced to whenever needed, which is useful for selectively assigning a thickness, material, section or orientation to specific elements by way of their number (see some of the examples for demonstrations of this).
