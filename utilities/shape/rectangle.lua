local shapes = {}

function shapes.first_style(cr, width, height)
    cr:move_to(0,0)
    cr:line_to(width,0)
    cr:line_to(width,height - height/4)
    cr:line_to(width - height/4,height)
    cr:line_to(0,height)
    cr:close_path()
end

--function shapes.first_style(cr, width, height)
--    cr:move_to(0,0)
--    cr:line_to(width,0)
--    cr:line_to(width,height - height/4)
--    cr:line_to(width - height/4,height)
--    cr:line_to(0,height)
--    cr:close_path()
--end


return shapes