LAZY_PLUGINS = {}

function plugin(path)
	table.insert(LAZY_PLUGINS, { import = path })
end

KEYMAPS = {}

function key(option)
	table.insert(KEYMAPS, option)
end

function key_table(keymap_config)
	for i = 1, #keymap_config do
		-- print(keymap_config[i])
		key(keymap_config[i])
	end
	-- for key, value in pairs(keymap_config) do
	-- 	KEYMAPS[key] = value
	-- end
end
