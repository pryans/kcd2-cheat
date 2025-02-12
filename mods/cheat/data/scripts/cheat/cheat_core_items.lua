--[[
ItemManager
    GetItemOwner
    GetItemUIName
    AddOnEquipBuff
    GetItemName
    RemoveItem
    GetItem
    IsItemOversized
]]

-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_lockpick_id = "8d76f58e-a521-4205-a7e8-9ac077eee5f0"
Cheat.g_bread_id = "86e4ff24-88db-4024-abe6-46545fa0fbd1"
Cheat.g_cheesecake = "2a2ac072-a7eb-42f5-8757-776c02647559"
--Cheat.g_bow1_id = "5c23394a-3300-4570-a8b7-ef1c11519047" -- item can't be repaired over 0.6 health, shows as 100 cond in ui, bugged?
--Cheat.g_bow2_id = "94de53e1-8874-4a64-9837-ae758cb62e8b" -- item can't be repaired over 0.6 health, shows as 100 cond in ui, bugged?
Cheat.g_dagger1_id = "3a640e5d-d8bd-4e8b-b61d-8cd5180e79e7"
Cheat.g_shield1_id = "fd65fbb0-115b-4b63-a410-c235a69860a1"
Cheat.g_long_ranged_arrow_id = "d5e6764d-18ba-44cb-8dd0-6640a17785a8"         -- long-range arrow
Cheat.g_enhanced_long_range_arrow_id = "7db6b854-e307-4a47-ba39-943190b2469e" -- enhanced long-range arrow

-- #player.inventory:CreateItem("5c23394a-3300-4570-a8b7-ef1c11519047", 1, 1)
-- #player.inventory:CreateItem("86e4ff24-88db-4024-abe6-46545fa0fbd1", 1, 1)
-- #player.inventory:CreateItem("3a640e5d-d8bd-4e8b-b61d-8cd5180e79e7", 1, 1)
-- #player.inventory:CreateItem("fd65fbb0-115b-4b63-a410-c235a69860a1", 1, 1)
-- #Cheat:removeAllItems()
Cheat.g_item_database = {}
Cheat.g_item_database_search_fields = { "id", "l2name" }
Cheat.g_item_lookup = {}
Cheat.g_item_category_map = {
    MiscItem = 0,
    MeleeWeapon = 1,
    MissileWeapon = 2,
    Ammo = 3,
    Armor = 4,
    Food = 5,
    Money = 6,
    DiceBadge = 7,
    Document = 8,
    CraftingMaterial = 9,
    Herb = 10,
    AlchemyBase = 11,
    NPCTool = 12,
    Ointment = 13,
    Poison = 14,
    Die = 15,
    Helmet = 16,
    Key = 17,
    KeyRing = 18,
    QuickSlotContainer = 19,
    item = 21,
    PickableItem = 22,
    divisible_item = 23,
    weapon_equip = 24,
    player_item = 25,
    equippable_item = 26,
    weapon = 27,
    consumable_item = 28,
    Hood = 29,
    ItemAlias = 99
}
Cheat.g_player_data_m = "userdata: 050000000000024E" --male?
Cheat.g_player_data_f = "userdata: 050000000000024E" --female? don't know if you can play as a woman in KCD2 yet
Cheat.g_damageall_cat_ids = Cheat:createLookupTable(1, 2, 4, 16, 27, 29)
Cheat.g_removestolen_cat_ids = Cheat:createLookupTable(0, 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15, 16, 27, 29)
Cheat.g_ownstolen_cat_ids = Cheat:createLookupTable(0, 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15, 16, 27, 29)
Cheat.g_repairall_cat_ids = Cheat:createLookupTable(0, 1, 2, 4, 5, 9, 13, 14, 16, 27, 29)
Cheat.g_user_items = nil
Cheat.g_item_database_skip_tags = { Image = true, DocumentContent = true, Phase = true, ItemClasses = true, NPCTool = true, database = true }
Cheat.g_item_database_errors = 0

