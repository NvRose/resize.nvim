local function left_edge()
	return vim.fn.winnr() == vim.fn.winnr("h")
end

local function bottom_edge()
	return vim.fn.winnr() == vim.fn.winnr("j")
end

local function top_edge()
	return vim.fn.winnr() == vim.fn.winnr("k")
end

local function right_edge()
	return vim.fn.winnr() == vim.fn.winnr('l')
end

local M = {}

M.up = function(n)
	if bottom_edge() then
		if top_edge() then
			cmd('resize -' .. n)
		else
			cmd('resize +' .. n)
		end
	else
			cmd('resize -' .. n)
	end
end

M.down = function(n)
	if bottom_edge() then
		if top_edge() then
			cmd('resize +' .. n)
		else
			cmd('resize -' .. n)
		end
	else
			cmd('resize +' .. n)
	end
end

M.left = function(n)
	if right_edge() then
		if left_edge() == false then
			cmd('vert resize +' .. n)
		end
	else
			cmd('vert resize -' .. n)
	end
end

M.right = function(n)
	if right_edge() then
		if left_edge() == false then
			cmd('vert resize -' .. n)
		end
	else
			cmd('vert resize +' .. n)
	end
end

M.setup = function()
	vim.api.nvim_create_user_command('ResizeUp',    [[ lua require('NvRose.base.resize').up(<q-args>) ]],    { nargs = 1} )
	vim.api.nvim_create_user_command('ResizeDown',  [[ lua require('NvRose.base.resize').down(<q-args>) ]],  { nargs = 1} )
	vim.api.nvim_create_user_command('ResizeLeft',  [[ lua require('NvRose.base.resize').left(<q-args>) ]],  { nargs = 1} )
	vim.api.nvim_create_user_command('ResizeRight', [[ lua require('NvRose.base.resize').right(<q-args>) ]], { nargs = 1} )
end

return M
