---@class soul
local soul = {}

---Adds blood to the soul.
---@param BodyParts wh.entitymodule.BodyParts (required)
---@param Values wh.conceptmodule.Floats (required)
---@param Absolute boolean (optional, default: false)
function soul:AddBlood(BodyParts, Values, Absolute)
end

---Adds specified buff to all souls on input
---@param Buff wh.rpgmodule.BuffGUID (required)
---@param ParentPerk wh.rpgmodule.PerkGUID (optional)
function soul.AddBuff(Buff, ParentPerk)
end

---Adds dirt to the soul.
---@param Value float (required)
---@param Absolute boolean (optional, default: false)
function soul:AddDirt(Value, Absolute)
end

---Adds XP from level to level for a skill.
---@param Skill wh.rpgmodule.SoulSkill (required)
---@param FromLevel uint (required)
---@param ToLevel uint (required)
function soul:AddXPFromToSkillLevel(Skill, FromLevel, ToLevel)
end

---Adds XP from level to level for a stat.
---@param Stat wh.rpgmodule.SoulStat (required)
---@param FromLevel uint (required)
---@param ToLevel uint (required)
function soul:AddXPFromToStatLevel(Stat, FromLevel, ToLevel)
end

---Advances skill to level.
---@param Skill wh.rpgmodule.SoulSkill (required)
---@param Level uint (required)
function soul:AdvanceToSkillLevel(Skill, Level)
end

---Advances stat to level.
---@param Stat wh.rpgmodule.SoulStat (required)
---@param Level uint (required)
function soul:AdvanceToStatLevel(Stat, Level)
end

---Returns true if all given souls are inside at least one area
---@param Areas wh.xgenaimodule.Areas (required)
function soul.AreaCheck(Areas)
end

---All: Returns true if all given souls have given label. Any: Returns true if at least one soul has given label.
---@param Label string (required)
---@param Mode wh.conceptmodule.NodeQueryQuantificator (optional, default: All)
function soul.AreaLabelCheck(Label, Mode)
end

---Called to check if soul can eat given item class.
---@param ItemClass Guid (required)
---@return boolean Result
function soul:CanEat(ItemClass)
end

---Checks equipment of the soul.
---@param FreeSlots wh.entitymodule.EquipmentSlotIds (optional)
---@param OccupiedSlots wh.entitymodule.EquipmentSlotIds (optional)
---@return boolean bool
function soul:CheckEquipment(FreeSlots, OccupiedSlots)
end

---Creates soul query context structure for use in soul property getters
---@param Opponent wh.rpgmodule.I_Soul* (optional)
---@param OpponentItem wh.entitymodule.Item* (optional)
---@param SoulItem wh.entitymodule.Item* (optional)
---@param QueryReason wh.rpgmodule.QueryReason (optional, default: Default)
---@return wh.rpgmodule.SoulQueryContext* Context
function soul.CreateSoulQueryContext(Opponent, OpponentItem, SoulItem, QueryReason)
end

---All: Returns true if all given souls are dead. Any: Returns true if at least one soul is dead.
---@param Mode wh.conceptmodule.NodeQueryQuantificator (optional, default: All)
---@return boolean IsDead
function soul.DeathCheck(Mode)
end

---Equips item to player.
---@param ItemDescriptor wh.entitymodule.ItemDescriptor* (required)
---@param EquipToSlot wh.entitymodule.E_QuickSlotSpec (optional, default: Default)
function soul:EquipPlayersItem(ItemDescriptor, EquipToSlot)
end

---Returns derived stat value.
---@param DerivedStat wh.rpgmodule.SoulDerivedStat (required)
---@param Context wh.rpgmodule.SoulQueryContext* (optional)
---@return float Value
function soul:GetDerivedStat(DerivedStat, Context)
end

---Returns primary companion of given type.
---@param Type wh.rpgmodule.CompanionType (required)
---@return wh.rpgmodule.I_Soul* Companion
function soul:GetPrimaryCompanion(Type)
end

---Returns skill level.
---@param Skill wh.rpgmodule.SoulSkill (required)
---@param Context wh.rpgmodule.SoulQueryContext* (optional)
---@return float Value
function soul:GetSkillLevel(Skill, Context)
end

---Returns skill level relative to context.
---@param Skill wh.rpgmodule.SoulSkill (required)
---@param Context wh.rpgmodule.SoulQueryContext* (optional)
---@return float Value
function soul:GetSkillLevelRelative(Skill, Context)
end

