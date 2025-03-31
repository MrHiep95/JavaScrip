gg.setVisible(false)
functionTable = { -- table(bb0de53)
	[1] = { -- table(53e2390)
		['edits'] = { -- table(bab3489)
			[1] = { -- table(cdd4c8e)
				['Class'] = 'StaticDataManager',
				['methodEdits'] = { -- table(b610caf)
					[1] = { -- table(889e8bc)
						['MethodName'] = 'GetAutoBanData',
						['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
					},
				},
			},
            [2] = { -- table(cdd4c8e)
				['Class'] = 'AutoBanController',
				['methodEdits'] = { -- table(b610caf)
					[2] = { -- table(889e8bc)
						['MethodName'] = 'CheckCurrencyBan',
						['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
					},
				},
			},
            [3] = { -- table(cdd4c8e)
                ['Class'] = 'AutoBanController',
                ['methodEdits'] = { -- table(b610caf)
                    [3] = { -- table(889e8bc)
                        ['MethodName'] = 'CheckStageBan',
                        ['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [4] = { -- table(cdd4c8e)
                ['Class'] = 'AutoBanController',
                ['methodEdits'] = { -- table(b610caf)
                    [4] = { -- table(889e8bc)
                        ['MethodName'] = 'CheckGrowthLevelBan',
                        ['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [5] = { -- table(cdd4c8e)
                ['Class'] = 'UserPlayController',
                ['methodEdits'] = { -- table(b610caf)
                    [5] = { -- table(889e8bc)
                        ['MethodName'] = 'CheckIsBanned',
                        ['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [6] = { -- table(cdd4c8e)
                ['Class'] = 'AutoBanService',
                ['methodEdits'] = { -- table(b610caf)
                    [7] = { -- table(889e8bc)
                        ['MethodName'] = 'BanSelf',
                        ['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [8] = { -- table(cdd4c8e)
                ['Class'] = 'UserPlayServiceServer',
                ['methodEdits'] = { -- table(b610caf)
                    [8] = { -- table(889e8bc)
                        ['MethodName'] = 'CheckIsBanned',
                        ['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [9] = { -- table(cdd4c8e)
                ['Class'] = 'SharedStaticDataWrapper',
                ['methodEdits'] = { -- table(b610caf)
                    [9] = { -- table(889e8bc)
                        ['MethodName'] = 'get_AutoBan',
                        ['edit'] = '\x00\x00\x80\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [10] = { -- table(cdd4c8e)
                ['Class'] = 'StaticDataAutoBan',
                ['methodEdits'] = { -- table(b610caf)
                    [10] = { -- table(889e8bc)
                        ['MethodName'] = 'get_AmountPerDaily',
                        ['edit'] = '\x00\xE0\xAF\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [11] = { -- table(cdd4c8e)
                ['Class'] = 'StaticDataAutoBan',
                ['methodEdits'] = { -- table(b610caf)
                    [11] = { -- table(889e8bc)
                        ['MethodName'] = 'get_AmountPerSpend',
                        ['edit'] = '\x00\xE0\xAF\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
            [12] = { -- table(cdd4c8e)
                ['Class'] = 'StaticDataAutoBan',
                ['methodEdits'] = { -- table(b610caf)
                    [12] = { -- table(889e8bc)
                        ['MethodName'] = 'get_DisposeableAmount',
                        ['edit'] = '\x00\xE0\xAF\xD2\xC0\x03\x5F\xD6',
                    },
                },
            },
		},
		['functionName'] = 'Antiban',
	},

	},
}
v = gg.getTargetInfo();
if v.x64 then
	xbit = "x64";
else
	xbit = "x32";
end
GameName = gg.getTargetInfo().label;
GameVersion = gg.getTargetInfo().versionName;
scriptTitle = "Script By xGhostZ \n---------------------------------------------\nGame : " .. GameName .. "  " .. xbit .. "bit\nVersion: " .. GameVersion.." \n---------------------------------------------";


local file = io.open("Il2cppApi.lua","r")
if file == nil then
    io.open("Il2cppApi.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()
end
require("Il2cppApi")
Il2cpp()

restoreFields = {}
restoreMethods = {}

function handleClick(editsTable, functionIndex)
    if restoreFields[functionIndex] or restoreMethods[functionIndex] then
        if restoreFields[functionIndex] then
            gg.setValues(restoreFields[functionIndex])
            restoreFields[functionIndex] = nil
        end
        if restoreMethods[functionIndex] then
            gg.setValues(restoreMethods[functionIndex])
            restoreMethods[functionIndex] = nil
        end
        gg.alert(functionTable[functionIndex].functionName .. " Disabled")
    else
        for i, v in pairs(editsTable) do
            local getMethods = false
            local getFields = false
            if v.fieldEdits then
                getFields = true
            end
            if v.methodEdits then
                getMethods = true
            end
            local classTable = Il2cpp.FindClass({
                {
                    Class = v.Class,
                    MethodsDump = getMethods,
                    FieldsDump = getFields
                }})[1][1]
            if v.fieldEdits then
                restoreFields[functionIndex] = {}
                handleFieldEdits(v.Class, v.fieldEdits, classTable, functionIndex)
            end
            if v.methodEdits then
                restoreMethods[functionIndex] = {}
                handleMethodEdits(v.Class, v.methodEdits, classTable, functionIndex)
            end
        end
        gg.alert(functionTable[functionIndex].functionName .. " Enabled")
    end
end

function handleFieldEdits(className, fieldEditsTable, classTable, functionIndex)
    local classInstances = Il2cpp.FindObject({className})[1]
    local tempTable = {}
    for i, v in pairs(classInstances) do
        for index, value in pairs(fieldEditsTable) do
            for fieldIndex, fieldData in pairs(classTable.Fields) do
                if value.FieldName == fieldData.FieldName then
                    tempTable[#tempTable + 1] = {
                        address = v.address + tonumber(fieldData.Offset, 16),
                        flags = gg.TYPE_DWORD,
                        value = value.edit
                    }
                end
            end
        end
    end
    restoreFields[functionIndex] = gg.getValues(tempTable)
    gg.setValues(tempTable)
end

function handleMethodEdits(className, methodEditsTable, classTable, functionIndex)
    for i, v in pairs(methodEditsTable) do
        for index, value in pairs(classTable.Methods) do
            if v.MethodName == value.MethodName then
                restoreMethods[functionIndex] = backupValues(tonumber(value.AddressInMemory, 16), #v.edit)
                Il2cpp.PatchesAddress(tonumber(value.AddressInMemory, 16), v.edit)
            end
        end
    end
end

function backupValues(address, byteCount)
    local tempTable = {}
    local offset = 0
    for i = 1, byteCount do
        tempTable[i] = {
            address = address + offset,
            flags = gg.TYPE_BYTE
        }
        offset = offset + 1
    end
    tempTable = gg.getValues(tempTable)
    return tempTable
end

function home()
    local menuItems = {}
    for i, v in pairs(functionTable) do
        menuItems[i] = v.functionName
    end
    local menu = gg.choice(menuItems, nil, scriptTitle)
    if menu ~= nil then
        handleClick(functionTable[menu].edits, menu)
    end
end

    if _G.returnToHOM then
        returnToHOM()
    else
        os.exit()
    end
end
home()