function Cheat:initItemDatabase()
    local p_func = function (tag, attributes)
        if not Cheat.g_item_database_skip_tags[tag] then
            if tag and attributes and attributes["Id"] and attributes["Name"] then
                -- Xml DB uses init caps, lowercase all the keys
                local item = Cheat:lowercaseTableKeys(attributes)

                -- ensure we haven't loaded this iteam already
                if not Cheat.g_item_lookup[item.id] then
                    local category_id = Cheat.g_item_category_map[tag]
                    if category_id then
                        item["category_name"] = tag
                        item["category_id"] = category_id
                        table.insert(Cheat.g_item_database, item)
                        --Cheat:logDebug("Adding item: %s:: %s", tag, Cheat:serializeTable(item))
                        Cheat.g_item_lookup[item.id] = item
                        return true
                    else
                        Cheat:logError("Item id [%s] has no category_id for [%s]", item.id, tag)
                        Cheat.g_item_database_errors = Cheat.g_item_database_errors + 1
                    end
                else
                    Cheat:logError("Item id [%s] is duplicated.", item.id)
                    Cheat.g_item_database_errors = Cheat.g_item_database_errors + 1
                end
            else
                Cheat:logError("Skipping item: %s:: %s", tag, Cheat:serializeTable(attributes))
                Cheat.g_item_database_errors = Cheat.g_item_database_errors + 1
            end
        end
        return false
    end

    -- seems like there are bunch of items in different xml files now ...
    Cheat:xmlLoadDatabase("libs/tables/item/item.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__system.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__rewards.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__horse.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__aux.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__alchemy.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__autotests.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__test.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__unique.xml", p_func)

    if Cheat.g_item_database_errors == 0 then
        Cheat:logDebug("Done loading XML item databases.")
    else
        Cheat:logError("Found [%d] errors while loading item XML databases.", Cheat.g_item_database_errors)
    end

    -- localize item database
    for _, item in pairs(Cheat.g_item_database) do
        local names = Cheat:getLocalizedItemNames(item)
        if names then
            item["l1name"] = names.field1
            item["l2name"] = names.field2
        else
            item["l1name"] = nil
            item["l2name"] = nil
        end
    end
end

function Cheat:conditionToHealth(condition)
    if condition then
        return Cheat:clamp(condition / 100, 0, 1)
    else
        return 1
    end
end

function Cheat:healthToCondition(health)
    if health then
        return Cheat:clamp(health * 100, 0, 100)
    else
        return 100
    end
end

function Cheat:hasItem(id)
    return player.inventory:GetCountOfClass(id) > 0
end

function Cheat:getItemCount(id)
    return player.inventory:GetCountOfClass(id)
end

function Cheat:getInventoryItemCount()
    -- this isn't accurate, GetInventoryTable() probably isn't an array
    -- #player.inventory:GetInventoryTable()
    local count = 0
    for _, v in pairs(player.inventory:GetInventoryTable()) do
        count = count + 1
    end
    return count
end

function Cheat:getItem(id)
    return Cheat.g_item_lookup[id]
end

function Cheat:addItem(searchOperation, amount, condition, notify, logSuccess)
    -- note that some items don't have condition (like lockpicks)
    -- player.inventory:CreateItemOfClass("86e4ff24-88db-4024-abe6-46545fa0fbd1", 5)
    -- player.inventory:CreateItem("86e4ff24-88db-4024-abe6-46545fa0fbd1", 0.5, 3)
    -- player.inventory:CreateItem("8d76f58e-a521-4205-a7e8-9ac077eee5f0", 0.5, 3)
    -- ItemUtils.CreateInvItem(player, "86e4ff24-88db-4024-abe6-46545fa0fbd1", 3, 0.5)
    -- #System.Log(tostring( Cheat:conditionToHealth(50) ))

    amount = Cheat:max(amount or 1, 1)
    local health = Cheat:conditionToHealth(condition)

    local item = Cheat:findItem(searchOperation)
    if not item then
        Cheat:logError("Item [%s] not found.", Cheat:serializeTable(searchOperation))
        return false
    end

    -- need to try and create quest items since so many commands delete/create items as part of their core functionality
    -- repairing items will delete all the quest items for example
    --[[
    if item.isquestitem == "true" then
        Cheat:logError("Cannot add a quest item: %s", Cheat:getItemDisplayText(item))
        return false
    end
    ]]

    local startingAmount = Cheat:getItemCount(item.id)
    local endingAmount = startingAmount + amount

    while true do
        -- some items seem like they can only be added 1 at a time?
        if not player.inventory:CreateItem(item.id, health, amount) then
            Cheat:logError("Failed to add item.")
            -- quest items that fail to be added will exit here
            return false
        end

        local currentAmount = Cheat:getItemCount(item.id)
        if currentAmount == endingAmount then
            break
        else
            amount = endingAmount - currentAmount
        end
    end

    local amountAdded = endingAmount - startingAmount

    if notify then
        Game.ShowItemsTransfer(item.id, -amountAdded)
    end

    if logSuccess then
        Cheat:logInfo("Added [%s] item [%s] to player's inventory (condition [%s]).", tostring(amountAdded), tostring(item.name), tostring(condition))
    end

    return true
end

function Cheat:removeItem(searchOperation, amount, notify, logSuccess)
    local item = Cheat:findItem(searchOperation)
    if not item then
        Cheat:logError("No item matching [%s] found in item database.", Cheat:serializeTable(searchOperation))
        return false
    end

    local itemCount = Cheat:getItemCount(item.id)
    if itemCount == 0 then
        Cheat:logError("Item [%s] not found in player's inventory.", tostring(item.name))
        return false
    end

    local amountToRemove = Cheat:clamp(amount, 1, itemCount)
    local amountRemoved = player.inventory:DeleteItemOfClass(item.id, amountToRemove)

    if amountRemoved == 0 then
        Cheat:logError("Failed to removed item [%s].", tostring(item.name))
        return false
    end

    if notify then
        Game.ShowItemsTransfer(item.id, -amountRemoved)
    end

    if logSuccess then
        Cheat:logInfo("Removed [%s] of item [%s] from player's inventory.", tostring(amountRemoved), tostring(item.name))
    end

    return true
