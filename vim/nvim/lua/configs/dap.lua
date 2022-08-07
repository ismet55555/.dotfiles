------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                       Debugger Adapter Protocol (DAP)
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- Check DAP status
local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
local status_ui_ok, dapui = pcall(require, "dapui")
if not status_ui_ok then
	return
end

require('dap-go').setup()
require("nvim-dap-virtual-text").setup()
require('dapui').setup()
dap.listeners.after.event_initialized["dapui_config"] = function() -- Open DAP UI when DAP starts
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
