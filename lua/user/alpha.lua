local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local status_ok_startift, startify = pcall(require, "alpha.themes.startify")
if not status_ok_startift then
	return
end

alpha.setup(startify.config)
