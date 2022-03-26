if ! sass --version >/dev/null; then
  echo 'Install sass'
fi

if ! http-server --version >/dev/null; then
  echo 'Install http-server'
fi

wd='/Users/cameronbasham/dev/aws/cpbasham.github.io'
cwd="$(pwd)"
if [ "${wd}" != "${cwd}" ]; then
  echo "Call script from ${wd}"
fi


sass --watch "${wd}/styles/sass/":"${wd}/styles/" >"${wd}/sass.log" &
trap "kill $!" EXIT
http-server