end

function Cheat:removeAllItems()
    player.inventory:RemoveAllItems()
end

function Cheat:removeAllItem(id, notify)
    local amount = Cheat:getItemCount(id)
    local amount_removed = player.inventory:DeleteItemOfClass(id, amount)
    if notify then
        Game.ShowItemsTransfer(id, -amount_removed)
    end
    return amount_removed
end

function Cheat:findItems(searchOperation)
    if searchOperation then
        return Cheat:findRows(Cheat.g_item_database, searchOperation, Cheat.g_item_database_search_fields)
    else
        return Cheat.g_item_database
    end
end

function Cheat:findItem(searchOperation)
    -- if the searchKey is an item ID (UUID) we can skip the DB scan
    local item = Cheat:getItem(searchOperation.searchKey)
    if item then
        return item
    else
        return Cheat:findRow(Cheat.g_item_database, searchOperation, Cheat.g_item_database_search_fields)
    end
end

function Cheat:getUserItem(id, amount, condition)
    for _, userdata in pairs(player.inventory:GetInventoryTable()) do
        local item = Cheat:buildUserItem(userdata)
        if item and item.id == id then
            local matches = true

            if amount and item.amount ~= amount then
                matches = false
            end

            if condition and item.condition ~= condition then
                matches = false
            end

            if matches then
                return item
            end
        end
    end
    return nil
end

function Cheat:getUserItems()
    local items = {}
    local totalItems = 0;
    local backedupItems = 0
    for _, userdata in pairs(player.inventory:GetInventoryTable()) do
        totalItems = totalItems + 1
        local item = Cheat:buildUserItem(userdata)
        if item then
            table.insert(items, item)
            backedupItems = backedupItems + 1
        else
            Cheat:logError("Failed to backup user item: %s", Cheat:serializeTable(userdata))
        end
    end
    return items, totalItems, backedupItems
end

function Cheat:buildUserItem(userdata)
    local itemInstance = ItemManager.GetItem(userdata)
    if not itemInstance then
        return nil
    end

    local itemInstanceId = itemInstance.id
    local itemId = itemInstance.class
    --Cheat:logDebug("==================")
    --Cheat:logDebug("itemInstance: %s", Cheat:serializeTable(itemInstance))

    local itemDefinition = Cheat:getItem(itemId)
    if not itemDefinition then
        Cheat:logError("Item [%s] not found in item database.", itemId)
        return nil
    end

    --Cheat:logDebug("itemDefinition: %s", Cheat:serializeTable(itemDefinition))

    local itemInstanceOwer = tostring(ItemManager.GetItemOwner(itemInstanceId))
    local itemCondition = Cheat:healthToCondition(itemInstance.health)

    local userItem = {
        uid = itemInstanceId,
        id = itemId,
        amount = itemInstance.amount,
        condition = itemCondition,
        category_id = itemDefinition.category_id,
        uiname = itemDefinition.uiname,
        l1name = itemDefinition.l1name,
        l2name = itemDefinition.l2name,
        name = itemDefinition.name,
        owner = itemInstanceOwer
    }
    --Cheat:logDebug("userItem: %s", Cheat:serializeTable(userItem))
    return userItem
end

function Cheat:recreateItems(mode, condition)
    condition = Cheat:clamp(condition, 0, 100)

    for _, item in ipairs(Cheat:getUserItems()) do
        local shouldDelete = false
        local shouldRecreate = false

        if mode == "damageall" then
            if item.condition > condition and Cheat.g_damageall_cat_ids[item.category_id] then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if mode == "removestolen" then
            if Cheat.g_removestolen_cat_ids[item.category_id] and item.owner ~= Cheat.g_player_data_m and item.owner ~= Cheat.g_player_data_f then
                shouldDelete = true
                shouldRecreate = false
            end
        end

        if mode == "ownstolen" then
            if Cheat.g_ownstolen_cat_ids[item.category_id] and item.owner ~= Cheat.g_player_data_m and item.owner ~= Cheat.g_player_data_f then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if mode == "repairall" then
            if item.condition < condition and Cheat.g_repairall_cat_ids[item.category_id] then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if shouldDelete then
            Cheat:logDebug("shouldDelete [%s]", Cheat:serializeTable(item))
            Cheat:removeItem({ exact = true, searchKey = item.id }, item.amount, false, false)
        end

        if shouldRecreate then
            Cheat:logDebug("shouldRecreate [%s]", Cheat:serializeTable(item))
            Cheat:addItem({ exact = true, searchKey = item.id }, item.amount, condition, false, false)
        end
    end

    return true
