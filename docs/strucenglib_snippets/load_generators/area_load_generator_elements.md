
This page shows the functionality of the function ``area_load_generator_elements``. 

## Basic functionality
The load area is defined using polylines in Rhino. The polyline is to be stored in a separate layer (here with the name area_load).

![BSP_area_load_generator](https://user-images.githubusercontent.com/49633262/226637930-a71a9aa0-46d4-4235-89be-0b1a2d3f2793.png)

A list of loaded elements ``loaded_element_numbers`` - corresponding to the elements whose geometric center lies within the polyline - are calculated using the function ``area_load_generator_elements`` where the string ``layer`` correspond to the name of the layer defined in Rhino. The structure object named "mdl" is used inside the function ``area_load_generator_elements`` to extract the element numbers.

The list ``loaded_element_numbers`` can then use in the **AreaLoad"" object provied by the **compas_fea**. The  **AreaLoad"" object applies distributed loads per unit area (pressure x, y, z in units of N/mm2) on elements such as **ShellElement** objects. The ``elements`` to apply the load to is given by the list ``loaded_element_numbers`` and the ``name`` of the **AreaLoad** is required for its key. Only axis='local' is currently supported for Ansys, whereby x and y are local surface shears and z is the local normal pressure. Positive/negativ loads correspond to loads in the positive/negatziv direction of the local axes. For the definition of the local axes see [here](https://github.com/kfmResearch-NumericsTeam/Struc_Eng_Library_Server). More information about the **AreaLoad"" object can be found on the official [compas_fea documentation](https://compas.dev/compas_fea/latest/tutorial/09_loads.html)

```python
from compas_fea.structure import Structure
from strucenglib.prepost_functions import area_load_generator_elements

name = 'Example_area_load_generator_elements'
path = 'C:\Temp\\'
mdl = Structure(name=name, path=path)
# ...

# Calculate Element numbers within the polyline
loaded_element_numbers=area_load_generator_elements(mdl,layer='area_load') # 
mdl.add(AreaLoad(name='load_pressure', elements='elset_shells', z=-10000, axes='local'))
# ...
```

## Example 
A working example is found under TBD.

## Source Code
The function ``area_load_generator_elements`` is hosted on XX
