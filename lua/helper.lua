local LAZY_SPECS = {}

function Plugin(obj)
	local spec = require(obj)
	table.insert(LAZY_SPECS, spec)
end

local color = "themes.tokyonight"

function ColorScheme(cs)
	color = cs
end

function GetLazySpecs()
	Plugin(color)
	return LAZY_SPECS
end
