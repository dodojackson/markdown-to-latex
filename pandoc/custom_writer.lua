-- Reduce boilerplate of new style custom writer
Writer = pandoc.scaffolding.Writer

--
-- AST element writers
--

function Writer.Block.Header (header)
	content = Writer.Inlines(header.content)
	return ("Level %s header: '%s'"):format(header.level, content)
end

function Writer.Block.Para (para)
	return [[ PARA ELEMENT ]]
end

function Writer.Inline.Str (str)
	return str.text
end

function Writer.Inline.Space ()
	return " "
end
