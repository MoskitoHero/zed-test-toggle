# Zed Test Toggle
This small gem is designed to allow developers to switch to the test relative to the file they are editing, and back. It handles both tests in the `spec` directory if you are a Rspec user and in the `test` directory if you use Minitest or equivalent.

It is still in the early stages of development. Feel free to propose improvements.

## Usage
This tool is meant to be called from a Zed task.

```json
[
  {
    "label": "Toggle Test and Target",
    "command": "~/dev/moskitohero/zed-test-toggle/exe/zed-test-toggle",
    "args": [
      "-p",
      "\"$ZED_RELATIVE_FILE\"",
      "-r",
      "\"$ZED_WORKTREE_ROOT\""
    ],
    "hide": "always",
    "allow_concurrent_runs": false,
    "use_new_terminal": false,
    "reveal": "never"
  },
]
```

And called with a keybinding. If called from the Task list, the env variables of the task will not be refreshed, and you will just keep juping to the eame file. The Zed team considers this a feature for now, so using a keybinding is mandatory.

```json

[
  {
    "bindings": {
      "ctrl-shift-t": [
        "task::Spawn",
        {
          "task_name": "Toggle Test and Target",
          "reevaluate_context": true
        }
      ]
    }
  }
]
```