end

function Cheat:getItemDisplayText(item)
    if not item then
        return "nil"
    end
    -- Create a console friendly version of the item.
    local data = {}
    for k, v in pairs(item) do
        if k ~= "id" and k ~= "l2name" and k ~= "l1name" then
            data[k] = v
        end
    end
    local name = item.name
    if item.l1name then
        name = item.l1name
    end
    if item.l2name then
        name = item.l2name
    end
    return string.format("name=%s id=%s %s", tostring(name), tostring(item.id), Cheat:serializeTable(data))
end

-- ============================================================================
-- cheat_find_items
-- ============================================================================
Cheat.cheat_find_items_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Legacy.") end
}
Cheat:createCommand("cheat_find_items", "Cheat:cheat_find_items(%line)", Cheat.cheat_find_items_args,
    "Perform case-insensitive search for items by ID and localized name.",
    "Show all items", "cheat_find_items",
    "Matches items with 'long-range arrow' in their names", "cheat_find_items any:long-range arrow",
    "Matches item named 'long-range arrow'", "cheat_find_items exact:long-range arrow"
)
function Cheat:cheat_find_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_items_args)
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local token, tokenErr = Cheat:argsGet(args, "token")
    if anyErr or exactErr or tokenErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    elseif token then
        searchOperation = { exact = false, searchKey = token }
    end

    local items = Cheat:findItems(searchOperation)
    if #items == 0 then
        return false, nil
    end

    for _, item in ipairs(items) do
        Cheat:logInfo("Item: %s", Cheat:getItemDisplayText(item))
    end

    Cheat:logInfo("Found [%s] items for search [%s].", tostring(#items), Cheat:serializeTable(searchOperation))
    return true, items
end

-- ============================================================================
-- cheat_add_item
-- ============================================================================
Cheat.cheat_add_item_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    id = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Legacy.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The number of items to add. Default 1.") end,
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 100, showHelp, "The condition of the item added. Default 100.") end
}
Cheat:createCommand("cheat_add_item", "Cheat:cheat_add_item(%line)", Cheat.cheat_add_item_args,
    "Adds an item to the player's inventory.",
    "Adds 1 item with 'bow' in anywhere in name", "cheat_add_item any:bow",
    "Adds 1 item with 'hunting arrow' anywhere in name", "cheat_add_item any:hunting arrow",
    "Adds 2 items exactly named 'military sword' with 50% condition", "cheat_add_item exact:military sword amount:10 condition:50")
function Cheat:cheat_add_item(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_item_args)
    local token, tokenErr = Cheat:argsGet(args, "id")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    if tokenErr or anyErr or exactErr or amountErr or conditionErr then
        return false
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    elseif token then
        searchOperation = { exact = false, searchKey = token }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        return false
    end

    return Cheat:addItem(searchOperation, amount, condition, true, true)
end

-- cheat_add_all_items
-- ============================================================================
Cheat:createCommand("cheat_add_all_items", "Cheat:cheat_add_all_items()", nil,
    "Adds all items the player's inventory. Enjoy!",
    "Add all items", "cheat_add_all_items")
function Cheat:cheat_add_all_items()
    for _, item in ipairs(Cheat:findItems()) do
        player.inventory:CreateItem(item.id, 1, 1)
    end
    Cheat:logInfo("All items added.")
    return true
end

-- ============================================================================
-- cheat_remove_item
-- ============================================================================
Cheat.cheat_remove_item_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    id = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Legacy.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The number of items to remove. Default 1.") end,
}
Cheat:createCommand("cheat_remove_item", "Cheat:cheat_remove_item(%line)", Cheat.cheat_remove_item_args,
    "Removes an item to the player's inventory.",
    "Removes the last item with 'bow' in its name", "cheat_remove_item id:bow",
    "Removes the item ui_nm_arrow_hunter by ID", "cheat_remove_item id:802507e9-d620-47b5-ae66-08fcc314e26a",
    "Removes 10 items ui_nm_arrow_hunter by fullname", "cheat_remove_item id:ui_nm_arrow_hunter amount:10")
function Cheat:cheat_remove_item(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_remove_item_args)
    local token, tokenErr = Cheat:argsGet(args, "id")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    if tokenErr or anyErr or exactErr or amountErr then
        return false
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    elseif token then
        searchOperation = { exact = false, searchKey = token }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        return false
    end

    return Cheat:removeItem(searchOperation, amount, true, true)
end

-- ============================================================================
-- cheat_remove_items
-- ============================================================================
Cheat:createCommand("cheat_remove_items", "Cheat:cheat_remove_items()", nil,
    "Removes all items in the player's inventory.\n$4THIS DELETES YOUR INVENTORY! Move items you want to a stash first.",
    "Delete your inventory.", "cheat_remove_items")
function Cheat:cheat_remove_items()
    Cheat:removeAllItems()
    Cheat:logInfo("All inventory items deleted.")
    return true
