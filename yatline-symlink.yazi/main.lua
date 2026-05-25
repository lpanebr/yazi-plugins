local function hovered()
	return cx.active.current.hovered
end

local function setup(_, options)
	options = options or {}

	local config = {
		symlink_color = options.symlink_color or "silver",
	}

	if Yatline and Yatline.coloreds and Yatline.coloreds.get then
		function Yatline.coloreds.get:symlink()
			local h = hovered()
			if not h or not h.link_to then
				return nil
			end

			return { { " -> " .. tostring(h.link_to), config.symlink_color } }
		end
	end
end

return { setup = setup }
