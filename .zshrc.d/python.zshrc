
function cvv() {
  if whence -w deactivate > /dev/null; then
    echo "== deactivate =="
    deactivate
  fi
  if [ -d .venv ]; then
    echo "== rm -rf .venv =="
    rm -rf .venv
  fi
  echo "== virtualenv -p python 3 .venv =="
  python3 -m venv .venv
  echo "== . .venv/bin/activate =="
  . .venv/bin/activate
  if [ -f requirements.txt ]; then
    echo "== pip install --upgrade pip =="
    pip install --upgrade pip
    echo "== pip install -r requirements.txt $* =="
    pip install -r requirements.txt $*
  fi
}
