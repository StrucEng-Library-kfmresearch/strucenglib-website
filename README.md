# compas api doc

This branch hosts the API doc of compas. We commit a built snapshot in the repository.

To rebuild the documentation:

``` sh
git submodule update --init --recursive  # download submodules
./setup.sh                               # build doc
```

The rendering output is available in ./docs
