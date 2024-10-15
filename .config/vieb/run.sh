#!/bin/sh
# Wrapper around vieb adds:
# --session="<path>" - sets --datafolder=<dir> and exports VIEB_DATAFOLDER=<dir>
# if <path> doesn't start with "./" or "/" it is a path in $VIEB_SESSIONS_DIR
. "$XDG_CONFIG_HOME/vieb/integrations.sh"
[ -z "$VIEB_SESSIONS_DIR" ] && echo "Error: \$VIEB_SESSIONS_DIR must be set. Check $XDG_CONFIG_HOME/vieb/integrations.sh"; exit 1

# Check if VIEB_SESSION_DIR is set
if [ -z "$VIEB_SESSION_DIR" ]; then
  echo "Error: VIEB_SESSION_DIR is not set."
  exit 1
fi

session_path=""
datafolder_flag=""

# Parse command-line arguments
for arg in "$@"; do
  case $arg in
    --session=*)
      session_path="${arg#*=}"
      ;;
    --datafolder=*)
      datafolder_flag=1
      ;;
    *)
      # Pass through other arguments unchanged
      other_args="$other_args $arg"
      ;;
  esac
done

# Check for session path
if [ -z "$session_path" ]; then
  echo "Error: No session path provided."
  exit 1
fi

# Prepend VIEB_SESSION_DIR if session_path doesn't start with "./" or "/"
if ! echo "$session_path" | grep -qE '^(./|/)' ; then
  session_path="$VIEB_SESSION_DIR/$session_path"
fi

# Throw an error if both flags are present
if [ "$datafolder_flag" ]; then
  echo "Error: You can only specify one of --session or --datafolder."
  exit 1
fi

# Construct the command
command="vieb --datafolder=\"$session_path\"$other_args"

# Execute the command
eval "$command"
