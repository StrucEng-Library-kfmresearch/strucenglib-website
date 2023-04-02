The StrucEngLib plugin issues a Finite Element Analysis Solver under-the-hood. Ensure to have [Prerequisites](./prerequisites.md) installed before you continue.

## Install Ansys
Install [Ansys Structural FEA Analysis Software](https://www.ansys.com/products/structures/ansys-mechanical#:~:text=What%20is%20Ansys%20Mechanical%3F,hydrodynamic%2C%20explicit%2C%20and%20more.). This software is proprietary and needs a license. 

!!! note
    - Note that if you are using [StrucEngLib Remote Server](https://strucenglib.ethz.ch/strucenglib_plugin/server/), no finite element analysis solver is required.


## Install Rhinoceros 3D Plugin
Fire up Rhinoceros 3D and type `PackageManager` in Rhino command line. Search for `StrucEngLibPlugin`
in the search bar. Select the latest version, then hit install, and restart
Rhino.

<figure markdown>
  ![](assets/install.png)
  <figcaption>Rhino Package Manager</figcaption>
</figure>



## Menu bar and Command integration
Upon restart, the plugin integrates into Rhino menu bar and is accessible under `Tools` - `StrucEngLib Plugin` as well as in the command line with `StrucEngLib*`.

If plugin load fails with an error, ensure that the plugin is loaded in `PluginManager` settings:  

![image](https://user-images.githubusercontent.com/2311941/206239991-0800a332-0b85-4005-a3de-16ababcd698f.png)


## Post Installation
Upon installation of the plugin, various Python dependencies must be downloaded.


### Download Dependencies

Type `StrucEngLibInstallDependencies` in Rhino command line to open the dialog shown below.

<figure markdown>
  ![](assets/installer.png){width=500px}
  <figcaption>StrucEng Library Dependency Installer</figcaption>
</figure>

Select __Select Directory__ and choose your Anacoda installation path ([Prerequisites](../prerequisites)).
The StrucEngLib Plugin issues Anaconda to create a new virtual environment and
install all required Python dependencies. Hit __Install__ to download the software packages. The installation may take some minutes.

Subsequently, press __Test Import__ to verify installation. Upon failure, an error message is shown.

!!! note
    - The installer uses Compas to install Python dependencies into Rhino's include directory `%AppData%\McNeel\Rhinoceros\7.0\scripts`. 
    - Ensure that your Windows Environment variable `%PYTHONPATH%` is not set.
    - If you changed Rhino's `Modules Search Path` in Python Editor, please remove them ([Why](https://web.archive.org/save/https://compas.dev/compas_fea/latest/gettingstarted/installation.html)).
    - Install Script: [install.bat](https://github.com/kfmResearch-NumericsTeam/StrucEng_Library_Plug_in/blob/master/StrucEngLib/EmbeddedResources/install.bat).
