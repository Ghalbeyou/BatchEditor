# BatchEditor

BatchEditor is an open-source text editor written in batch script, inspired by Vim. It allows users to edit text files directly from the command line with a variety of features such as navigation, editing, adding, and deleting lines.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Plugins](#plugins)
- [Contributing](#contributing)
- [License](#license)

## Installation

To install BatchEditor, simply clone the repository to your local machine:

```sh
git clone https://github.com/ghalbeyou/batcheditor.git
cd batcheditor
```

## Usage

To start using BatchEditor, open a command prompt and navigate to the directory where you cloned the repository. Then, run the following command:

```sh
BatchEditor.bat o <path_to_directory> <file_name>
```

### Example

```sh
BatchEditor.bat o E:\Code package.json
```

### Notes

- `<path_to_directory>` must be a valid path to the directory of the file.
- `<file_name>` should be a valid file name.
- Ensure there is a space between `<path_to_directory>` and `<file_name>`.

## Configuration

BatchEditor can be configured using the `config.ini` file located in the `/data` directory. This file has three sections:

1. **Editor Keys**: Defines key bindings for various editor actions.
2. **Startup Commands**: Specifies commands to be executed when the editor starts up.
3. **Plugins**: Enables or disables plugins.

### Example `config.ini`

```ini
[Editor Keys]
save=Ctrl+S
quit=Ctrl+Q

[Startup Commands]
command1=echo Welcome to BatchEditor!

[Plugins]
bat_autocomplete=enabled
```

## Plugins

BatchEditor supports plugins to extend its functionality. The default plugin available is `bat_autocomplete`, which provides autocomplete features for batch commands.

### Plugin Configuration

The plugin configuration file is located in the `/plugins` directory and is named `bat_autocomplete.ini`. It has two sections:

1. **Manifest**: Provides information about the plugin such as its title, description, author, and URL.
2. **Settings**: Specifies the type of plugin and the autocomplete options.

### Example `bat_autocomplete.ini`

```ini
[Manifest]
title=Batch Autocomplete Plugin
description=Provides autocomplete features for batch commands.
author=GhalbeYou
url=https://github.com/ghalbeyou/batcheditor

[Settings]
type=autocomplete
commands=echo,if,choice
```

## Contributing

We welcome contributions to make BatchEditor better and bigger! To contribute:

1. **Fork** the repository.
2. **Edit** the code.
3. Open a new **Pull Request** (PR).

For more details, please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## License

BatchEditor is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

This is an open-source application made by [@GhalbeYou](https://github.com/ghalbeyou). It is not intended for sale or commercial use.