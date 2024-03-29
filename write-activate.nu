export def main [venv_dir: string = venv] {
    let venv_path = pwd | path join $venv_dir
    let bin_path = $venv_path | path join (bin-dir)
    let activate_path = $bin_path | path join activate.nu

    open $env.ACTIVATE_TEMPLATE_PATH
    | str replace -a __VIRTUAL_ENV__ $venv_path
    | str replace -a __BIN_NAME__ (bin-dir)
    | str replace -a __VIRTUAL_PROMPT__ $venv_dir
    | save -f $activate_path
}

def bin-dir [] {
    if (is-windows) {
        'Scripts'
    } else {
        'bin'
    }
}

def is-windows [] {
    ($nu.os-info.family) == 'windows'
}