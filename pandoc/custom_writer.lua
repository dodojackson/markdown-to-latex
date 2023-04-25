local type = pandoc.utils.type

-- Dispatch table for AST element writers (similar to classic writer)
local dispatch = {}

-- Recursively write the document elements
-- Either call the corresponding dispatcher function (Block/Inline) or
-- call write on every element of the (Blocks/Inlines)-Lists
local function write (elem)
	if type(elem) == 'Block' or type(elem) == 'Inline' then
		return (
			dispatch[elem.t] or dispatch[type(elem)] or
			error(('No function to convert %s (%s)'):format(elem.t, type(elem)))
		)(elem)
	elseif type(elem) == 'Inlines' then
		return elem:map(write)
	elseif type(elem) == 'Blocks' then
		-- I believe this is only used once, on the first call of write
		return elem:map(write)
	end
	error('cannot convert unknown type: ' .. type(element))
end

function dispatch.Header(elem)
	return " HEADER ELEMENT "
end

function dispatch.Str(elem)
	return "STRING ELEMENT"
end

function dispatch.Para(elem)
	return " PARA ELEMENT "
end

function dispatch.Space(elem)
	return " "
end


function Writer (doc, opts)
	--PANDOC_DOCUMENT = doc
	--PANDOC_WRITER_OPTIONS = opts
	--loadfile(PANDOC_SCRIPT_FILE)()

	local buffer = write(doc.blocks)
	local doc_body = pandoc.layout.concat(buffer, pandoc.layout.cr)
	return pandoc.layout.render(doc_body)
end