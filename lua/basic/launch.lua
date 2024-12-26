LAZY_PLUGINS = {}

function Plugin(path)
	table.insert(LAZY_PLUGINS, { import = path })
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
