# Python Developer Mode
Starting from version 0.0.21, the strucenglib Rhino 3D plugin includes a developer mode specifically designed to develop and test Python dependencies.

In the `StrucEngLibInstallDependencies` dialog, a new section called _Developer_ has been introduced:

![image](https://github.com/StrucEng-Library-kfmresearch/strucenglib-website/assets/2311941/270e0ec4-e6a2-4629-94c6-c1607e18be18)

The developer mode allows you to install local git repositories into the Python virtual environment. This feature enables you to modify and test Python dependencies without requiring a new version release.

The following table lists the available Python dependencies along with their respective repository links:


| Name                           	| Repository                                                              	|
|--------------------------------	|-------------------------------------------------------------------------	|
| Strucenglib Snippet Collection 	| https://github.com/StrucEng-Library-kfmresearch/strucenglib-snippets.git  |
| Strucenglib Connection Layer   	| https://github.com/StrucEng-Library-kfmresearch/strucenglib-connect.git 	|
| Strucenglib Compas Fork        	| https://github.com/StrucEng-Library-kfmresearch/compas.git              	|
| Strucenglib Compas FEA1 Fork   	| https://github.com/StrucEng-Library-kfmresearch/compas_fea.git          	|


## Install Development Dependencies
To enable the developer mode, you can clone one or all of the Python dependencies mentioned above. For example:


```sh
git clone https://github.com/StrucEng-Library-kfmresearch/strucenglib-snippets.git
```

In the `StrucEngLibInstallDependencies` dialog in Rhino 3D, select the location of the cloned git repository on your disk. Then, press the _Install Dependencies_ button.
The installer will link your git repository to the virtual environment.
This ensures that any changes made in the git repository are reflected in the Python virtual environment within Rhino 3D.


!!! note
    - The installer functions as a shorthand for the pip command: pip install -e "location of git repository"


You can verify the target location of the symbolic links in the Rhino scripts directory by clicking on _Rhino Scripts Directory_.

![image](https://github.com/StrucEng-Library-kfmresearch/strucenglib-website/assets/2311941/27e793a0-b83a-4b69-9fd2-833840a583bc)

In the screenshot above, you can observe that all Rhino 3D script links refer to git repositories. Now, you can edit Python source files in the git repositories and immediately access the changes in Rhino 3D.

### Remarks
Once you have set up the git development dependencies, you should no longer link other directories in Rhino's Module Search Paths, as illustrated below:


![image](https://github.com/StrucEng-Library-kfmresearch/strucenglib-website/assets/2311941/178e20a7-ffcb-4db3-a520-072021fa3852)


## Uninstall Development Dependencies
To uninstall development dependencies, reinstall for Abaqus or Ansys by pressing one of the buttons _Install for Abaqus_ or _Install for Ansys_. 
