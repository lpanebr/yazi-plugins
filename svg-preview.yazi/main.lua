local M = {}

local function path_of(url)
	return tostring(url.path or url)
end

local function png_cache(job)
	local cache = ya.file_cache(job)
	if not cache then
		return nil
	end

	-- Inkscape infers PNG output from the extension, so keep Yazi's cache key
	-- and add a PNG suffix to the generated file.
	return Url(path_of(cache) .. ".png")
end

local function preview_error(job, err)
	ya.preview_widget(job, ui.Text.parse(tostring(err)):area(job.area))
end

function M:peek(job)
	local start, cache = os.clock(), png_cache(job)
	if not cache then
		return preview_error(job, "SVG preview cache is unavailable")
	end

	local ok, err = self:preload(job)
	if err then
		return preview_error(job, err)
	end
	if not ok then
		return
	end

	local delay = (rt and rt.preview and rt.preview.image_delay) or 0
	ya.sleep(math.max(0, delay / 1000 + start - os.clock()))
	ya.image_show(cache, job.area)
end

function M:preload(job)
	local cache = png_cache(job)
	if not cache then
		return true, Err("SVG preview cache is unavailable")
	end
	if fs.cha(cache) then
		return true
	end

	local child, err = Command("inkscape"):arg({
		"--convert-dpi-method=none",
		"-o",
		path_of(cache),
		"--export-overwrite",
		"-D",
		"--export-png-color-mode=RGBA_16",
		path_of(job.file.url),
	}):spawn()

	if not child then
		local msg = "spawn `inkscape` command failed"
		if err then
			msg = msg .. ": " .. tostring(err)
		end
		ya.err(msg)
		return true, Err(msg)
	end

	local status = child:wait()
	if status and status.success then
		return true
	end

	local msg = "`inkscape` failed to convert SVG"
	if status then
		msg = msg .. ": " .. tostring(status)
	end
	ya.err(msg)
	return true, Err(msg)
end

function M:seek(_) end

return M