---Returns stat level.
---@param Stat wh.rpgmodule.SoulStat (required)
---@param Context wh.rpgmodule.SoulQueryContext* (optional)
---@return float Value
function soul:GetStatLevel(Stat, Context)
end

---Returns stat level relative to context.
---@param Stat wh.rpgmodule.SoulStat (required)
---@param Context wh.rpgmodule.SoulQueryContext* (optional)
---@return float Value
function soul:GetStatLevelRelative(Stat, Context)
end

---Returns state value.
---@param State wh.rpgmodule.SoulState (required)
---@return float Value
function soul:GetState(State)
end

---Returns static stat value.
---@param StaticStat wh.rpgmodule.SoulStaticStat (required)
---@param Context wh.rpgmodule.SoulQueryContext* (optional)
---@return float Value
function soul:GetStaticStat(StaticStat, Context)
end

---Checks if soul has combat history with another soul.
---@param Target wh.rpgmodule.I_CombatSoul* (required)
---@param MaxTime float (optional, default: 30)
---@return boolean bool
function soul:HasCombatHistoryWithSoul(Target, MaxTime)
end

---Returns true if given faction satisfies the condition for given nervousness flag
---@param Faction wh.rpgmodule.I_Soul* (required)
---@param NervousnessFlag wh.rpgmodule.NervousnessFlagID (required)
---@return boolean Result
function soul.HasNervousnessFlag(Faction, NervousnessFlag)
end

---Returns true if soul has primary companion of given type.
---@param Type wh.rpgmodule.CompanionType (required)
---@return boolean Result
function soul:HasPrimaryCompanion(Type)
end

---Returns true if all/any given souls have the player in primary or secondary perception. Set FullyAwareOnly to true to ignore secondary perception decay.
---@param FullyAwareOnly boolean (optional, default: false)
---@param Mode wh.conceptmodule.NodeQueryQuantificator (optional, default: All)
---@return boolean HasSeenPlayer
function soul.HasSeenPlayer(FullyAwareOnly, Mode)
end

---Checks if soul has weapon in hand.
---@param Target wh.rpgmodule.I_CombatSoul* (required)
---@param Weapon wh.entitymodule.WeaponClass (required)
---@return boolean bool
function soul:HasWeaponInHand(Target, Weapon)
end

---Checks if body part is bleeding.
---@param BodyPart wh.entitymodule.BodyPartData (required)
---@return boolean Value
function soul:IsBodyPartBleeding(BodyPart)
end

---Removes specified buff from all souls on input
---@param Buff wh.rpgmodule.BuffGUID (required)
function soul.RemoveBuff(Buff)
end

---Removes buffs with specified tag id from all souls on input
---@param BuffTag wh.rpgmodule.BuffDefinitionAITag (required)
function soul.RemoveBuffsWithTag(BuffTag)
end

---Revives the soul.
function soul:Revive()
end

---Sets state value.
---@param State wh.rpgmodule.SoulState (required)
---@param Value float (required)
function soul:SetState(State, Value)
end

---Applies damage to the soul.
---@param Stamina float (required)
---@param Health float (required)
---@param Attacker wh.rpgmodule.I_Soul* (optional)
---@param SuppressHitReaction boolean (optional, default: false)
---@param InjureBodypart wh.entitymodule.BodyPartData (optional)
function soul:TakeDamage(Stamina, Health, Attacker, SuppressHitReaction, InjureBodypart)
end

---All: Returns true if all given souls have active threats. Any: Returns true if at least one soul has active threats.
---@param Mode wh.conceptmodule.NodeQueryQuantificator (optional, default: All)
---@return boolean IsThreatened
function soul.ThreatsCheck(Mode)
end

---All: Returns true if all given souls are unconscious. Any: Returns true if at leas one soul is unconsiouss.
---@param Mode wh.conceptmodule.NodeQueryQuantificator (optional, default: All)
---@return boolean IsUnconscious
function soul.UnconsciousCheck(Mode)
end

---Unequips armor slots from player.
---@param ArmorSlots wh.entitymodule.EquipmentSlotIds (required)
function soul:UnequipPlayersArmorSlots(ArmorSlots)
end

---Unequips item from player.
---@param ItemDescriptor wh.entitymodule.ItemDescriptor* (required)
function soul:UnequipPlayersItem(ItemDescriptor)
end

---Uses inventory items.
---@param ItemDescriptor wh.entitymodule.ItemDescriptor* (required)
---@param AllowPartialMatch boolean (required)
---@param BodyPart wh.entitymodule.BodyPartData (optional)
---@return boolean Result
function soul:UseInventoryItems(ItemDescriptor, AllowPartialMatch, BodyPart)
end

return soul
