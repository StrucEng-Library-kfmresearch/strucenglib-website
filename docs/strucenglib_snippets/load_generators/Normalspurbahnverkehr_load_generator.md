
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

![Normalspurverkehr](https://user-images.githubusercontent.com/49633262/226929341-d75c1cce-59fa-4b7d-b906-d31a7b4a533c.png)

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

| Parameter    | data type      | Description           |
| :---         | :---           | :---                  |
| ``mdl``      | object         | **Structure** Object (see [Link](https://compas.dev/compas_fea/latest/tutorial.html) for more information)  |
| ``name``     | string         | Name of the load |
| ``l_Pl``     | integer        | Length of the plate measured between plane of the supporting walls |
| ``h_Pl``     | integer        | high of the plate, haunches are not considered and a homogeneous plate thickness is assumed  |
| ``s``        | integer        | Distance bewtween global origin and start point of the track at y=0 |
| ``beta``     | integer        | Inclination of the track to the y-axis (positive clockwise, negative counterclockwise) |
| ``q_Gl``     | integer        | Dead weight of concrete sleeper and rail in N/mm |
| ``b_Bs``     | integer        | Width of the concrete sleeper |
| ``h_Strich`` | integer        | Gravel height between lower edge of railway sleeper and concrete slab |
| ``Q_k``      | integer        | Point load from train load model |
| ``y_A``      | integer        | Distance in y-direction between point load 1 and the origin |

### Output
Coming Soon

## Example 
An example of how the function ``Normalspurverkehr_load_generator`` can be used in a structural analysis is found on this [link](https://github.com/StrucEng-Library-kfmresearch/strucenglib-snippets/tree/ansys/examples/Normalspurverkehr_load_generator)-

## Source Code
The function ``area_load_generator_elements`` is hosted and described in detail on [github](https://github.com/StrucEng-Library-kfmresearch/strucenglib-snippets/blob/ansys/strucenglib/prepost_functions/area_load_generator_elements.py).
