set -eux

for F in activate deactivate; do
  test -r "${PREFIX}"/etc/conda/$F.d/hub.sh;
done;
