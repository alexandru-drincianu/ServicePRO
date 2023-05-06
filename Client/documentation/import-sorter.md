# Import Sorter

This project uses [import_sorter](https://pub.dev/packages/import_sorter) pub.

You can sort the imports by running the following command:

```shell
flutter pub run import_sorter:main
```

You can add the following pre-commit hook to run the import sorter command automatically on every commit.

```shell
#!/bin/sh
#
# Pre-commit hook for import_sorter pub. Supports fvm too.
#
# To enable this hook, rename this file to "pre-commit".

# Helper try/catch functions
function try()
{
    [[ $- = *e* ]]; SAVED_OPT_E=$?
    set +e
}
function catch()
{
    export ex_code=$?
    (( $SAVED_OPT_E )) && set +e
    return $ex_code
}

# Change working directory to "Boilerplate"
cd Boilerplate

# Execute import sorter for flutter of fvm
try 
(
    exec flutter pub run import_sorter:main
)
catch || {
    exec fvm flutter pub run import_sorter:main
}
```

After the pre-commit hook is run, you can then manually review the changes and commit or amend the
sorted imports.

Pre-commit file should be placed in the root directory of the repository under `.git/hooks/pre-commit`
