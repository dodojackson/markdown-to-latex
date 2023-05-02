require 'pandoc/my_helpers'

-- Reduce boilerplate of new style custom writer
local writer = pandoc.scaffolding.Writer

--
-- AST element writers
--

function writer.Block.Header (header)
	content = writer.Inlines(header.content)
	return ("Level %s header: '%s'"):format(header.level, content)
end

function writer.Block.Para (para)
	return [[ PARA ELEMENT ]]
end

function writer.Inline.Str (str)
	return str.text
end

function writer.Inline.Space ()
	return " "
end

-- -- --

function Writer(doc, opts)

	-- Extract only one section from file
	if (opts.variables['SECTION']) then
		print(("Extracting section '%s'\n"):format(opts.variables['SECTION']))
		doc = extract_section(doc, opts.variables['SECTION']:render())
	end
	
	--return writer(doc, opts)
	return pandoc.write(doc, 'native', opts)
end

