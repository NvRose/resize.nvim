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
	return vim.fn.winnr() == vim.fn.winnr("l")
end

local M = {}

M.up = function(n)
	if bottom_edge() then
		if top_edge() then
			vim.cmd("resize -" .. n)
		else
			vim.cmd("resize +" .. n)
		end
	else
		vim.cmd("resize -" .. n)
	end
end

M.down = function(n)
	if bottom_edge() then
		if top_edge() then
			vim.cmd("resize +" .. n)
		else
			vim.cmd("resize -" .. n)
		end
	else
		vim.cmd("resize +" .. n)
	end
end

M.left = function(n)
	if right_edge() then
		if left_edge() == false then
			vim.cmd("vert resize +" .. n)
		end
	else
		vim.cmd("vert resize -" .. n)
	end
end

M.right = function(n)
	if right_edge() then
		if left_edge() == false then
			vim.cmd("vert resize -" .. n)
		end
	else
		vim.cmd("vert resize +" .. n)
	end
end

return M