end

-- ============================================================================
-- cheat_remove_stolen_items
-- ============================================================================
Cheat:createCommand("cheat_remove_stolen_items", "Cheat:cheat_remove_stolen_items()", nil,
    "Removes all stolen items from your inventory.",
    "Remove stolen items.", "cheat_remove_stolen_items")
function Cheat:cheat_remove_stolen_items()
    Cheat:recreateItems("removestolen")
    Cheat:logInfo("All stolen items removed.")
    return true
end

-- ============================================================================
-- cheat_own_stolen_items
-- ============================================================================
Cheat:createCommand("cheat_own_stolen_items", "Cheat:cheat_own_stolen_items()", nil,
    "Makes you the owner of all stolen items in your inventory.\n$8This removes the stolen flag from the item.",
    "Take ownership of stolen items", "cheat_own_stolen_items")
function Cheat:cheat_own_stolen_items()
    Cheat:recreateItems("ownstolen")
    Cheat:logInfo("All stolen items are now owned by the player.")
    return true
end

-- ============================================================================
-- cheat_repair_items
-- ============================================================================
Cheat.cheat_repair_items_args = {
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 100, showHelp, "The item condition to apply between 0 and 100. Default 100.") end
}
Cheat:createCommand("cheat_repair_items", "Cheat:cheat_repair_items(%line)", Cheat.cheat_repair_items_args,
    "Repairs all damaged items in your inventory to at least the given condition.\n$4This can uneqip items so don't do this in combat.",
    "Repair all items to 75%.", "cheat_repair_items condition:75")
function Cheat:cheat_repair_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_repair_items_args)
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    if conditionErr then
        return false
    end
    Cheat:recreateItems("repairall", condition)
    Cheat:logInfo("All items repaired to at least [%d] condition.", condition)
    return true
end

-- ============================================================================
-- cheat_damage_items
-- ============================================================================
Cheat.cheat_damage_items_args = {
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 50, showHelp, "The item condition to apply between 0 and 100. Default 50.") end
}
Cheat:createCommand("cheat_damage_items", "Cheat:cheat_damage_items(%line)", Cheat.cheat_damage_items_args,
    "Damages all weapons and armor in your inventory to at most given condition.\n$4This can uneqip items so don't do this in combat.",
    "Damage all weapons and armor to 25%", "cheat_damage_items condition:25")
function Cheat:cheat_damage_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_damage_items_args)
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    if conditionErr then
        return false
    end
    condition = Cheat:clamp(condition, 0, 100)
    Cheat:recreateItems("damageall", condition)
    Cheat:logInfo("All items damaged to at most [%d] condition.", condition)
    return true
end

-- ============================================================================
-- cheat_backup_inventory
-- ============================================================================
Cheat:createCommand("cheat_backup_inventory", "Cheat:cheat_backup_inventory()", nil,
    "Saves inventory to temporary game memory.\n" ..
    "Intended for situations where the contents of your inventory will be lost due to game mechanics.\n" ..
    "i.e. A Woman's Lot (DLC). See cheat_restore_inventory.",
    "Saves all items", "cheat_backup_inventory")
function Cheat:cheat_backup_inventory()
    local items, totalItems, backedupItems = Cheat:getUserItems()
    if totalItems > 0 and totalItems == backedupItems then
        Cheat.g_user_items = items
        Cheat:logInfo("Backup completed.")
        return true
    else
        Cheat.g_user_items = nil
        Cheat:logInfo("Failed to backup [%d] of [%d] items.", totalItems - backedupItems, totalItems)
        return false
    end
end

-- ============================================================================
-- cheat_restore_inventory
-- ============================================================================
Cheat:createCommand("cheat_restore_inventory", "Cheat:cheat_restore_inventory()", nil,
    "Loads all items stored by cheat_backup_inventory in this game session.",
    "Load all items", "cheat_restore_inventory")
function Cheat:cheat_restore_inventory()
    if not Cheat.g_user_items then
        Cheat:logError("Have to run cheat_backup_inventory first!")
        return false
    end

    for _, userItem in ipairs(Cheat.g_user_items) do
        Cheat:addItem({ exact = true, searchKey = userItem.id }, userItem.amount, userItem.condition, true, true)
    end
    Cheat.g_user_items = nil

    return true
end

