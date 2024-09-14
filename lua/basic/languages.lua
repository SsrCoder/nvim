local Go = 1
local Python = 2
local Lua = 3

local enabled_languages = {};

function enable(langs)
	for i = 1, #langs do
		if not is_enabled_language(langs[i]) then
			table.insert(enabled_languages, langs[i])
		end
	end
end

function is_enabled_language(lang)
	for i = 1, #enabled_languages do
		if enabled_languages[i] == lang then
			return true
		end
	end
	return false
end

return {
	enable = enable,
	is_enabled = is_enabled_language,

	Go = Go,
	Python = Python,
	Lua = Lua,
}
