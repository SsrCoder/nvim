LAZY_PLUGINS = {}

function plugin(path)
	table.insert(LAZY_PLUGINS, { import = path })
end
