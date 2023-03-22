
This page shows the functionality of the function ``Normalspurverkehr_load_generator``. 

## Assumption and Restrictions
The current version of the ``Normalspurverkehr_load_generator`` has been developed for classic overpasses (frames/plate structures). The following restrictions apply:

- The Global origin must always be at x=0, y=0 and z=0.
- The Global origin must lie on the same plane as the plate.
- The Global origin is always on the lower left corner of the plate.
- Therefore the pate must extend in the positive x and y axis and lie completley in the xy plane.
- Loads are always defined in the direction of the local (negativ) z-direction.
- The local z-direction always points in the positive global z-axis
- The x-direction is always parallel to the edge of the plate
- Walls (constraints) are always parallel to the x and y axis, respectively. 

## Functionality

The railways loads are defined using numerical inputs. Currentley no grafical input via the Rhino user Interface is suppoerted. 

```python
# ...

# Normalspurverkehr Load generator
return_values_Gleis_1=Normalspurbahnverkehr_load_generator(mdl,name='Gleis_1', l_Pl=10000, h_Pl=200, s=7500, beta=-30, q_Gl=-4.8*10000, b_Bs=1000, h_Strich=200, Q_k=-225*1000, y_A=5000)

# ...
```

### Inputs

The following inputs are required:

| mdl           | object | **Structure** Object |
| :---         |     :---:      |          ---: |
| git status   | git status     | git status    |
| git diff     | git diff       | git diff      |

| mdl  | object | Correspond to the **Structure** Object |
| mdl  | object | Correspond to the **Structure** Object |

### Output





![BSP_area_load_generator](https://user-images.githubusercontent.com/49633262/226637930-a71a9aa0-46d4-4235-89be-0b1a2d3f2793.png)

A list of loaded elements ``loaded_element_numbers`` - corresponding to the elements whose geometric center lies within the polyline - are calculated using the function ``area_load_generator_elements`` where the string ``layer`` correspond to the name of the layer defined in Rhino. The structure object named "mdl" is used inside the function ``area_load_generator_elements`` to extract the element numbers.

The list ``loaded_element_numbers`` can then use in the **AreaLoad"" object provied by the **compas_fea**. The  **AreaLoad"" object applies distributed loads per unit area (pressure x, y, z in units of N/mm2) on elements such as **ShellElement** objects. The ``elements`` to apply the load to is given by the list ``loaded_element_numbers`` and the ``name`` of the **AreaLoad** is required for its key. Only axis='local' is currently supported for Ansys, whereby x and y are local surface shears and z is the local normal pressure. Positive/negativ loads correspond to loads in the positive/negatziv direction of the local axes. For the definition of the local axes see [here](https://github.com/kfmResearch-NumericsTeam/Struc_Eng_Library_Server). Further a **Step** is added to the ``.steps`` dictioniary of the **Structure** object with the same string key ``name``. In a addition to the list ``loaded_element_numbers`` the loaded elements can be easily visualized via the Rhino layer, which is created during the execution of the function ``area_load_generator_elements``. 

More information about the **AreaLoad** and **Step** objects can be found on the official [compas_fea documentation](https://compas.dev/compas_fea/latest/tutorial.html) . 

```python
from compas_fea.structure import Structure
from compas_fea.structure import GeneralStep
from strucenglib.prepost_functions import area_load_generator_elements

name = 'Example_area_load_generator_elements'
path = 'C:\Temp\\'
mdl = Structure(name=name, path=path)
# ...

# Calculate Element numbers within the polyline
loaded_element_numbers=area_load_generator_elements(mdl,layer='area_load') # 
mdl.add(AreaLoad(name='load_pressure', elements='elset_shells', z=-10000, axes='local'))
# ...

# Steps
mdl.add([
    GeneralStep(name='step_1', displacements=['disp_left', 'disp_right', 'disp_up'],nlgeom=False),
    GeneralStep(name='step_2', loads=['area_load_pressure'], increments=1, nlgeom=False),])
mdl.steps_order = ['step_1', 'step_2']
# ...
```

## Example 
An example of how the function ``Normalspurverkehr_load_generator`` can be used in a strucutral analysis is found on this [link](https://github.com/StrucEng-Library-kfmresearch/strucenglib-snippets/tree/ansys/examples/Normalspurverkehr_load_generator)-

## Source Code
The function ``area_load_generator_elements`` is hosted and described in detail on [github](https://github.com/StrucEng-Library-kfmresearch/strucenglib-snippets/blob/ansys/strucenglib/prepost_functions/area_load_generator_elements.py).
