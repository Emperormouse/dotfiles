{ writeShellApplication, dmenu }:

writeShellApplication {
  name = "dmenu_path";
  runtimeInputs = [ dmenu ];
  text = ''
    cachedir="$HOME/.cache"
    cache="$cachedir/dmenu_run"

    [ ! -e "$cachedir" ] && mkdir -p "$cachedir"

    IFS=:
    if stest -dqr -n "$cache" "$PATH"; then
        stest -flx "$PATH" | sort -u | tee "$cache"
    else
        cat "$cache"
    fi
  '';
}
