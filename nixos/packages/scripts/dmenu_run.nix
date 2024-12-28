{ writeShellApplication, dmenu, dmenu_path }:

writeShellApplication {
  name = "dmenu_run";
  runtimeInputs = [ dmenu_path dmenu ];
  text = ''
    cmd=$(dmenu_path | dmenu "$@")
    /usr/bin/env bash -c "$cmd"
  '';
}
