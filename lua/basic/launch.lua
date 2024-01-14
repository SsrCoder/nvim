LAZY_PLUGINS = {}

function plugin(path)
	table.insert(LAZY_PLUGINS, { import = path })
end

KEYMAPS = {}

function key(key, option)
	key_table({[key] = option})
end

function key_table(keymap_config)
	for key, value in pairs(keymap_config) do
		KEYMAPS[key] = value
	end
end
