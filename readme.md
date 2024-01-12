# activate-venv
You can use this script to activate a virtual environment in the current directory. This is useful if you have multiple virtual environments in different directories and you want to activate the one in the current directory.
## Setup
clone this repository
```nu
git clone <this-repo>; cd <this-repo>
```
Run the following command to download the script in nu
```nu
(
    open $nu.config-path
    | lines
    | append [
        $"export-env { $env.ACTIVATE_TEMPLATE_PATH = '([(pwd) activate.template] | path join)' }"
        $"use (pwd | path join activate-venv.nu) *"
    ]
    | save -f $nu.config-path
)
```
## Usage
First, create a virtual environment in the current directory. For example, if you are using Python 3.9, you can run the following
```nu
python -m venv venv
```
This will create a virtual environment in the current directory called `venv`. Then, you can write `activate.nu` automatically by running the following command
```nu
write-activate
```
This will create a file called `activate.nu` in the current directory. You can then activate the virtual environment by running the following command
```nu
activate
```
If you want to deactivate the virtual environment, you can run the following command
```nu
deactivate
```