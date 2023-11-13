## Steps to run locally

To check the syntax:

```bash
cd snippets/python_snippets
python3 -m compileall src
```

To check the snippet formatting:

```bash
cd snippets/python_snippets/src
ruff --ignore F841 --ignore F401 --output-format=github .
```

To execute the snippets locally, in order to check for type correctness:

```bash
#!/bin/bash

export API_KEY="..."
export MNEMONIC="..."

cd snippets/python_snippets
python main.py $API_KEY $MNEMONIC
```