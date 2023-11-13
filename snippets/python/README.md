## Steps to run locally
1. Build a python package
  - By running the publish-all-platforms CI in the breez-sdk repository (use dummy binaries)
  - or by downloading from Pypi
2. Download the wheel artifact for your platform. For linux that is `python-wheel-3.8-manylinux_2_31_x86_64`
3. Unzip the artifact in the `snippets/python/packages` folder.
4. Run `pip install packages/{NAME_OF_.WHL_FILE}`
4. happy coding!

To check the syntax:

```bash
cd snippets/python
python3 -m compileall src
```

To check the snippet formatting:

```bash
cd snippets/python/src
ruff --ignore F841 --ignore F401 --output-format=github .
```

To execute the snippets locally, in order to check for type correctness:

```bash
#!/bin/bash

export API_KEY="..."
export MNEMONIC="..."

cd snippets/python
python main.py $API_KEY $MNEMONIC
```