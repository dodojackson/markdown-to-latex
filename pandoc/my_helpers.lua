-- Extract section 'section_id'
-- where 'section_id' is automatically created from the corresponding md-header
function extract_section(doc, section_id)
	doc.blocks = pandoc.utils.make_sections(false, nil, doc.blocks)

	doc.blocks = doc.blocks:filter(
		function (item)
			if ((item.classes:find('section')) and (item.identifier == section_id)) then
				return true
			else
				return false
			end
		end
	)

	return doc
end