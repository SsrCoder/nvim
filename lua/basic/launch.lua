LAZY_PLUGINS = {}

function Plugin(path)
	table.insert(LAZY_PLUGINS, require(path))
	-- table.insert(LAZY_PLUGINS, { import = path })
end

KEYMAPS = {}

function Key(option)
	table.insert(KEYMAPS, option)
end

function KeyTable(options)
	for i = 1, #options do
		Key(options[i])
	end
end

LANGUAGES = {}

function Language(lang)
	LANGUAGES[lang] = 1
end

function IsLanguageEnable(lang)
	return LANGUAGES[lang] ~= nil
end
