-- micro-cheat copyright 2022 Tero Karvinen https://TeroKarvinen.com

-- Cheatsheets are copyrighted by their original authors

-- Cheatsheets from Devhints.io are copyright 2021 
-- Rico Sta. Cruz and contributors, received under the MIT license

local micro = import("micro")
local config = import("micro/config")

local cheatdir = config.ConfigDir.."/plug/micro-cheat/cheatsheets/"

function init()
	-- runs once when micro starts
	config.MakeCommand("cheat", cheatCommand, config.NoComplete)
	config.TryBindKey("F1", "command:cheat", false)
end

function cheatCommand(bp)
	local filename = bp.Buf:GetName()
	local filetype = bp.Buf:FileType()

	if "Vagrantfile" == filename or "Dockerfile" == filename then
		filetype = filename:lower()
		micro.InfoBar():Message("Cheatsheet by file name: "..filename)
	elseif string.find(filename, "\.org$") then -- not detected by micro
		filetype = "org"
		micro.InfoBar():Message("Cheatsheet by file suffix: "..filename)
	elseif "unknown" ~= filetype then
		-- micro hopefully detected the filetype, the typical case
		micro.InfoBar():Message("Cheatsheet by file type: "..filetype)
	else
		micro.InfoBar():Message("Cheatsheet not found for type '"..filetype.."', filename '"..filename.."'")
		return
	end
	
	local cmd = "tab " .. cheatdir .. filetype .. ".md"
	bp:HandleCommand(cmd)

end
