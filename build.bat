docker build ./base -t gameci/windows-base
docker build ./hub -t gameci/windows-hub
docker build ./editor --build-arg version="2020.3.24f1" --build-arg changeSet="79c78de19888" --build-arg module="windows-il2cpp" -t gameci/windows-editor:il2cpp
docker build ./editor --build-arg version="2020.3.24f1" --build-arg changeSet="79c78de19888" --build-arg module="universal-windows-platform" -t gameci/windows-editor:uwp
docker build ./editor --build-arg version="2020.3.24f1" --build-arg changeSet="79c78de19888" --build-arg module="appletv" -t gameci/windows-editor:tvos
