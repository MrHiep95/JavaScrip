local gg = gg;
APIHEXPATCH = gg.makeRequest('https://mrhiep95.atwebpages.com/APIHEXPATCH.lua').content 
pcall(load(APIHEXPATCH))
APISEARCHFIELD = gg.makeRequest('https://mrhiep95.atwebpages.com/APISEARCHFIELD.lua').content 
pcall(load(APISEARCHFIELD))
APILINKVOID = gg.makeRequest('https://mrhiep95.atwebpages.com/APILINKVOID.lua').content 
pcall(load(APILINKVOID))
APIHOOKVOID = gg.makeRequest('https://mrhiep95.atwebpages.com/APIHOOKVOID.lua').content 
pcall(load(APIHOOKVOID))
APISPEEDCB = gg.makeRequest('https://mrhiep95.atwebpages.com/APISPEEDCB.lua').content 
pcall(load(APISPEEDCB))
APISEARCHMRHIEP = gg.makeRequest('https://mrhiep95.atwebpages.com/APISEARCHMRHIEP.lua').content 
pcall(load(APISEARCHMRHIEP))
UR = gg.makeRequest('https://mrhiep95.atwebpages.com/UR.lua').content 
pcall(load(UR))
-----------[ Block Log ] --
local C=string.rep(" ",1048576)
Check={}
for i= 1, 1024 do 
   Check[i]=C 
end 
for A, B in pairs({gg.alert,gg.bytes,gg.copyText,gg.searchAddress,gg.searchNumber,gg.toast})
   do a = pcall(B,Check)
end

-- [ Spam Dump All Code Load ] --

for v = 1, 59999 do
load('local z = "Math Finger"') 
end
for v = 1, 79999 do
load('local b = "Chemistry"')
end
for v = 1, 89999 do
load('HSG = "Literature"')
end
-----------------------ANTI SSTOOL------------------
if gg.isPackageInstalled("sstool.only.com.sstool") then
    i = 1
    gg.alert("PLEASE UNISTALL SS TOOL! SCRIPT WILL BE DELETED")
   trash = gg.getFile():match('[^/]+$')
os.remove(trash)
    gg.setVisible(false)
    while true do
      gg.setVisible(false)      
      gg.setVisible(true)
    end
    return
  end
-------------------------ANTI LOAD-----------------
AntiLoad=" \x54\x68\x61\x6e\x68\x44\x69\x65\x75\x50\x72\x6f\x74\x65\x63\x74 "
AntiLoad=AntiLoad:rep(math.random(99))
for i = 1,200 do;
load(AntiLoad) end
------------------------HEX PATCH-------------------
local n, startAddress, endAddress = nil, 0, 0
local function name(lib)
	if n == lib then
		return startAddress, endAddress
	end
	local ranges = gg.getRangesList(lib or 'libil2cpp.so')
	for i, v in ipairs(ranges) do
		if v.state == "Xa" then
			startAddress = v.start
			endAddress = ranges[#ranges]['end']
			break
		end
	end
	return startAddress, endAddress
end

local function setHexMemory(libname, offset, hex)
	name(libname)
	local t, total = {}, 0
	for h in string.gmatch(hex, "%S%S") do
	    table.insert(t, {
	        address = startAddress + offset + total,
	        flags = gg.TYPE_BYTE,
	        value = h .. "r"
	    })
	    total = total + 1
	end
	local res = gg.setValues(t)
	if type(res) ~= 'string' then
		return true
	else
		gg.alert(res)
		return false
	end
end
---------------------------------------------------
on = "­🏴"
off = "🚩" 
speed = "­ЪЋљ"
ig = " [INGAME]"
lb = " [LOBBY]"
-----------------INFO-------------------------------
gg.getLibName("libil2cpp.so")
Package = "net.gameduo.mm"
Version = "1.2.4"
v = gg.getTargetInfo();
if v.x64 then
	xbit = "x64";
else
	xbit = "x32";
end
if v.packageName ~= Package then
print("Mr.Hiệp\n\nVUI LÒNG CHỌN ĐÚNG TRÒ CHƠI CỦA SCRIPT\nPLEASE SELECT THE CORRECT GAME OF THE SCRIPT") 
os.exit()
end
if v.versionName > Version then
print("Mr.Hiệp\n\nSCRIPT ĐÃ CŨ, HÃY THAM GIA TELEGRAM ĐỂ YÊU CẦU CẬP NHẬT\nTHE SCRIPT IS OLD, PLEASE JOIN THE TELEGRAM AND REQUEST UPDATES") 
os.exit()
end
if v.versionName < Version then
print("Mr.Hiệp\n\nPHIÊN BẢN TRÒ CHƠI KHÔNG PHẢI MỚI NHẤT! VUI LÒNG CẬP NHẬT TRÒ CHƠI !\nTHE GAME IS NOT THE LATEST VERSION! PLEASE UPDATE")
os.exit()
end
GameName = gg.getTargetInfo().label;
GameVersion = gg.getTargetInfo().versionName;
MrHiep = "Script By MrHiep \n---------------------------------------------\nGame : " .. GameName .. "  " .. xbit .. "\nVersion: " .. GameVersion .. "\n---------------------------------------------";
-----------
setHexMemory("libil2cpp.so",0x3B05B0, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x3B0630, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x3BA4FC, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x3BA5CC, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x3BA68C, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x447D74, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x465AE0, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x4A6A94, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x216E260, "00 00 80 D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x216E520, "00 E0 AF D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x465AE0, "00 E0 AF D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x216E528, "00 E0 AF D2 C0 03 5F D6")
setHexMemory("libil2cpp.so",0x216E530, "00 E0 AF D2 C0 03 5F D6")
gg.toast("ANTIBAN: ACTIVED!")

-------------------FIELD----------

-----------------MENU-------------------------------
gg.toast('Mr.Hiep')

function HOME()
    MN = gg.choice({
        '  EXIT'
    }, nil, 'MrHiep')
    if MN == 1 then exitAPI() end
    HOMEDM=-1
end

----------------------ANTIBAN---------------------
function exitAPI()
    if _G.returnToHOM then
        returnToHOM()
end