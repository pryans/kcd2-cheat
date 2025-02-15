Cheat.g_localization_soul_database = {}
Cheat.g_localization_item_database = {}

function Cheat:initLocalizationDatabase()
    --[[
    text_rich_presence.xml
    text_ui_dialog.xml
    text_ui_ingame.xml
    text_ui_items.xml
    text_ui_menu.xml
    text_ui_menus.xml
    text_ui_minigames.xml
    text_ui_misc.xml
    text_ui_quest.xml
    text_ui_soul.xml
    text_ui_tutorials.xml
    ]]
    Cheat.g_localization_soul_database = Cheat:xmlLoadLocalizationDatabase("Localization/text_ui_soul.xml")
    Cheat.g_localization_item_database = Cheat:xmlLoadLocalizationDatabase("Localization/text_ui_items.xml")
end

function Cheat:getLocalizedNames(databse, key)
    if not databse then
        return nil
    end

    if not key then
        return nil
    end

    return databse[key]
end

function Cheat:getLocalizedSoulNames(soul)
    return Cheat:getLocalizedNames(Cheat.g_localization_soul_database, soul:GetNameStringId())
end

function Cheat:getLocalizedItemNames(item)
    return Cheat:getLocalizedNames(Cheat.g_localization_item_database, item.uiname)
end

function Cheat:getLocalizedEntityNames(entity)
    if entity then
        if entity["soul"] then
            return Cheat:getLocalizedSoulNames(entity.soul)
        elseif entity["uiname"] then
            return Cheat:getLocalizedItemNames(entity)
        end
    end
    return nil
end

-- #Cheat:tprint(Cheat:getLocalizedSoulNames(Cheat:getTargetedEntity().soul))
-- #Cheat:log(Cheat:getLocalizedName(Cheat:getTargetedEntity()))
function Cheat:getLocalizedName(entity)
    if not entity then
        return nil
    end

    local lnames = nil
    if entity["soul"] then
        lnames = Cheat:getLocalizedSoulNames(entity.soul)
    elseif entity["uiname"] then
        lnames = Cheat:getLocalizedItemNames(entity)
    end

    local name = nil
    if lnames and lnames.field1 then
        name = lnames.field1
    elseif lnames and lnames.field2 then
        name = lnames.field2
    else
        local ename = nil

        if (type(entity) == "userdata") then
            local e = System.GetEntity(entity)
            if (e) then
                ename = e:GetName()
            end
        elseif (type(entity) == "table") then
            ename = entity:GetName()
        end

        if ename then
            name = ename
        else
            name = "unknown"
        end
    end
    return name
end

function Cheat:findUIName(databse, searchKey)
    if not databse then
        return nil
    end

    searchKey = Cheat:toLower(Cheat:trimToNil(searchKey))
    if not searchKey then
        return nil
    end

    local matches = {}
    for uiName, fields in pairs(databse) do
        if string.find(fields.field1, searchKey, 1, true) or string.find(fields.field2, searchKey, 1, true) then
            local match = {
                uiname = uiName,
                localizedName1 = fields.field1,
                localizedName2 = fields.field2,
                exactMatch = fields.field1 == searchKey or fields.field2 == searchKey
            }
            table.insert(matches, match)
        end
    end
    return matches
end

function Cheat:findSoulUIName(searchKey)
    return Cheat:findUIName(Cheat.g_localization_soul_database, searchKey)
end

function Cheat:findItemUIName(searchKey)
    return Cheat:findUIName(Cheat.g_localization_item_database, searchKey)
end
