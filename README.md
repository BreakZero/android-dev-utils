### Usage

### 1. Create a Tag and Push

To create a new tag and push it, triggering the CI process to upload the release/tag, run the following command:
```shell
 make -f scripts/create_tag.mk tag=release/xxx
```
Replace release/xxx with your desired tag name.

### 2. Update `.properties` File

The `.properties` file stores key-value pairs, typically used to configure values like `versionCode` or `versionName`.

To update a specific key in the `.properties` file (e.g., updating the `versionCode` with the GitHub Action job's `run-number`), use the following command:

```shell
./scripts/properties_editor.sh ${key} ${value}
```
Replace `${key}` with the property you want to modify (e.g., `versionCode`), and `${value}` with the new value (e.g., the `run-number` from GitHub Actions).