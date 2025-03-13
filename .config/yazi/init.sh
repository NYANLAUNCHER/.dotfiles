#!/bin/sh
echo '
#!/bin/sh
local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
yazi "$@" --cwd-file="$tmp"
if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	builtin cd -- "$cwd"
fi
rm -f -- "$tmp"
' > "$HOME/.local/bin/y"
chmod +x "$HOME/.local/bin/y"
