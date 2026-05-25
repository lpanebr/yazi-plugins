local M = {}

local function preview_code(job)
	return ya.preview_code({
		area = job.area,
		file = job.file,
		mime = "text/plain",
		skip = job.skip,
	})
end

local function preview_text(job, text)
	text = text:gsub("\t", string.rep(" ", rt.preview.tab_size or 4))

	if text ~= "" and not text:find("\n$") then
		text = text .. "\n"
	end

	local limit = job.area.h
	local i, lines = 0, ""
	for line in text:gmatch("[^\n]*\n") do
		i = i + 1
		if i > job.skip then
			lines = lines .. line
		end
		if i >= job.skip + limit then
			break
		end
	end

	if job.skip > 0 and i < job.skip + limit then
		ya.emit("peek", { math.max(0, i - limit), only_if = Url(job.file.url), upper_bound = true })
	else
		ya.preview_widget(job, ui.Text.parse(lines):area(job.area))
	end
end

function M:peek(job)
	local output, err = Command("docx2txt"):arg({
		tostring(job.file.url.path),
		"-",
	}):output()

	if not output then
		if err then
			return preview_text(job, tostring(err))
		end
		return preview_code(job)
	end

	local text = output.stdout
	if text:match("^%s*$") then
		text = output.stderr
	end

	preview_text(job, text)
end

function M:seek(job)
	local h = cx.active.current.hovered
	if not h or h.url ~= job.file.url then
		return
	end

	local step = math.floor(job.units * job.area.h / 10)
	step = step == 0 and ya.clamp(-1, job.units, 1) or step
	ya.emit("peek", { math.max(0, cx.active.preview.skip + step), only_if = Url(job.file.url) })
end

return M
