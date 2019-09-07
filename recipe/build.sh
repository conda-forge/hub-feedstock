set -eu

pushd github.com/github/hub
go install -v .

# Copy activate/deactivate scripts
etc_conda=$PREFIX/etc/conda;
for F in activate deactivate; do
  mkdir -p $etc_conda/$F.d;
  cp -v $RECIPE_DIR/$F.sh $etc_conda/$F.d/hub.sh;
done;

# Copy bash_completion
mkdir -p $PREFIX/etc/bash_completion.d
cp etc/hub.bash_completion.sh $PREFIX/etc/bash_completion.d/hub.sh;
