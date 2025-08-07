local apps = {}
apps.terminal = "kitty"
apps.editor = os.getenv("nvim") or "nano"
apps.editor_cmd = apps.terminal .. " -e " .. apps.editor

-- Set the terminal for the menubar.
require("menubar").utils.terminal = apps.terminal

return apps