-- ============================================================================
-- test_core_items
-- ============================================================================
function Cheat:test_core_items()
    Cheat:beginTest("test_core_items")

    local item, items, result = nil, nil, nil

    -- before testing
    Cheat:removeAllItems()
    Cheat:testAssert("remove all items before testing", Cheat:getInventoryItemCount() == 0)

    result, items = Cheat:cheat_find_items(nil)
    Cheat:testAssert("cheat_find_items 1", result and items and #items > 0)

    result, items = Cheat:cheat_find_items(" ")
    Cheat:testAssert("cheat_find_items 2", result and items and #items > 0)

    result, items = Cheat:cheat_find_items("token:" .. Cheat.g_lockpick_id)
    Cheat:testAssert("cheat_find_items 3", result and items and #items == 1 and items[1].id == Cheat.g_lockpick_id)

    -- cheat_add_item
    Cheat:testAssertFalse("cheat_add_item invalid 1", Cheat:cheat_add_item())
    Cheat:testAssertFalse("cheat_add_item invalid 2", Cheat:cheat_add_item(nil))
    Cheat:testAssertFalse("cheat_add_item invalid 3", Cheat:cheat_add_item(""))
    Cheat:removeAllItems()

    -- cheat_add_item default amount and condition
    Cheat:testAssert("cheat_add_item bread id 1.1", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. ""))
    Cheat:testAssert("cheat_add_item bread id 1.2", Cheat:getItemCount(Cheat.g_bread_id) == 1)
    Cheat:removeAllItems()

    -- cheat_add_item with amount and default condition
    Cheat:testAssert("cheat_add_item bread id 2.1", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. " amount:2"))
    Cheat:testAssert("cheat_add_item bread id 2.2", Cheat:getItemCount(Cheat.g_bread_id) == 2)
    Cheat:removeAllItems()

    -- cheat_add_item and condition and default amount
    Cheat:testAssert("cheat_add_item bread id 3.1", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. " condition:50"))
    item = Cheat:getUserItem(Cheat.g_bread_id)
    Cheat:testAssert("cheat_add_item bread id 3.2", item and item.id == Cheat.g_bread_id)
    Cheat:testAssert("cheat_add_item bread id 3.3", item and item.amount == 1)
    Cheat:testAssert("cheat_add_item bread id 3.4", item and item.condition == 50)
    Cheat:removeAllItems()

    -- cheat_add_item with amount and condition
    Cheat:testAssert("cheat_add_item bead id 4.1", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. " amount:4 condition:40"))
    item = Cheat:getUserItem(Cheat.g_bread_id)
    Cheat:testAssert("cheat_add_item bead id 4.2", item and item.id == Cheat.g_bread_id)
    Cheat:testAssert("cheat_add_item bead id 4.3", item and item.amount == 4)
    Cheat:testAssert("cheat_add_item bead id 4.4", item and item.condition == 40)
    Cheat:removeAllItems()

    -- cheat_add_item using localized name
    Cheat:testAssert("cheat_add_item lockpick name 5.1", Cheat:cheat_add_item("id:lockpick"))
    item = Cheat:getUserItem(Cheat.g_lockpick_id)
    Cheat:testAssert("cheat_add_item lockpick name 5.2", item and item.id == Cheat.g_lockpick_id)
    Cheat:testAssert("cheat_add_item lockpick name 5.3", item and item.amount == 1)
    Cheat:testAssert("cheat_add_item lockpick name 5.4", item and item.condition == 100)
    Cheat:removeAllItems()

    -- cheat_remove_item
    Cheat:testAssertFalse("cheat_remove_item invalid 6.1", Cheat:cheat_remove_item())
    Cheat:testAssertFalse("cheat_remove_item invalid 6.2", Cheat:cheat_remove_item(nil))
    Cheat:testAssertFalse("cheat_remove_item invalid 6.3", Cheat:cheat_remove_item(""))
    Cheat:testAssertFalse("cheat_remove_item invalid 6.4", Cheat:cheat_remove_item("id:"))
    Cheat:testAssert("cheat_remove_item 6.5", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. " amount:3"))
    Cheat:testAssert("cheat_remove_item 6.6", Cheat:cheat_remove_item("id:" .. Cheat.g_bread_id))
    Cheat:testAssert("cheat_remove_item 6.7", Cheat:getItemCount(Cheat.g_bread_id) == 2)
    Cheat:testAssert("cheat_remove_item 6.8", Cheat:cheat_remove_item("id:" .. Cheat.g_bread_id .. " amount:2"))
    Cheat:testAssert("cheat_remove_item 6.9", Cheat:getItemCount(Cheat.g_bread_id) == 0)
    Cheat:removeAllItems()

    -- cheat_remove_items
    Cheat:testAssert("cheat_remove_items 7.1", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. " amount:10"))
    Cheat:testAssert("cheat_remove_items 7.2", Cheat:cheat_remove_items())
    Cheat:testAssert("cheat_remove_items 7.3", Cheat:getInventoryItemCount() == 0)
    Cheat:removeAllItems()

    -- cheat_damage_items (default 50)
    Cheat:testAssert("cheat_damage_items 8.1", Cheat:cheat_add_item("id:" .. Cheat.g_dagger1_id .. " amount:1 condition:100"))
    Cheat:testAssert("cheat_damage_items 8.2", Cheat:cheat_add_item("id:" .. Cheat.g_shield1_id .. " amount:1 condition:100"))
    Cheat:testAssert("cheat_damage_items 8.3", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 100))
    Cheat:testAssert("cheat_damage_items 8.4", Cheat:getUserItem(Cheat.g_shield1_id, 1, 100))
    Cheat:testAssert("cheat_damage_items 8.5", Cheat:cheat_damage_items())
    Cheat:testAssert("cheat_damage_items 8.6", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_damage_items 8.7", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 50))
    Cheat:testAssert("cheat_damage_items 8.8", Cheat:getUserItem(Cheat.g_shield1_id, 1, 50))
    Cheat:removeAllItems()

    -- cheat_damage_items (custom condition)
    Cheat:testAssert("cheat_damage_items 9.1", Cheat:cheat_add_item("id:" .. Cheat.g_dagger1_id .. " amount:1 condition:100"))
    Cheat:testAssert("cheat_damage_items 9.2", Cheat:cheat_add_item("id:" .. Cheat.g_shield1_id .. " amount:1 condition:20"))
    Cheat:testAssert("cheat_damage_items 9.3", Cheat:cheat_damage_items("condition:25"))
    Cheat:testAssert("cheat_damage_items 9.4", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_damage_items 9.5", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 25))
    Cheat:testAssert("cheat_damage_items 9.6", Cheat:getUserItem(Cheat.g_shield1_id, 1, 20))
    Cheat:removeAllItems()

    -- cheat_repair_items (default condition of 100)
    Cheat:testAssert("cheat_repair_items 10.1", Cheat:cheat_add_item("id:" .. Cheat.g_dagger1_id .. " amount:1 condition:25"))
    Cheat:testAssert("cheat_repair_items 10.2", Cheat:cheat_add_item("id:" .. Cheat.g_shield1_id .. " amount:1 condition:25"))
    Cheat:testAssert("cheat_repair_items 10.3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_repair_items 10.4", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 25))
    Cheat:testAssert("cheat_repair_items 10.5", Cheat:getUserItem(Cheat.g_shield1_id, 1, 25))
    Cheat:testAssert("cheat_repair_items 10.6", Cheat:cheat_repair_items())
    Cheat:testAssert("cheat_repair_items 10.7", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 100))
    Cheat:testAssert("cheat_repair_items 10.8", Cheat:getUserItem(Cheat.g_shield1_id, 1, 100))
    Cheat:removeAllItems()

    -- cheat_repair_items (custom conditions)
    Cheat:testAssert("cheat_repair_items 11.1", Cheat:cheat_add_item("id:" .. Cheat.g_dagger1_id .. " amount:1 condition:25"))
    Cheat:testAssert("cheat_repair_items 11.2", Cheat:cheat_add_item("id:" .. Cheat.g_shield1_id .. " amount:1 condition:80"))
    Cheat:testAssert("cheat_repair_items 11.3", Cheat:cheat_repair_items("condition:75"))
    Cheat:testAssert("cheat_repair_items 11.4", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_repair_items 11.5", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 75))
    Cheat:testAssert("cheat_repair_items 11.6", Cheat:getUserItem(Cheat.g_shield1_id, 1, 80))
    Cheat:removeAllItems()

    -- cheat_remove_stolen_items
    Cheat:testAssert("cheat_remove_stolen_items 12.1", Cheat:cheat_add_item("id:" .. Cheat.g_dagger1_id))
    Cheat:testAssert("cheat_remove_stolen_items 12.2", Cheat:cheat_remove_stolen_items())
    -- can't change ownre from lua afaik

    -- cheat_own_stolen_items
    Cheat:testAssert("cheat_own_stolen_items 13.1", Cheat:cheat_add_item("id:" .. Cheat.g_dagger1_id))
    Cheat:testAssert("cheat_own_stolen_items 13.2", Cheat:cheat_own_stolen_items())
    -- can't change ownre from lua afaik

    -- cheat_backup_inventory + cheat_restore_inventory
    Cheat:removeAllItems()
    Cheat.g_user_items = nil
    Cheat:testAssert("cheat_backup_inventory 14.1", Cheat:cheat_add_item("id:" .. Cheat.g_cheesecake .. " amount:2 condition:10"))
    Cheat:testAssert("cheat_backup_inventory 14.2", Cheat:cheat_add_item("id:" .. Cheat.g_bread_id .. " amount:3 condition:90"))
    Cheat:testAssert("cheat_backup_inventory 14.3", Cheat:cheat_backup_inventory())
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_restore_inventory 14.4", Cheat:cheat_restore_inventory())
    Cheat:testAssert("cheat_restore_inventory 14.5", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_restore_inventory 14.6", Cheat:getUserItem(Cheat.g_cheesecake, 2, 10))
    Cheat:testAssert("cheat_restore_inventory 14.7", Cheat:getUserItem(Cheat.g_bread_id, 3, 90))

    -- any\exact - cheat_find_items - any name
    result, items = Cheat:cheat_find_items("any:long-range arrow")
    Cheat:testAssert("cheat_find_items any name 15.1", result and items and #items == 2)
    Cheat:testAssert("cheat_find_items any name 15.2", result and items and items[1].id == Cheat.g_enhanced_long_range_arrow_id)
    Cheat:testAssert("cheat_find_items any name 15.3", result and items and items[2].id == Cheat.g_long_ranged_arrow_id)
    Cheat:removeAllItems()

    -- any\exact - cheat_find_items - any id
    result, items = Cheat:cheat_find_items("any:" .. Cheat.g_enhanced_long_range_arrow_id)
    Cheat:testAssert("cheat_find_items any id 16.1", result and items and #items == 1)
    Cheat:testAssert("cheat_find_items any id 16.2", result and items and items[1].id == Cheat.g_enhanced_long_range_arrow_id)
    Cheat:removeAllItems()

    -- any\exact - cheat_find_items - exact name
    result, items = Cheat:cheat_find_items("exact:long-range arrow")
    Cheat:testAssert("cheat_find_items exact name 17.1", result and items and #items == 1)
    Cheat:testAssert("cheat_find_items exact name 17.2", result and items and items[1].id == Cheat.g_long_ranged_arrow_id)
    Cheat:removeAllItems()

    -- any\exact - cheat_find_items - exact id
    result, items = Cheat:cheat_find_items("exact:" .. Cheat.g_enhanced_long_range_arrow_id)
    Cheat:testAssert("cheat_find_items exact id 18.1", result and items and #items == 1)
    Cheat:testAssert("cheat_find_items exact id 18.2", result and items and items[1].id == Cheat.g_enhanced_long_range_arrow_id)
    Cheat:removeAllItems()

    -- any\exact - cheat_add_item - any name
    Cheat:testAssert("cheat_add_item any name 19.1", Cheat:cheat_add_item("any:long-range arrow"))
    Cheat:testAssert("cheat_add_item any name 19.2", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)
    Cheat:removeAllItems()

    -- any\exact - cheat_add_item - any id
    Cheat:testAssert("cheat_add_item any id 20.1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_add_item any id 20.2", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)
    Cheat:removeAllItems()

    -- any\exact - cheat_add_item - exact name
    Cheat:testAssert("cheat_add_item exact name 21.1", Cheat:cheat_add_item("exact:enhanced long-range arrow"))
    Cheat:testAssert("cheat_add_item exact name 21.2", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 1)
    Cheat:removeAllItems()

    -- any\exact - cheat_add_item - exact id
    Cheat:testAssert("cheat_add_item exact id 22.1", Cheat:cheat_add_item("exact:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_add_item exact id 22.2", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 1)
    Cheat:removeAllItems()

    -- any\exact - cheat_remove_item - any name
    Cheat:testAssert("cheat_remove_item any name 23.1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item any name 23.2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item any name 23.3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item any name 23.4", Cheat:cheat_remove_item("any:long-range arrow"))
    Cheat:testAssert("cheat_remove_item any name 23.5", Cheat:getInventoryItemCount() == 1) -- removes the last one
    Cheat:removeAllItems()

    -- any\exact - cheat_remove_item - any id
    Cheat:testAssert("cheat_remove_item any id  24.1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item any id  24.2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item any id  24.3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item any id  24.4", Cheat:cheat_remove_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item any id  24.5", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 0)
    Cheat:testAssert("cheat_remove_item any id  24.6", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 1)
    Cheat:removeAllItems()

    -- any\exact - cheat_remove_item - exact name
    Cheat:testAssert("cheat_remove_item exact name 25.1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item exact name 25.2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item exact name 25.3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item exact name 25.4", Cheat:cheat_remove_item("exact:enhanced long-range arrow"))
    Cheat:testAssert("cheat_remove_item exact name 25.5", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)
    Cheat:testAssert("cheat_remove_item exact name 25.6", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 0)
    Cheat:removeAllItems()

    -- any\exact - cheat_remove_item - exact id
    Cheat:testAssert("cheat_remove_item exact id 26.1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item exact id 26.2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item exact id 26.3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item exact id 26.4", Cheat:cheat_remove_item("exact:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item exact id 26.5", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)
    Cheat:testAssert("cheat_remove_item exact id 26.6", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 0)
    Cheat:removeAllItems()

    -- try and add quest items
    Cheat:testAssert("cheat_add_item add quest items 27.1", Cheat:cheat_add_item("exact:2cf06381-7692-4f3c-b917-e98dd3b5f8e3"))
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() > 0)
    Cheat:removeAllItems()

    -- cheat_add_all_items (this will freeze the game for like 30 seconds)
    Cheat:testAssert("cheat_add_all_items 15.1", Cheat:cheat_add_all_items())
    Cheat:testAssert("cheat_add_all_items 15.2", Cheat:getInventoryItemCount() >= 4732)
    Cheat:removeAllItems()

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_items.lua loaded")
