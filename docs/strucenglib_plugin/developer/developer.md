# Developer Notes

[![Continuous Integration](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/distrib_sh_build.yml/badge.svg?branch=master)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/distrib_sh_build.yml)
[![CodeQL](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/codeql-analysis.yml)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/alerts/)
[![Latest tagged version](https://img.shields.io/github/v/tag/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin.svg)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/blob/master/CHANGELOG)

The source code of the Rhino Plugin is available on [Github](https://github.com/kfmResearch-NumericsTeam/StrucEng_Library_Plug_in).


## Build
The build system is captured in a vagrant image. Please consider the notes in [/tools/vagrant](https://github.com/kfmResearch-NumericsTeam/StrucEng_Library_Plug_in/tree/master/tools/vagrant) in the source distribution for the setup of the vagrant container. There is a [Github Action](https://github.com/kfmResearch-NumericsTeam/StrucEng_Library_Plug_in/actions) which reuses the same vagrant setup scripts to build and test StrucEng Lib on each commit.

## Release
StrucEng Lib Release management is captured in [/tools/distrib/](https://github.com/kfmResearch-NumericsTeam/StrucEng_Library_Plug_in/tree/master/tools/distrib). Rhino uses a proprietary package manager, [yak.exe](https://developer.rhino3d.com/guides/yak/what-is-yak/#:~:text=Note,manage%20plug%2Dins%20and%20more), to create a packaged artifact and publish to Rhino store.


## Github Workflows
#### [distrib.sh build (CI)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/distrib_sh_build.yml) [![distrib.sh build](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/distrib_sh_build.yml/badge.svg)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/distrib_sh_build.yml)

Main Build workflow, uses vagrant build script to build the project in an ubuntu-box. This ensures continuous integration and checks that the build is reproducible.

#### [dotnet build (CI)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/dotnet_build.yml) [![dotnet build](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/dotnet_build.yml/badge.svg)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/dotnet_build.yml)
Builds the solution with dotnet and powershell. This is for testing to ensure a build outside of vagrant box.

#### [Deploy (CD)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/deploy.yml) [![deploy](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/deploy.yml/badge.svg)](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/actions/workflows/deploy.yml)

This action captures the process to deploy into Rhino store. It builds and tests the source tree with a new version and deploys the artifacts into Rhino store. This can be used if built tools are not installed on the local machine.

![image](https://user-images.githubusercontent.com/2311941/176892863-7bcb1cce-2459-40bd-90e6-071ec83d77bd.png)


## Design Notes
StrucEng Lib Plugin implements a MVVM pattern to separate UI boiler plate code from presentation and business logic. Since UI code is described in C#, it is a key goal to keep UI code as simple and straight forward as possible.

To unify code, we align with the following key decisions:

- Eto components are described in C#. A view containing constructions of Eto component is suffixed with _View_.
- Eto components in _View_ classes use bindings to sync their state with a _ViewModel_.
- If an action is not complicated, a _ViewModel_ may implement it directly with a _RelayCommand_. Otherwise the action is implemented in a class prefixed with _Exec_. Action classes inherit from _CommandBase_.
- Every ViewModel inherits from _StrucEngLib#ViewModelBase_ and is suffixed with _ViewModel_.
- Where possible, every _View_ contains a corresponding _ViewModel_ class.
- A _ViewModel_ is instantiated first and typically stored for later access in a shared context class. A _ViewModel_ is then passed via constructor when instantiating a _View_ class.
- There are two ways to sync model state with view model state: Classes (for instance those for LinFE) sync view model state on every change to their corresponding model class. This is a decision up to each class. To unify sync, a _ViewModel_ may choose to implement _ViewModelBase#UpdateModel_ and _ViewModelBase#UpdateViewModel_ to sync state. These methods are called after init and before code emit.


## Updating Sandwich Model
The dependency installer will download the latest state of SandwichModel located in branch [strucenglib_plugin](https://github.com/StrucEng-Library-kfmresearch/strucenglib-rhino3d-plugin/blob/strucenglib_plugin/Sandwichmodel/setup.py). Any changes committed to this branch will be used upon reinstallation of dependency with dependency installer.
