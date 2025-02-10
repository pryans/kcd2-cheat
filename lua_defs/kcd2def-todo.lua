---@meta _

--- this file does not get loaded as a definition, but it will still be loaded in the workspace
--- it contains the lua state left to be properly annotated
--- besides these, there are also classes/metatables/structures to document
--- some of the state is defined within lua scripts, some in XML scripts, and some in the engine.
--- we can figure out the types of functions based on their usage in scripts, if present, and their definition if available.
--- mark undocumented functions as kcd2def*unknown_function and either '---@deprecated' or 'private' so they generate warnings at their usage

do local todo = { -- hide globals in case it is present in the workspace
    AI = {
        ['AbortAction'] = function (...) end;
        ['AddAggressiveTarget'] = function (...) end;
        ['AddCombatClass'] = function (...) end;
        ['AddCoverEntity'] = function (...) end;
        ['AddFormationPoint'] = function (...) end;
        ['AddFormationPointFixed'] = function (...) end;
        ['AddPersonallyHostile'] = function (...) end;
        ['AgentLookAtPos'] = function (...) end;
        ['AllowLowerBodyToTurn'] = function (...) end;
        ['Animation'] = function (...) end;
        ['AssignPFPropertiesToPathType'] = function (...) end;
        ['AssignPathTypeToSOUser'] = function (...) end;
        ['AutoDisable'] = function (...) end;
        ['BeginGoalPipe'] = function (...) end;
        ['BeginGroup'] = function (...) end;
        ['BehaviorEvent'] = function (...) end;
        ['BreakEvent'] = function (...) end;
        ['CanFireInStance'] = function (...) end;
        ['CanMelee'] = function (...) end;
        ['CanMoveStraightToPoint'] = function (...) end;
        ['ChangeFormation'] = function (...) end;
        ['ChangeMovementAbility'] = function (...) end;
        ['ChangeParameter'] = function (...) end;
        ['CheckForFriendlyAgentsAroundPoint'] = function (...) end;
        ['CheckMeleeDamage'] = function (...) end;
        ['CheckVehicleColision'] = function (...) end;
        ['ClearAnimationTag'] = function (...) end;
        ['ClearMovementContext'] = function (...) end;
        ['ClearPotentialTargets'] = function (...) end;
        ['ClearTempTarget'] = function (...) end;
        ['ConstrainPointInsideGenericShape'] = function (...) end;
        ['CreateFormation'] = function (...) end;
        ['CreateGoalPipe'] = function (...) end;
        ['CreateGroupFormation'] = function (...) end;
        ['CreateStimulusEvent'] = function (...) end;
        ['CreateStimulusEventInRange'] = function (...) end;
        ['CreateTempGenericShapeBox'] = function (...) end;
        ['DebugReportHitDamage'] = function (...) end;
        ['DestroyAllTPSQueries'] = function (...) end;
        ['DistanceToGenericShape'] = function (...) end;
        ['DropTarget'] = function (...) end;
        ['EnableCoverFire'] = function (...) end;
        ['EnableFire'] = function (...) end;
        ['EnableUpdateLookTarget'] = function (...) end;
        ['EnableWeaponAccessory'] = function (...) end;
        ['EndGoalPipe'] = function (...) end;
        ['EndGroup'] = function (...) end;
        ['Error'] = function (...) end;
        ['EvalHidespot'] = function (...) end;
        ['EvalPeek'] = function (...) end;
        ['Event'] = function (...) end;
        ['ExecuteAction'] = function (...) end;
        ['FindObjectOfType'] = function (...) end;
        ['FindStandbySpotInShape'] = function (...) end;
        ['FindStandbySpotInSphere'] = function (...) end;
        ['FreeSignal'] = function (...) end;
        ['GetAIObjectPosition'] = function (...) end;
        ['GetAlertness'] = function (...) end;
        ['GetAnchor'] = function (...) end;
        ['GetAttentionTargetAIType'] = function (...) end;
        ['GetAttentionTargetDirection'] = function (...) end;
        ['GetAttentionTargetDistance'] = function (...) end;
        ['GetAttentionTargetEntity'] = function (...) end;
        ['GetAttentionTargetOf'] = function (...) end;
        ['GetAttentionTargetPosition'] = function (...) end;
        ['GetAttentionTargetThreat'] = function (...) end;
        ['GetAttentionTargetType'] = function (...) end;
        ['GetAttentionTargetViewDirection'] = function (...) end;
        ['GetBeaconPosition'] = function (...) end;
        ['GetBehaviorBlackBoard'] = function (...) end;
        ['GetBehaviorVariable'] = function (...) end;
        ['GetBiasedDirection'] = function (...) end;
        ['GetCurrentHideAnchor'] = function (...) end;
        ['GetDirLabelToPoint'] = function (...) end;
        ['GetDirectAnchorPos'] = function (...) end;
        ['GetDistanceAlongPath'] = function (...) end;
        ['GetDistanceToClosestGroupMember'] = function (...) end;
        ['GetEnclosingGenericShapeOfType'] = function (...) end;
        ['GetEnclosingSpace'] = function (...) end;
        ['GetExtraPriority'] = function (...) end;
        ['GetFactionOf'] = function (...) end;
        ['GetFlyingVehicleFlockingPos'] = function (...) end;
        ['GetFormationLookingPoint'] = function (...) end;
        ['GetFormationPointClass'] = function (...) end;
        ['GetFormationPointPosition'] = function (...) end;
        ['GetFormationPosition'] = function (...) end;
        ['GetForwardDir'] = function (...) end;
        ['GetGroupAlertness'] = function (...) end;
        ['GetGroupAveragePosition'] = function (...) end;
        ['GetGroupCount'] = function (...) end;
        ['GetGroupMember'] = function (...) end;
        ['GetGroupOf'] = function (...) end;
        ['GetGroupScopeUserCount'] = function (...) end;
        ['GetGroupScriptTable'] = function (...) end;
        ['GetGroupTarget'] = function (...) end;
        ['GetGroupTargetCount'] = function (...) end;
        ['GetGroupTargetEntity'] = function (...) end;
        ['GetGroupTargetThreat'] = function (...) end;
        ['GetGroupTargetType'] = function (...) end;
        ['GetHeliAdvancePoint'] = function (...) end;
        ['GetLastUsedSmartObject'] = function (...) end;
        ['GetLeader'] = function (...) end;
        ['GetMemoryFireType'] = function (...) end;
        ['GetNavigationType'] = function (...) end;
        ['GetNearestEntitiesOfType'] = function (...) end;
        ['GetNearestHidespot'] = function (...) end;
        ['GetNearestPathOfTypeInRange'] = function (...) end;
        ['GetNearestPointOnPath'] = function (...) end;
        ['GetObjectBlackBoard'] = function (...) end;
        ['GetObjectRadius'] = function (...) end;
        ['GetParameter'] = function (...) end;
        ['GetPathLoop'] = function (...) end;
        ['GetPathSegNoOnPath'] = function (...) end;
        ['GetPeakThreatLevel'] = function (...) end;
        ['GetPeakThreatType'] = function (...) end;
        ['GetPointOnPathBySegNo'] = function (...) end;
        ['GetPosturePriority'] = function (...) end;
        ['GetPotentialTargetCount'] = function (...) end;
        ['GetPotentialTargetCountFromFaction'] = function (...) end;
        ['GetPredictedPosAlongPath'] = function (...) end;
        ['GetPreviousBehaviorName'] = function (...) end;
        ['GetPreviousPeakThreatLevel'] = function (...) end;
        ['GetPreviousPeakThreatType'] = function (...) end;
        ['GetProbableTargetPosition'] = function (...) end;
        ['GetReactionOf'] = function (...) end;
        ['GetRefPointDirection'] = function (...) end;
        ['GetRefPointPosition'] = function (...) end;
        ['GetRefShapeName'] = function (...) end;
        ['GetSmartObjectHelper'] = function (...) end;
        ['GetSoundPerceptionDescriptor'] = function (...) end;
        ['GetStance'] = function (...) end;
        ['GetSubTypeOf'] = function (...) end;
        ['GetTacticalPoints'] = function (...) end;
        ['GetTargetSubType'] = function (...) end;
        ['GetTargetType'] = function (...) end;
        ['GetTotalLengthOfPath'] = function (...) end;
        ['GetTypeOf'] = function (...) end;
        ['GetUnitCount'] = function (...) end;
        ['GoTo'] = function (...) end;
        ['Hostile'] = function (...) end;
        ['IgnoreCurrentHideObject'] = function (...) end;
        ['IntersectsForbidden'] = function (...) end;
        ['InvalidateHidespot'] = function (...) end;
        ['IsAgentInAgentFOV'] = function (...) end;
        ['IsAgentInTargetFOV'] = function (...) end;
        ['IsAimReady'] = function (...) end;
        ['IsCoverCompromised'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsFireEnabled'] = function (...) end;
        ['IsGoalPipe'] = function (...) end;
        ['IsInCover'] = function (...) end;
        ['IsLowHealthPauseActive'] = function (...) end;
        ['IsLowOnAmmo'] = function (...) end;
        ['IsMoving'] = function (...) end;
        ['IsMovingInCover'] = function (...) end;
        ['IsMovingToCover'] = function (...) end;
        ['IsOutOfAmmo'] = function (...) end;
        ['IsPersonallyHostile'] = function (...) end;
        ['IsPointInFlightRegion'] = function (...) end;
        ['IsPointInWaterRegion'] = function (...) end;
        ['IsPointInsideGenericShape'] = function (...) end;
        ['IsPunchableObjectValid'] = function (...) end;
        ['IsTakingCover'] = function (...) end;
        ['LoadBehaviors'] = function (...) end;
        ['LoadGoalPipes'] = function (...) end;
        ['LogComment'] = function (...) end;
        ['LogEvent'] = function (...) end;
        ['LogProgress'] = function (...) end;
        ['MeleePunchableObject'] = function (...) end;
        ['ModifySmartObjectStates'] = function (...) end;
        ['NotifyGroup'] = function (...) end;
        ['NotifyReinfDone'] = function (...) end;
        ['NotifySurpriseEntityAction'] = function (...) end;
        ['PlayCommunication'] = function (...) end;
        ['ProcessBalancedDamage'] = function (...) end;
        ['PushGoal'] = function (...) end;
        ['PushLabel'] = function (...) end;
        ['QueueBubbleMessage'] = function (...) end;
        ['RecComment'] = function (...) end;
        ['RegisterDamageRegion'] = function (...) end;
        ['RegisterInterestedActor'] = function (...) end;
        ['RegisterInterestingEntity'] = function (...) end;
        ['RegisterTacticalPointQuery'] = function (...) end;
        ['RegisterTargetTrack'] = function (...) end;
        ['RemoveCoverEntity'] = function (...) end;
        ['RemovePersonallyHostile'] = function (...) end;
        ['RequestToStopMovement'] = function (...) end;
        ['ResetAgentLookAtPos'] = function (...) end;
        ['ResetAgentState'] = function (...) end;
        ['ResetParameters'] = function (...) end;
        ['ResetPersonallyHostiles'] = function (...) end;
        ['ScaleFormation'] = function (...) end;
        ['SequenceBehaviorReady'] = function (...) end;
        ['SequenceInterruptibleBehaviorLeft'] = function (...) end;
        ['SequenceNonInterruptibleBehaviorLeft'] = function (...) end;
        ['SetAdjustPath'] = function (...) end;
        ['SetAlarmed'] = function (...) end;
        ['SetAnimationTag'] = function (...) end;
        ['SetAssesmentMultiplier'] = function (...) end;
        ['SetAttentiontarget'] = function (...) end;
        ['SetBeaconPosition'] = function (...) end;
        ['SetBehaviorTreeEvaluationEnabled'] = function (...) end;
        ['SetBehaviorVariable'] = function (...) end;
        ['SetCollisionAvoidanceRadiusIncrement'] = function (...) end;
        ['SetContinuousMotion'] = function (...) end;
        ['SetCoverCompromised'] = function (...) end;
        ['SetEntitySpeedRange'] = function (...) end;
        ['SetExtraPriority'] = function (...) end;
        ['SetFactionOf'] = function (...) end;
        ['SetFactionThreatMultiplier'] = function (...) end;
        ['SetFireMode'] = function (...) end;
        ['SetForcedNavigation'] = function (...) end;
        ['SetFormationAngleThreshold'] = function (...) end;
        ['SetFormationLookingPoint'] = function (...) end;
        ['SetFormationPosition'] = function (...) end;
        ['SetFormationUpdate'] = function (...) end;
        ['SetFormationUpdateSight'] = function (...) end;
        ['SetIgnorant'] = function (...) end;
        ['SetInCover'] = function (...) end;
        ['SetLastOpResult'] = function (...) end;
        ['SetLeader'] = function (...) end;
        ['SetMemoryFireType'] = function (...) end;
        ['SetMovementContext'] = function (...) end;
        ['SetPFBlockerRadius'] = function (...) end;
        ['SetPFProperties'] = function (...) end;
        ['SetPathAttributeToFollow'] = function (...) end;
        ['SetPathToFollow'] = function (...) end;
        ['SetPointListToFollow'] = function (...) end;
        ['SetPosturePriority'] = function (...) end;
        ['SetPostures'] = function (...) end;
        ['SetReactionOf'] = function (...) end;
        ['SetRefPointAtDefensePos'] = function (...) end;
        ['SetRefPointDirection'] = function (...) end;
        ['SetRefPointPosition'] = function (...) end;
        ['SetRefPointRadius'] = function (...) end;
        ['SetRefPointToGrenadeAvoidTarget'] = function (...) end;
        ['SetRefShapeName'] = function (...) end;
        ['SetRefpointToAnchor'] = function (...) end;
        ['SetRefpointToPunchableObject'] = function (...) end;
        ['SetSmartObjectState'] = function (...) end;
        ['SetSoundPerceptionDescriptor'] = function (...) end;
        ['SetSpeed'] = function (...) end;
        ['SetStance'] = function (...) end;
        ['SetTargetTrackClassThreat'] = function (...) end;
        ['SetTempTargetPriority'] = function (...) end;
        ['SetTerritoryShapeName'] = function (...) end;
        ['SetUnitProperties'] = function (...) end;
        ['SetUseSecondaryVehicleWeapon'] = function (...) end;
        ['SetVehicleStickTarget'] = function (...) end;
        ['Signal'] = function (...) end;
        ['SmartObjectEvent'] = function (...) end;
        ['SoundEvent'] = function (...) end;
        ['StartModularBehaviorTree'] = function (...) end;
        ['StopCommunication'] = function (...) end;
        ['StopModularBehaviorTree'] = function (...) end;
        ['ThrowGrenade'] = function (...) end;
        ['TriggerCurrentTargetTrackPulse'] = function (...) end;
        ['UnregisterInterestedActor'] = function (...) end;
        ['UnregisterInterestingEntity'] = function (...) end;
        ['UnregisterTargetTrack'] = function (...) end;
        ['UpTargetPriority'] = function (...) end;
        ['UpdateGlobalPerceptionScale'] = function (...) end;
        ['UpdateTempTarget'] = function (...) end;
        ['VisualEvent'] = function (...) end;
        ['Warning'] = function (...) end;
    };
    AISpawner = {
        ['CreateDummy'] = function (...) end;
        ['Editor'] = {
            ['DisplayArrow'] = 1;
            ['Icon'] = 'SpawnPoint.bmp';
            ['Model'] = 'Editor/Objects/Particles.cgf';
        };
        ['Event_AutoDisableOff'] = function (...) end;
        ['Event_AutoDisableOn'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_Limit'] = function (...) end;
        ['FindSpawnProtoUnitId'] = function (...) end;
        ['FindSpawnReinfPoint'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['AutoDisableOff'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['AutoDisableOn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Limit'] = 'bool';
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['Properties'] = {
            ['Limit'] = 4;
            ['NumUnits'] = 2;
            ['bDoVisCheck'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bLimitStop'] = 1;
            ['bSaved_by_game'] = true;
        };
        ['RemoveDummy'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['SpawnInitially'] = function (...) end;
        ['SpawnUnit'] = function (...) end;
        ['UnitDown'] = function (...) end;
        ['isEnabled'] = 0;
        ['spawnedIdsSize'] = 0;
        ['totalUnitsCounter'] = 0;
        ['unitsCounter'] = 0;
    };

    Action = function (...) end;
    ActionMapManager = {
        ['EnableActionMap'] = function (...) end;
        ['EnableActionMapManager'] = function (...) end;
        ['GetDefaultActionEntity'] = function (...) end;
        ['InitActionMaps'] = function (...) end;
        ['IsFilterEnabled'] = function (...) end;
        ['LoadControllerLayoutFile'] = function (...) end;
        ['LoadFromXML'] = function (...) end;
        ['SetActionListener'] = function (...) end;
        ['SetDefaultActionEntity'] = function (...) end;
    };
    ActionTrigger = {
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['GetLinkedSmartObject'] = function (...) end;
        ['GetOwner'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsLegal'] = function (...) end;
        ['IsLegalHold'] = function (...) end;
        ['IsLegalImpl'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnNPCStateSearchDone'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnResourcesHosted'] = function (...) end;
        ['OnResourcesHostingInterrupted'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTriggerPoint'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'Stance';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = 'sitting';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'None';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = '';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    Actor = {
        ['CreateActor'] = function (...) end;
    };
    AddAction = function (...) end;
    AddInteractorAction = function (...) end;
    AddWeapon = function (...) end;
    Alchemy = {
        ['GetDisableReason'] = function (...) end;
        ['GetFlagTextFor'] = function (...) end;
        ['GetUsableFor'] = function (...) end;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['IsUsableByHold'] = function (...) end;
        ['IsUsableEnabledFor'] = function (...) end;
        ['IsUsableVisibleFor'] = function (...) end;
        ['OnUse'] = function (...) end;
        ['ResetTable'] = function (...) end;
        ['StartAlchemy'] = function (...) end;
    };
    AlchemyItem = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUse'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['alchemy_type'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractableThroughCollision'] = false;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = false;
            ['bUpdateOnlyByScript'] = false;
            ['object_Model'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['slot_name'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['bUseableMsgChanged'] = 0;
        ['nUserId'] = 0;
    };
    AlchemyTable = {
        ['Client'] = {
            ['OnLevelLoaded'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['BellowsIdleTimeout'] = 0.5;
            ['BellowsUseCountToDistill'] = 2;
            ['CameraLimitAngleDown'] = -60;
            ['CameraLimitAngleLeft'] = -75;
            ['CameraLimitAngleRight'] = 95;
            ['CameraLimitAngleUp'] = 20;
            ['FireSound'] = 'Sounds/environment:special/alchemy:fireplace';
            ['FlaskRise'] = 'Objects/props/alchemy/flask/potion_rise.cax';
            ['HerbsBow'] = 'Objects/props/alchemy/bowl/bowl_herbs.cgf';
            ['HerbsBowMilled'] = 'Objects/props/alchemy/bowl/bowl_herbs_crushed.cgf';
            ['HerbsMortar'] = 'Objects/props/alchemy/mortar/mortar_herbs.cgf';
            ['HerbsMortarMilled'] = 'Objects/props/alchemy/mortar/mortar_herbs_crushed.cgf';
            ['HourGlassAlembic'] = 'Objects/props/alchemy/sandglass/sandglass_sand.cax';
            ['HourGlassUnitTime'] = 10;
            ['MortarFinishingMilledModel'] = 'Objects/manmade/task_specific_props/alchemy/mortar/mortar_gunpowder_crushed.cgf';
            ['MortarFinishingModel'] = 'Objects/manmade/task_specific_props/alchemy/mortar/mortar_gunpowder.cgf';
            ['MortarUseCount'] = 1;
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['PotFinish'] = 'Objects/props/alchemy/alchemy_pot/alchemy_pot_finish.cax';
            ['PotInsertBase'] = 'Objects/props/alchemy/alchemy_pot/alchemy_pot_start.cax';
            ['PotionPouring'] = 'Objects/props/alchemy/flask/potion_pouring.cax';
            ['StepsTolerance'] = 2;
            ['StrongBoilFireIntensity'] = 2;
            ['StrongBoilTimeout'] = 10;
            ['WaitDuration'] = 5;
            ['WaterSound'] = 'Sounds/environment:special/alchemy:boiling_water';
            ['WeakBoilTimeout'] = 5;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bOnlyNPC'] = true;
            ['bSaved_by_game'] = true;
            ['fUseAngle'] = 0.9;
            ['fUseDistance'] = 3.25;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'Objects/props/alchemy/alchemist_table.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['State'] = {
            ['enteredBook'] = false;
            ['isUsedByPlayer'] = false;
        };
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    AnimChar = {
        ['Client'] = {
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_BodyBlood'] = function (...) end;
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['BodyBlood'] = {
                    [02] = 'string';
                    [01] = function (...) end;
                };
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Hide'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Body'] = {
                ['bIsMortal'] = false;
                ['bVisorClosed'] = false;
                ['fBloodOverride'] = -1;
                ['fDirtOverride'] = -1;
                ['fScratchesOverride'] = -1;
                ['guidBodyPresetId'] = 0;
                ['guidClothingPresetId'] = 0;
                ['guidSubstituteBodyPresetId'] = 0;
                ['guidWeaponPresetId'] = 0;
            };
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = false;
                ['bPushableByPlayers'] = true;
                ['bRigidBody'] = true;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bClothingRemoveHelmet'] = true;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bMissionCritical'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = false;
            ['bUsable'] = false;
            ['characterDetail'] = 0;
            ['esClothingConfig'] = 'male2';
            ['object_Model'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['SetFromProperties'] = function (...) end;
        ['SetupModel'] = function (...) end;
    };
    AnimDoor = {
        ['BuildNPCAnimationName'] = function (...) end;
        ['BuildObjectAnimationName'] = function (...) end;
        ['Client'] = {
            ['OnLevelLoaded'] = function (...) end;
        };
        ['Close'] = function (...) end;
        ['DespawnSuspiciousVolume'] = function (...) end;
        ['DisableLockpick'] = function (...) end;
        ['DoLockOnMissingHomeArea'] = function (...) end;
        ['DoPlayAnimation'] = function (...) end;
        ['DoPlaySound'] = function (...) end;
        ['DoStopSound'] = function (...) end;
        ['DumpState'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Door.bmp';
            ['ShowBounds'] = 1;
        };
        ['EnableLockpick'] = function (...) end;
        ['Event_Close'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Lock'] = function (...) end;
        ['Event_Open'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Unlock'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Close'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Lock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Open'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Unlock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Close'] = 'bool';
                ['Hide'] = 'bool';
                ['Lock'] = 'bool';
                ['Open'] = 'bool';
                ['UnHide'] = 'bool';
                ['Unlock'] = 'bool';
            };
        };
        ['GenerateLockDifficulty'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetLockDifficulty'] = function (...) end;
        ['GetSuspiciousVolume'] = function (...) end;
        ['IsAccessedFromFront'] = function (...) end;
        ['IsInUse'] = function (...) end;
        ['IsInteractive'] = function (...) end;
        ['IsLocked'] = function (...) end;
        ['IsOnKeySide'] = function (...) end;
        ['IsOpen'] = function (...) end;
        ['IsRightDoor'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['Lock'] = function (...) end;
        ['LockType'] = 'door';
        ['Lockpick'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Open'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['ProduceAiSound'] = function (...) end;
        ['Properties'] = {
            ['Animation'] = {
                ['anim_Close'] = 'Close';
                ['anim_Open'] = 'Open';
            };
            ['Lock'] = {
                ['bCanLockPick'] = true;
                ['bCanUnlockWithDynamicKey'] = true;
                ['bDoLockOnMissingHomeArea'] = true;
                ['bLockDifficultyOverride'] = false;
                ['bLockInside'] = false;
                ['bLockOutside'] = false;
                ['bLockReversed'] = false;
                ['bLocked'] = false;
                ['bNeverLockByPassingNPC'] = true;
                ['bSendMessage'] = false;
                ['esLockFanciness'] = 'Common';
                ['esLockTypes'] = 'none/none';
                ['fKeepUnlockedFrom'] = 7.5;
                ['fKeepUnlockedTo'] = 19.5;
                ['fLockDifficulty'] = 0.5;
                ['guidItemClassId'] = '';
            };
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['Sounds'] = {
                ['snd_Close'] = 'Sounds/environment:doors:door_wood_1_close';
                ['snd_Open'] = 'Sounds/environment:doors:door_wood_1_open';
            };
            ['bActivatePortal'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = true;
            ['bNoFriendlyFire'] = false;
            ['bSaved_by_game'] = true;
            ['esDoorAnimSet'] = '';
            ['esNavCompoment'] = 'Door';
            ['fUseDistance'] = 2.5;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = '';
            ['sWH_AI_EntityCategory'] = 'Door';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['Server'] = {
            ['OnUpdate'] = function (...) end;
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetLockedDueToPrivate'] = function (...) end;
        ['SetPhysicalFlags'] = function (...) end;
        ['SetShouldBeLockedOverride'] = function (...) end;
        ['SetUnlockedDueExpected'] = function (...) end;
        ['ShouldBeLocked'] = function (...) end;
        ['SpawnSuspiciousVolume'] = function (...) end;
        ['Unlock'] = function (...) end;
        ['bLocked'] = false;
        ['bNeedUpdate'] = 0;
        ['bNoAnims'] = 0;
        ['bUseSameAnim'] = 0;
        ['bUseableMsgChanged'] = 0;
        ['lastAnim'] = '';
        ['nDirection'] = -1;
        ['nSoundId'] = 0;
        ['nUpdateAfterLoad'] = 0;
        ['nUserId'] = 0;
    };
    AnimObjectBase = {
        ['Client'] = {
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Hide'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = true;
                ['bRigidBody'] = true;
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bMissionCritical'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
            ['object_Model'] = 'objects/default/primitive_pyramid.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['SetFromProperties'] = function (...) end;
        ['SetupModel'] = function (...) end;
    };
    AnimalSpawner = {
        ['Editor'] = {
            ['Icon'] = 'pig.bmp';
            ['IconOnTop'] = 0;
        };
        ['Properties'] = {
            ['AnimalCount'] = 5;
            ['EntityClass'] = '';
            ['RespawnDays'] = 14;
            ['SpawnInFlock'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['guidSoul'] = '';
        };
    };
    Archery = {
        ['getArrows'] = function (...) end;
        ['getMoneyBet'] = function (...) end;
        ['getShootingRange'] = function (...) end;
        ['shootmaster'] = {
            ['aus_shootmaster'] = {
                ['difficulty'] = {
                    ['advanced'] = {
                        ['arrows'] = 13;
                        ['bet'] = 30;
                    };
                    ['beginer'] = {
                        ['arrows'] = 7;
                        ['bet'] = 10;
                    };
                    ['expert'] = {
                        ['arrows'] = 21;
                        ['bet'] = 70;
                    };
                };
                ['shootingRange'] = 'q_archery_uzice';
            };
            ['prib_shootmaster'] = {
                ['difficulty'] = {
                    ['advanced'] = {
                        ['arrows'] = 13;
                        ['bet'] = 30;
                    };
                    ['beginer'] = {
                        ['arrows'] = 7;
                        ['bet'] = 10;
                    };
                    ['expert'] = {
                        ['arrows'] = 21;
                        ['bet'] = 70;
                    };
                };
                ['shootingRange'] = 'q_archery_pribyslavice';
            };
            ['q_theresa_skao_shootmaster'] = {
                ['difficulty'] = {
                    ['advanced'] = {
                        ['arrows'] = 13;
                        ['bet'] = 30;
                    };
                    ['beginer'] = {
                        ['arrows'] = 7;
                        ['bet'] = 10;
                    };
                    ['expert'] = {
                        ['arrows'] = 21;
                        ['bet'] = 70;
                    };
                };
                ['shootingRange'] = 'q_archery_skalice';
            };
            ['rat_shootmaster'] = {
                ['difficulty'] = {
                    ['advanced'] = {
                        ['arrows'] = 13;
                        ['bet'] = 30;
                    };
                    ['beginer'] = {
                        ['arrows'] = 7;
                        ['bet'] = 10;
                    };
                    ['expert'] = {
                        ['arrows'] = 21;
                        ['bet'] = 70;
                    };
                };
                ['shootingRange'] = 'q_archery_rataje';
            };
            ['tal_shootmaster'] = {
                ['difficulty'] = {
                    ['advanced'] = {
                        ['arrows'] = 13;
                        ['bet'] = 30;
                    };
                    ['beginer'] = {
                        ['arrows'] = 7;
                        ['bet'] = 10;
                    };
                    ['expert'] = {
                        ['arrows'] = 21;
                        ['bet'] = 70;
                    };
                };
                ['shootingRange'] = 'q_archery_mrchojedy';
            };
        };
    };
    AreaBezierVolume = {
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
            };
        };
        ['OnEnable'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['type'] = 'AreaBezierVolume';
    };
    AreaTrigger = {
        ['CanTrigger'] = function (...) end;
        ['Client'] = {
            ['ClEnter'] = function (...) end;
            ['ClLeave'] = function (...) end;
            ['OnEnterArea'] = function (...) end;
            ['OnLeaveArea'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'AreaTrigger.bmp';
            ['IsRotatable'] = false;
            ['IsScalable'] = false;
            ['Model'] = 'Editor/Objects/T.cgf';
        };
        ['Enable'] = function (...) end;
        ['EnteredArea'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_Enter'] = function (...) end;
        ['Event_Leave'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enter'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Leave'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
                ['Enter'] = 'entity';
                ['Faction'] = 'string';
                ['IsInside'] = 'int';
                ['Leave'] = 'entity';
                ['Sender'] = 'entity';
            };
        };
        ['LeftArea'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
                ['bPerPlayer'] = 0;
            };
            ['PlaySequence'] = '';
            ['ScriptCommand'] = '';
            ['bCameraOnly'] = 0;
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInVehicleOnly'] = 0;
            ['bOnlyLocalPlayer'] = 0;
            ['bOnlyPlayers'] = 1;
            ['bSaved_by_game'] = true;
            ['bTriggerOnce'] = 1;
            ['esFactionFilter'] = '';
        };
        ['Server'] = {
            ['OnEnterArea'] = function (...) end;
            ['OnLeaveArea'] = function (...) end;
        };
        ['Trigger'] = function (...) end;
        ['__client_dispatch'] = {
            [02] = 'ClLeave:Eb';
            [01] = 'ClEnter:Eb';
            ['ClEnter'] = function (...) end;
            ['ClLeave'] = function (...) end;
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            ['__validated'] = false;
        };
    };
    AreaUnion = {
        ['Editor'] = {
            ['Icon'] = 'areaunion.bmp';
            ['IconOnTop'] = 1;
        };
        ['Properties'] = {
            ['Label'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['sWH_AI_EntityCategory'] = '';
        };
        ['type'] = 'AreaUnion';
    };
    AssignPFPropertiesToPathType = function (...) end;
    AudioAreaAmbience = {
        ['CliSrv_OnInit'] = function (...) end;
        ['Client'] = {
            ['OnAudioListenerEnterArea'] = function (...) end;
            ['OnAudioListenerEnterNearArea'] = function (...) end;
            ['OnAudioListenerLeaveArea'] = function (...) end;
            ['OnAudioListenerLeaveNearArea'] = function (...) end;
            ['OnAudioListenerMoveNearArea'] = function (...) end;
            ['OnAudioListenerProceedFadeArea'] = function (...) end;
            ['OnBindThis'] = function (...) end;
            ['OnHidden'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
            ['OnSoundDone'] = function (...) end;
            ['OnUnBindThis'] = function (...) end;
            ['OnUnHidden'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'AudioAreaAmbience.bmp';
            ['Model'] = 'Editor/Objects/Sound.cgf';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Done'] = 'bool';
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPostLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Play'] = function (...) end;
        ['Properties'] = {
            ['audioEnvironmentEnvironment'] = '';
            ['audioRTPCGlobalRtpc'] = '';
            ['audioRTPCRtpc'] = '';
            ['audioTriggerPlayTrigger'] = '';
            ['audioTriggerStopTrigger'] = '';
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['eiSoundObstructionType'] = 1;
            ['fEnvironmentDistance'] = 5;
            ['fRtpcDistance'] = 5;
        };
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['Stop'] = function (...) end;
        ['UpdateFadeValue'] = function (...) end;
        ['_DisableObstruction'] = function (...) end;
        ['_LookupControlIDs'] = function (...) end;
        ['_LookupObstructionSwitchIDs'] = function (...) end;
        ['_SetObstruction'] = function (...) end;
        ['_UpdateParameters'] = function (...) end;
        ['_UpdateRtpc'] = function (...) end;
        ['bIsHidden'] = false;
        ['bIsPlaying'] = false;
        ['bOriginalEnabled'] = true;
        ['fFadeOnUnregister'] = 1;
        ['fFadeValue'] = 0;
        ['nState'] = 0;
        ['type'] = 'AudioAreaAmbience';
    };
    AudioAreaEntity = {
        ['CliSrv_OnInit'] = function (...) end;
        ['Client'] = {
            ['OnAudioListenerEnterArea'] = function (...) end;
            ['OnAudioListenerEnterNearArea'] = function (...) end;
            ['OnAudioListenerLeaveArea'] = function (...) end;
            ['OnAudioListenerLeaveNearArea'] = function (...) end;
            ['OnAudioListenerMoveNearArea'] = function (...) end;
            ['OnAudioListenerProceedFadeArea'] = function (...) end;
            ['OnBindThis'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
            ['OnUnBindThis'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'AudioAreaEntity.bmp';
            ['Model'] = 'Editor/Objects/Sound.cgf';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['FadeValue'] = 'float';
                ['OnFarToNear'] = 'bool';
                ['OnInsideToNear'] = 'bool';
                ['OnNearToFar'] = 'bool';
                ['OnNearToInside'] = 'bool';
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPostLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['audioEnvironmentEnvironment'] = '';
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['eiSoundObstructionType'] = 1;
            ['fEnvironmentDistance'] = 5;
            ['fFadeDistance'] = 5;
            ['fRtpcDistance'] = 5;
        };
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['UpdateFadeValue'] = function (...) end;
        ['_ActivateOutput'] = function (...) end;
        ['_DisableObstruction'] = function (...) end;
        ['_LookupObstructionSwitchIDs'] = function (...) end;
        ['_SetObstruction'] = function (...) end;
        ['_UpdateParameters'] = function (...) end;
        ['fFadeOnUnregister'] = 1;
        ['fFadeValue'] = 0;
        ['nState'] = 0;
        ['type'] = 'AudioAreaEntity';
    };
    AudioAreaRandom = {
        ['CliSrv_OnInit'] = function (...) end;
        ['Client'] = {
            ['OnAudioListenerEnterArea'] = function (...) end;
            ['OnAudioListenerEnterNearArea'] = function (...) end;
            ['OnAudioListenerLeaveArea'] = function (...) end;
            ['OnAudioListenerLeaveNearArea'] = function (...) end;
            ['OnAudioListenerMoveNearArea'] = function (...) end;
            ['OnAudioListenerProceedFadeArea'] = function (...) end;
            ['OnBindThis'] = function (...) end;
            ['OnHidden'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnMove'] = function (...) end;
            ['OnShutDown'] = function (...) end;
            ['OnTimer'] = function (...) end;
            ['OnUnBindThis'] = function (...) end;
            ['OnUnHidden'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'AudioAreaRandom.bmp';
            ['Model'] = 'Editor/Objects/Sound.cgf';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPostLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Play'] = function (...) end;
        ['Properties'] = {
            ['audioRTPCRtpc'] = '';
            ['audioTriggerPlayTrigger'] = '';
            ['audioTriggerStopTrigger'] = '';
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bMoveWithEntity'] = false;
            ['bSaved_by_game'] = false;
            ['eiSoundObstructionType'] = 1;
            ['fMaxDelay'] = 2;
            ['fMinDelay'] = 1;
            ['fRadiusRandom'] = 10;
            ['fRtpcDistance'] = 5;
        };
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['Stop'] = function (...) end;
        ['UpdateFadeValue'] = function (...) end;
        ['_GenerateOffset'] = function (...) end;
        ['_LookupControlIDs'] = function (...) end;
        ['_LookupObstructionSwitchIDs'] = function (...) end;
        ['_SetObstruction'] = function (...) end;
        ['_UpdateParameters'] = function (...) end;
        ['_UpdateRtpc'] = function (...) end;
        ['bHasMoved'] = false;
        ['bIsHidden'] = false;
        ['bIsPlaying'] = false;
        ['bOriginalEnabled'] = true;
        ['fFadeValue'] = 0;
        ['nState'] = 0;
        ['type'] = 'AudioAreaRandom';
    };
    AudioTriggerSpot = {
        ['Client'] = {
            ['OnHidden'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnMove'] = function (...) end;
            ['OnShutDown'] = function (...) end;
            ['OnSoundDone'] = function (...) end;
            ['OnTimer'] = function (...) end;
            ['OnUnHidden'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'Sound.bmp';
            ['Model'] = 'Editor/Objects/Sound.cgf';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Done'] = 'bool';
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPostLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTransformFromEditorDone'] = function (...) end;
        ['Play'] = function (...) end;
        ['Properties'] = {
            ['audioTriggerPlayTriggerName'] = '';
            ['audioTriggerStopTriggerName'] = '';
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bPlayOnX'] = false;
            ['bPlayOnY'] = false;
            ['bPlayOnZ'] = false;
            ['bPlayRandom'] = false;
            ['bSaved_by_game'] = false;
            ['bSerializePlayState'] = true;
            ['bTriggerAreasOnMove'] = false;
            ['eiSoundObstructionType'] = 1;
            ['fMaxDelay'] = 2;
            ['fMinDelay'] = 1;
            ['fRadiusRandom'] = 10;
        };
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['Stop'] = function (...) end;
        ['_GenerateOffset'] = function (...) end;
        ['_Init'] = function (...) end;
        ['_LookupObstructionSwitchIDs'] = function (...) end;
        ['_LookupTriggerIDs'] = function (...) end;
        ['_SetObstruction'] = function (...) end;
        ['bHasMoved'] = false;
        ['bIsHidden'] = false;
        ['bIsPlaying'] = false;
        ['bOriginalEnabled'] = true;
        ['bWasPlaying'] = false;
    };
    AudioUtils = {
        ['LookupAudioEnvironmentID'] = function (...) end;
        ['LookupObstructionSwitchAndStates'] = function (...) end;
        ['LookupRtpcID'] = function (...) end;
        ['LookupSwitchID'] = function (...) end;
        ['LookupSwitchStateIDs'] = function (...) end;
        ['LookupTriggerID'] = function (...) end;
        ['PlayAudioTrigger'] = function (...) end;
        ['PlayAudioTriggerWUID'] = function (...) end;
        ['SetAudioTriggerParam'] = function (...) end;
        ['SetAudioTriggerParamWUID'] = function (...) end;
        ['sObstructionCalcSwitchName'] = 'ObstrOcclCalcType';
        ['sObstructionStateNames'] = {
            [02] = 'SingleRay';
            [01] = 'Ignore';
            [03] = 'MultiRay';
        };
    };

    Barber = {
        ['Commit'] = function (...) end;
        ['Create'] = function (...) end;
        ['Destroy'] = function (...) end;
        ['Revert'] = function (...) end;
        ['TryBeard'] = function (...) end;
        ['TryHair'] = function (...) end;
    };
    Barbershop = {
        ['ChooseBeard'] = function (...) end;
        ['ChooseHair'] = function (...) end;
        ['Cleanup'] = function (...) end;
        ['Create'] = function (...) end;
        ['beardGUIDs'] = {
            [04] = '413b142e-40fb-074d-44b7-1fa4ea3de9b1';
            [01] = '4f8c154f-dee8-8e81-627c-45972dba72a7';
            [03] = '47bb7d4d-08fa-dbde-6781-8c9618000a96';
            [02] = '40645b14-c22c-b264-bd6b-844193a30e80';
            [05] = '4b8b7289-41e9-2785-a0b9-1651465445a5';
        };
        ['chosenBeardGUID'] = '';
        ['chosenHairGUID'] = '';
        ['hairGUIDs'] = {
            [02] = '4595b124-5c14-1c0c-fc61-e9ee0de417b2';
            [04] = '4bc51034-3ad5-0050-f5c1-ba11046ed4ba';
            [01] = '4fc88899-0dbf-f14f-9a86-444e0f4c2185';
            [03] = '4a2ee070-1f7c-1855-0e98-3ec5c2e9d9b2';
        };
    };
    BasicAI = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 1e+06;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathLookAhead'] = 2;
            ['pathRadius'] = 0.3;
            ['pathRegenIntervalDuringTrace'] = -1;
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['walkSpeed'] = 2;
        };
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Expose'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['IsAIControlled'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['aicharacter_character'] = '';
            ['bInvulnerable'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = '';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileModel'] = '';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['ai'] = 1;
    };
    BasicAITable = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 1e+06;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathLookAhead'] = 2;
            ['pathRadius'] = 0.3;
            ['pathRegenIntervalDuringTrace'] = -1;
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['walkSpeed'] = 2;
        };
        ['Properties'] = {
            ['aicharacter_character'] = '';
            ['bInvulnerable'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = '';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileModel'] = '';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
    };
    BasicActor = {
        ['GetDogActions'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['OnDogRequest'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys';
                ['footstepEffect'] = 'footsteps';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['bIsDummy'] = false;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['physicMassMult'] = 1;
        };
        ['Reset'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['SetActorModel'] = function (...) end;
        ['gameParams'] = {
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    BasicActorParams = {
        ['gameParams'] = {
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    BasicAnimal = {
        ['AddAnimalLootAction'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys';
                ['footstepEffect'] = 'footsteps';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['bCanHoldInformation'] = false;
            ['bIsDummy'] = false;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['physicMassMult'] = 1;
        };
        ['Reset'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['SetActorModel'] = function (...) end;
        ['collisionClass'] = 2.09715e+06;
        ['gameParams'] = {
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    Battlement = {
        ['Editor'] = {
            ['Icon'] = '';
            ['ShowBounds'] = 1;
        };
        ['ExportToGame'] = function (...) end;
        ['IsClosed'] = function (...) end;
        ['IsShapeOnly'] = function (...) end;
        ['Properties'] = {
            ['BattlementMerlonWidth'] = 0;
            ['BattlementSlotWidth'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['esWallType'] = 'wall';
            ['vectorPoint0'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['vectorPoint1'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
        };
        ['ShapeMaxPoints'] = function (...) end;
        ['ShapeMinPoints'] = function (...) end;
    };
    Bed = {
        ['Client'] = {
            ['OnInit'] = function (...) end;
            ['OnLevelLoaded'] = function (...) end;
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Hide'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetReadingQuality'] = function (...) end;
        ['GetSleepQuality'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableByPlayer'] = function (...) end;
        ['MarkUsedByNPC'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Bed'] = {
                ['esReadingQuality'] = 'none';
                ['esSleepQuality'] = 'low';
            };
            ['Body'] = {
                ['guidBodyPrestId'] = 0;
                ['guidClothingPresetId'] = 0;
            };
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = true;
                ['bRigidBody'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['esBedTypes'] = 'bench';
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bInteractiveCollisionClass'] = false;
            ['bMissionCritical'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = false;
            ['bUsable'] = false;
            ['esFaction'] = '';
            ['fUsabilityDistance'] = 1.75;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'Objects/props/furniture/beds/bed_cottage_01.cgf';
            ['sSittingTagGlobal'] = 'sittingNoTable';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetFromProperties'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetupModel'] = function (...) end;
    };
    BedTrigger = {
        ['CanSleep'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['GetLinkedSmartObject'] = function (...) end;
        ['GetOwner'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsLegal'] = function (...) end;
        ['IsLegalHold'] = function (...) end;
        ['IsLegalImpl'] = function (...) end;
        ['IsLyingAction'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnNPCStateSearchDone'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnResourcesHosted'] = function (...) end;
        ['OnResourcesHostingInterrupted'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTriggerPoint'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'Stance';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = 'sitting';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'None';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = '';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    Birds = {
        ['Animations'] = {
            [01] = 'fly_loop';
            [02] = 'take_off';
            [05] = 'landing';
            [04] = 'idle_loop';
            [03] = 'walk_loop';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_AttractTo'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['AttractTo'] = {
                    [02] = 'Vec3';
                    [01] = function (...) end;
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['AttractEnd'] = 'bool';
                ['Deactivate'] = 'bool';
            };
        };
        ['InitFlock'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnAttractPointReached'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['bInvulnerable'] = true;
                ['gravity_at_death'] = '-9.81';
                ['nCount'] = 4;
                ['object_Model'] = 'objects/characters/animals/birds/boids_bird_a.cgf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 50;
                ['AttractDistMin'] = 30;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 2;
                ['FactorSeparation'] = 1;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = false;
            };
            ['Ground'] = {
                ['FactorAlign'] = 0;
                ['FactorCohesion'] = 3;
                ['FactorOrigin'] = 10;
                ['FactorSeparation'] = 0.1;
                ['HeightOffset'] = 0;
                ['OnGroundIdleDurationMax'] = 3.2;
                ['OnGroundIdleDurationMin'] = 1.6;
                ['OnGroundWalkDurationMax'] = 6;
                ['OnGroundWalkDurationMin'] = 4;
                ['WalkSpeed'] = 0;
                ['WalkToIdleDuration'] = 3;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 100;
                ['FactorHeight'] = 0.6;
                ['FactorOrigin'] = 1;
                ['FactorTakeOff'] = 10;
                ['FlightTime'] = 20;
                ['HeightMax'] = 60;
                ['HeightMin'] = 53;
                ['LandDecelerationHeight'] = 5;
                ['MaxAnimSpeed'] = 1;
                ['SpeedMax'] = 2;
                ['SpeedMin'] = 1;
            };
            ['Options'] = {
                ['AnimationDist'] = 0;
                ['PickableMessage'] = '';
                ['Radius'] = 25;
                ['VisibilityDist'] = 200;
                ['bActivate'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = true;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = false;
                ['bPickableWhenDead'] = true;
                ['bSpawnFromPoint'] = false;
                ['bStartOnGround'] = false;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Birds';
    };
    BirdsTakeoff = {
        ['ApplyPreset'] = function (...) end;
        ['CacheResources'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['EnteredSoundArea'] = function (...) end;
        ['GetEditorModel'] = function (...) end;
        ['IsDebugEnabled'] = function (...) end;
        ['IsOffCooldown'] = function (...) end;
        ['LeftSoundArea'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['Settings'] = {
                ['Audio'] = {
                    ['snd_idle'] = '';
                    ['snd_scared'] = '';
                };
                ['ManualValues'] = {
                    ['ParticleEffect'] = '';
                    ['bIgnoreDaytimeCheck'] = false;
                    ['bSpawnAwayFromPlayer'] = true;
                    ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                    ['fMaxRandomSpread'] = 1;
                    ['fSpeedScale'] = 1;
                    ['iCooldownSeconds'] = 240;
                };
                ['esBirdsTakeoffPreset'] = 'None';
            };
            ['bDebugEnabled'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = '861d5258-0d30-4638-be5e-2c6f02b3d187';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['SpawnBirds'] = function (...) end;
        ['_ParticleSlot'] = 1;
        ['_SpawnParticle'] = function (...) end;
        ['_playSound'] = function (...) end;
        ['_stopSound'] = function (...) end;
        ['bSoundIdleIsPlaying'] = false;
        ['iLastSpawnGameTime'] = -1;
    };
    Blacksmithing = {
        ['CanUse'] = function (...) end;
        ['StartMinigame'] = function (...) end;
    };
    Boar = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_pig_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_pig_database.adb';
        ['CombatOpponentMnTag'] = 'oppPig';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Sheep';
                ['footstepEffect'] = 'footsteps_Sheep';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'boar';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'objects/characters/animals/boar/boar.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.8;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.15;
                ['z'] = 0.6;
            };
            ['posCarcass'] = {
                ['x'] = 0.25;
                ['y'] = 0.1;
                ['z'] = 0.25;
            };
            ['radius'] = 0.25;
        };
        ['collisionClass'] = 524288;
        ['defaultSoulArchetype'] = 'Boar';
        ['defaultSoulClass'] = 'pig';
        ['gameParams'] = {
            ['backwardMultiplier'] = 0.5;
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['relaxed'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'relaxed';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 100;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 100;
            ['stiffness_scale'] = 73;
        };
    };
    Boid = {
        ['Client'] = {
            ['OnHit'] = function (...) end;
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnPickup'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['Server'] = {
            ['OnHit'] = function (...) end;
        };
        ['type'] = 'Boid';
    };
    Boids = {
        ['CreateFlock'] = function (...) end;
        ['EnableFlock'] = function (...) end;
        ['FLOCK_BIRDS'] = 0;
        ['FLOCK_BUGS'] = 2;
        ['FLOCK_CHICKENS'] = 3;
        ['FLOCK_FISH'] = 1;
        ['FLOCK_FROGS'] = 4;
        ['FLOCK_RATS'] = 6;
        ['FLOCK_TURTLES'] = 5;
        ['OnBoidHit'] = function (...) end;
        ['SetAttractionPoint'] = function (...) end;
        ['SetFlockParams'] = function (...) end;
        ['SetFlockPercentEnabled'] = function (...) end;
    };
    Book = {
        ['AnimClose'] = 'close';
        ['AnimOpen'] = 'open';
        ['AnimPageNext'] = 'list_next';
        ['AnimPagePrev'] = 'list_prev';
        ['ContentChanged'] = false;
        ['ContentImages'] = '';
        ['ContentLayout'] = 0;
        ['ContentScramble'] = 1;
        ['ContentText'] = '';
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetLinkedSmartObject'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['GfxName'] = 'GeneralBook';
        ['InteractorPriority'] = 3;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['Model'] = 'objects/characters/assets/book/book_01.cdf';
        ['OnEnablePhysics'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PageAnimationTransitionTime'] = 0.4;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bIsDirectlyReadable'] = false;
            ['bNotPickable'] = false;
            ['bSaved_by_game'] = true;
            ['fUsabilityDistance'] = 1.75;
            ['object_Model'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAiListener'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetUsable'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['SubMtlId'] = 1;
        ['TexSlot'] = 11;
        ['UnregisterAiListener'] = function (...) end;
        ['Use'] = function (...) end;
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.1;
        ['nUserId'] = 0;
        ['npcOnly'] = false;
    };
    BreakableObject = {
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Dead'] = function (...) end;
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hit'] = function (...) end;
        ['Event_MakeInvulnerable'] = function (...) end;
        ['Event_MakeVulnerable'] = function (...) end;
        ['Event_OnBreak'] = function (...) end;
        ['Event_OnFirstBreak'] = function (...) end;
        ['Event_ResetHealth'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['MakeInvulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['MakeVulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['OnBreak'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['OnFirstBreak'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ResetHealth'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
            };
            ['Outputs'] = {
                ['Dead'] = 'bool';
                ['Health'] = 'float';
                ['Hit'] = 'bool';
                ['OnBreak'] = 'bool';
                ['OnFirstBreak'] = 'bool';
            };
        };
        ['GetHealthRatio'] = function (...) end;
        ['GetMaxHealth'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsDead'] = function (...) end;
        ['IsInvulnerable'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPhysicsBreak'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['Health'] = {
                ['MaxHealth'] = 500;
                ['bInvulnerable'] = false;
                ['bOnlyEnemyFire'] = true;
            };
            ['PhysicsBreakable'] = {
                ['GroundPlanes'] = {
                    ['negativeX'] = 0;
                    ['negativeY'] = 0;
                    ['negativeZ'] = 0;
                    ['positiveX'] = 0;
                    ['positiveY'] = 0;
                    ['positiveZ'] = 0.05;
                };
                ['crack_weaken'] = 0.5;
                ['max_bend_torque'] = 0.01;
                ['max_pull_force'] = 0.01;
                ['max_push_force'] = 0.01;
                ['max_shift_force'] = 0.01;
                ['max_twist_torque'] = 0.01;
            };
            ['PhysicsBuoyancy'] = {
                ['water_damping'] = 1.5;
                ['water_density'] = 1;
                ['water_resistance'] = 0;
            };
            ['PhysicsSimulation'] = {
                ['damping'] = 0;
                ['max_time_step'] = 0.01;
                ['sleep_speed'] = 0.04;
            };
            ['UseMessage'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bPickable'] = false;
            ['bResting'] = 0;
            ['bRigidBody'] = false;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
            ['esFaction'] = '';
            ['fDensity'] = 5000;
            ['fMass'] = -1;
            ['nBreakableType'] = 0;
            ['objModel'] = 'objects/default/primitive_box.cgf';
        };
        ['RegisterWithAI'] = function (...) end;
        ['ResetOnUsed'] = function (...) end;
        ['Server'] = {
            ['OnHit'] = function (...) end;
        };
        ['SetGroundPlane'] = function (...) end;
        ['SetInvulnerability'] = function (...) end;
        ['SetupHealthProperties'] = function (...) end;
    };
    Breakage = {
        ['IsUsable'] = function (...) end;
    };
    CCCP = function (...) end;
    CHECKTYPE_MIN_DISTANCE = 0;
    CHECKTYPE_MIN_ROOMSIZE = 1;
    CHECK_TIMER = 0;
    CIPileBind = {
        ['CanDeposit'] = function (...) end;
        ['CanPackAndPick'] = function (...) end;
        ['CanPickUp'] = function (...) end;
        ['Deposit'] = function (...) end;
        ['PickUp'] = function (...) end;
    };
    COVER_HIDE = 0;
    COVER_UNHIDE = 1;
    CRYPARTICLE_ONE_TIME_SPAWN = 2;
    CRYPARTICLE_RAIN_MODE = 1;
    CameraShake = {
        ['Editor'] = {
            ['Icon'] = 'shake.bmp';
        };
        ['Event_Shake'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Shake'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
        };
        ['OnPropertyChange'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['fDuration'] = 2;
            ['fFrequency'] = 0.5;
            ['fRadius'] = 10;
            ['fStrength'] = 1;
            ['vector_Position'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
        };
    };
    CameraSource = {
        ['Editor'] = {
            ['Icon'] = 'Camera.bmp';
        };
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['DialogueCamera'] = {
                ['esDialogueCameraOverrideType'] = 'NoOverride';
                ['iDialogueContextId'] = -1;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
        };
    };
    CaptionObject = {
        ['Editor'] = {
            ['Icon'] = 'Comment.bmp';
            ['IconOnTop'] = 1;
        };
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['Scale'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/editor/box_nodraw.cgf';
            ['sFlagMessage'] = '';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['Reset'] = function (...) end;
        ['bDiscovered'] = false;
    };
    CarryItemPile = {
        ['Editor'] = {
            ['Icon'] = 'mine.bmp';
        };
        ['GetActions'] = function (...) end;
        ['OnDeposit'] = function (...) end;
        ['OnPickUp'] = function (...) end;
        ['Properties'] = {
            ['audioSwitchPackSoundOverride'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['guidCarryItemPileId'] = 0;
            ['guidItemClassId'] = 0;
            ['guidSmartObjectType'] = '';
            ['nCapacity'] = 1;
            ['nNumberOfItems'] = 0;
            ['sDepositAnimTagOverride'] = '';
            ['sHintDeposit'] = '@ui_deposit_item';
            ['sHintPackAndPick'] = '@ui_packandpick_item';
            ['sHintPickup'] = '@ui_pickup_item';
            ['sMaterialOverride'] = '';
            ['sPickupAnimTagOverride'] = '';
            ['vInteractBoxOffset'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['vInteractSize'] = {
                ['x'] = 0.5;
                ['y'] = 0.5;
                ['z'] = 0.5;
            };
        };
    };
    CarryableItem = {
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnPickUp'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = true;
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['Use'] = function (...) end;
        ['npcOnly'] = false;
    };
    CarryableItemBind = {
        ['CanPickUp'] = function (...) end;
        ['PickUp'] = function (...) end;
    };
    CartStash = {
        ['AssignInventory'] = function (...) end;
        ['Close'] = function (...) end;
        ['DoPlayAnimation'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'stash.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Close'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Lock'] = function (...) end;
        ['Event_Open'] = function (...) end;
        ['Event_StartLockPicking'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Unlock'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Close'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Lock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Open'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Unlock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Close'] = 'bool';
                ['Hide'] = 'bool';
                ['Lock'] = 'bool';
                ['Open'] = 'bool';
                ['UnHide'] = 'bool';
                ['Unlock'] = 'bool';
            };
        };
        ['GenerateLockDifficulty'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetInventoryToOpen'] = function (...) end;
        ['GetLockDifficulty'] = function (...) end;
        ['GetUsableEvent'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadOriginalModel'] = function (...) end;
        ['LoadPhaseModel'] = function (...) end;
        ['Lock'] = function (...) end;
        ['LockType'] = 'cartChest';
        ['NeedSerialize'] = function (...) end;
        ['OnClose'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnItemAdded'] = function (...) end;
        ['OnItemRemoved'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnLockpicked'] = function (...) end;
        ['OnOpen'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['Open'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Animation'] = {
                ['anim_Close'] = 'close';
                ['anim_Open'] = 'open';
                ['bOpenOnly'] = false;
            };
            ['Database'] = {
                ['bReadOnly'] = false;
                ['iMinimalShopItemPrice'] = 0;
                ['nRestockPeriodDays'] = 7;
                ['sGeneratedInventory'] = '';
                ['sInventoryPreset'] = '';
            };
            ['Lock'] = {
                ['bCanLockPick'] = true;
                ['bCanUnlockWithDynamicKey'] = true;
                ['bLockDifficultyOverride'] = false;
                ['bLocked'] = false;
                ['bSendMessage'] = false;
                ['esLockFanciness'] = 'Common';
                ['fLockDifficulty'] = 1;
                ['guidItemClassId'] = '';
            };
            ['Phase'] = {
                ['esStashPhaseChangeEvent'] = 'Never';
                ['object_PhaseModel'] = '';
            };
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bAllowUsageInCombatDanger'] = true;
                ['bTutorial'] = false;
                ['fTutorialMaxThievery'] = 15;
                ['fTutorialMaxThieveryOpenLimit'] = 10;
            };
            ['Sounds'] = {
                ['snd_Close'] = '';
                ['snd_Open'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractableThroughCollision'] = false;
            ['bOwnedByHome'] = true;
            ['bSaved_by_game'] = true;
            ['bSkipAngleCheck'] = false;
            ['esChestContextLabel'] = 'none';
            ['fUseAngle'] = 0.7;
            ['fUseDistance'] = 1.5;
            ['fUseZOffset'] = 0;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'objects/manmade/common_furniture/chests/chest-rustic-a-wagon.cga';
            ['sOpenMessage'] = '@ui_open_stash';
            ['sPickPlaceAnimTag'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetAnimationWithActivation'] = function (...) end;
        ['Server'] = {
            ['OnUpdate'] = function (...) end;
        };
        ['SetBeingUsedByNPC'] = function (...) end;
        ['SetBeingUsedByPlayer'] = function (...) end;
        ['SetInteractive'] = function (...) end;
        ['Unlock'] = function (...) end;
        ['UsesStealUiPrompt'] = function (...) end;
        ['__super'] = {
            ['AssignInventory'] = function (...) end;
            ['Close'] = function (...) end;
            ['DoPlayAnimation'] = function (...) end;
            ['Editor'] = {
                ['Icon'] = 'stash.bmp';
                ['IconOnTop'] = 1;
                ['ShowBounds'] = 1;
            };
            ['Event_Close'] = function (...) end;
            ['Event_Hide'] = function (...) end;
            ['Event_Lock'] = function (...) end;
            ['Event_Open'] = function (...) end;
            ['Event_StartLockPicking'] = function (...) end;
            ['Event_UnHide'] = function (...) end;
            ['Event_Unlock'] = function (...) end;
            ['FlowEvents'] = {
                ['Inputs'] = {
                    ['Close'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Hide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Lock'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Open'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['UnHide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Unlock'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                };
                ['Outputs'] = {
                    ['Close'] = 'bool';
                    ['Hide'] = 'bool';
                    ['Lock'] = 'bool';
                    ['Open'] = 'bool';
                    ['UnHide'] = 'bool';
                    ['Unlock'] = 'bool';
                };
            };
            ['GenerateLockDifficulty'] = function (...) end;
            ['GetActions'] = function (...) end;
            ['GetInventoryToOpen'] = function (...) end;
            ['GetLockDifficulty'] = function (...) end;
            ['GetUsableEvent'] = function (...) end;
            ['IsUsable'] = function (...) end;
            ['IsUsableHold'] = function (...) end;
            ['IsUsableMsgChanged'] = function (...) end;
            ['LoadOriginalModel'] = function (...) end;
            ['LoadPhaseModel'] = function (...) end;
            ['Lock'] = function (...) end;
            ['LockType'] = 'chest';
            ['NeedSerialize'] = function (...) end;
            ['OnClose'] = function (...) end;
            ['OnInventoryClosed'] = function (...) end;
            ['OnItemAdded'] = function (...) end;
            ['OnItemRemoved'] = function (...) end;
            ['OnLoad'] = function (...) end;
            ['OnLockpicked'] = function (...) end;
            ['OnOpen'] = function (...) end;
            ['OnPropertyChange'] = function (...) end;
            ['OnReset'] = function (...) end;
            ['OnSave'] = function (...) end;
            ['OnSpawn'] = function (...) end;
            ['OnUsed'] = function (...) end;
            ['OnUsedHold'] = function (...) end;
            ['Open'] = function (...) end;
            ['PhysicalizeThis'] = function (...) end;
            ['Properties'] = {
                ['Animation'] = {
                    ['anim_Close'] = 'close';
                    ['anim_Open'] = 'open';
                    ['bOpenOnly'] = false;
                };
                ['Database'] = {
                    ['bReadOnly'] = false;
                    ['iMinimalShopItemPrice'] = 0;
                    ['nRestockPeriodDays'] = 7;
                    ['sGeneratedInventory'] = '';
                    ['sInventoryPreset'] = '';
                };
                ['Lock'] = {
                    ['bCanLockPick'] = true;
                    ['bCanUnlockWithDynamicKey'] = true;
                    ['bLockDifficultyOverride'] = false;
                    ['bLocked'] = false;
                    ['bSendMessage'] = false;
                    ['esLockFanciness'] = 'Common';
                    ['fLockDifficulty'] = 1;
                    ['guidItemClassId'] = '';
                };
                ['Phase'] = {
                    ['esStashPhaseChangeEvent'] = 'Never';
                    ['object_PhaseModel'] = '';
                };
                ['Physics'] = {
                    ['Density'] = -1;
                    ['Mass'] = -1;
                    ['bPhysicalize'] = true;
                    ['bPushableByPlayers'] = false;
                    ['bRigidBody'] = true;
                };
                ['Script'] = {
                    ['Misc'] = '';
                    ['bAllowUsageInCombatDanger'] = true;
                    ['bTutorial'] = false;
                    ['fTutorialMaxThievery'] = 15;
                    ['fTutorialMaxThieveryOpenLimit'] = 10;
                };
                ['Sounds'] = {
                    ['snd_Close'] = '';
                    ['snd_Open'] = '';
                };
                ['bExported_to_game'] = true;
                ['bExported_to_test'] = true;
                ['bInteractableThroughCollision'] = false;
                ['bOwnedByHome'] = true;
                ['bSaved_by_game'] = true;
                ['bSkipAngleCheck'] = false;
                ['esChestContextLabel'] = 'none';
                ['fUseAngle'] = 0.7;
                ['fUseDistance'] = 2.5;
                ['fUseZOffset'] = 0;
                ['guidSmartObjectType'] = '';
                ['object_Model'] = 'objects/characters/assets/chest/chest_fancy_b.cdf';
                ['sOpenMessage'] = '@ui_open_stash';
                ['sPickPlaceAnimTag'] = '';
                ['sWH_AI_EntityCategory'] = '';
                ['soclass_SmartObjectHelpers'] = '';
            };
            ['Reset'] = function (...) end;
            ['ResetAnimationWithActivation'] = function (...) end;
            ['Server'] = {
                ['OnUpdate'] = function (...) end;
            };
            ['SetBeingUsedByNPC'] = function (...) end;
            ['SetBeingUsedByPlayer'] = function (...) end;
            ['SetInteractive'] = function (...) end;
            ['Unlock'] = function (...) end;
            ['UsesStealUiPrompt'] = function (...) end;
            ['bFirstUpdateAfterResetAnimation'] = false;
            ['bLocked'] = false;
            ['bNeedUpdate'] = 0;
            ['bNoAnims'] = 0;
            ['bOpenAfterUnlock'] = 0;
            ['bOpened'] = 0;
            ['bUseSameAnim'] = 0;
            ['bUseableMsgChanged'] = 0;
            ['fTutorialOpenCount'] = 0;
            ['inventoryId'] = 0;
            ['nDirection'] = -1;
            ['nSoundId'] = 0;
            ['nUserId'] = 0;
            ['objectPhaseChanged'] = false;
        };
        ['bFirstUpdateAfterResetAnimation'] = false;
        ['bLocked'] = false;
        ['bNeedUpdate'] = 0;
        ['bNoAnims'] = 0;
        ['bOpenAfterUnlock'] = 0;
        ['bOpened'] = 0;
        ['bUseSameAnim'] = 0;
        ['bUseableMsgChanged'] = 0;
        ['fTutorialOpenCount'] = 0;
        ['inventoryId'] = 0;
        ['nDirection'] = -1;
        ['nSoundId'] = 0;
        ['nUserId'] = 0;
        ['objectPhaseChanged'] = false;
    };
    CatHolder = {
        ['Editor'] = {
            ['Icon'] = 'cat.bmp';
            ['IconOnTop'] = 0;
        };
        ['Properties'] = {
            ['Model'] = 'Objects/characters/animals/cat/cat.cdf';
            ['RunAfterSpawn'] = false;
            ['SpawnDayOfWeek'] = 0;
            ['SpawnWeekLength'] = 7;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bLying'] = false;
            ['bSaved_by_game'] = true;
            ['esIdlePose'] = 'Sitting';
        };
    };
    CatWaypoint = {
        ['Editor'] = {
            ['Icon'] = 'Step.bmp';
            ['IconOnTop'] = 0;
        };
        ['Properties'] = {
            ['bExported_to_game'] = false;
            ['bExported_to_test'] = true;
            ['bFollowTerrain'] = false;
            ['bIsJump'] = false;
            ['bSaved_by_game'] = true;
        };
    };
    CattleBull = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 1.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_cow_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_cow_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Cow';
                ['footstepEffect'] = 'footsteps_Cow';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'cattle_bull';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/cow/cow.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 1.6;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.35;
                ['z'] = 0.9;
            };
            ['posCarcass'] = {
                ['x'] = 0.2;
                ['y'] = 0.35;
                ['z'] = 0.16;
            };
            ['radius'] = 0.35;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'CattleBull';
        ['defaultSoulClass'] = 'cattle_bull';
        ['gameParams'] = {
            ['backwardMultiplier'] = 0.5;
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 500;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 500;
            ['stiffness_scale'] = 73;
        };
        ['simplifiedRootRotation'] = false;
    };
    CattleCow = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 1.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_cow_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_cow_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 1;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 1;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Cow';
                ['footstepEffect'] = 'footsteps_Cow';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'cattle_cow';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/cow/cow.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 1.6;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.35;
                ['z'] = 0.9;
            };
            ['posCarcass'] = {
                ['x'] = 0.2;
                ['y'] = 0.35;
                ['z'] = 0.16;
            };
            ['radius'] = 0.35;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'CattleCow';
        ['defaultSoulClass'] = 'cattle_cow';
        ['gameParams'] = {
            ['backwardMultiplier'] = 0.5;
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 500;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 500;
            ['stiffness_scale'] = 73;
        };
        ['simplifiedRootRotation'] = false;
    };
    Chair = {
        ['Client'] = {
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Hide'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = true;
                ['bRigidBody'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bMissionCritical'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = false;
            ['bUsable'] = false;
            ['bUsable_by_player'] = true;
            ['object_Model'] = 'objects/props/furniture/chairs_benches/tripod_chair_01.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['SetFromProperties'] = function (...) end;
        ['SetupModel'] = function (...) end;
    };
    CharacterAttachHelper = {
        ['Client'] = {
            ['OnBindThis'] = function (...) end;
            ['OnUnBindThis'] = function (...) end;
        };
        ['DestroyAttachment'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Magnet.bmp';
        };
        ['MakeAttachment'] = function (...) end;
        ['OnBindThis'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnStartGame'] = function (...) end;
        ['OnUnBindThis'] = function (...) end;
        ['Properties'] = {
            ['BoneName'] = 'Bip01 Head';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['Server'] = {
            ['OnBindThis'] = function (...) end;
            ['OnUnBindThis'] = function (...) end;
        };
    };
    Chickens = {
        ['Animations'] = {
            [08] = 'hen_run_fwd';
            [01] = 'hen_walk_fwd';
            [04] = 'hen_idle_03_eating';
            [06] = 'throw';
            [02] = 'hen_idle_01_look_around';
            [03] = 'hen_idle_02_look_around';
            [07] = 'rooster_crowing';
            [05] = 'pickup';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['GetFlockType'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['SpecialModel'] = 'Data/objects/characters/animals/rooster/rooster.cdf';
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '18ff9093-2cc4-4ab3-9f34-7cb0dd7cd30a';
                ['nCount'] = 10;
                ['object_Model'] = 'objects/characters/animals/hen_v2/hen_v2.cdf';
                ['object_Model1'] = 'objects/characters/animals/hen_v2/hen_v2_brown.cdf';
                ['object_Model2'] = 'objects/characters/animals/hen_v2/hen_v2_black.cdf';
                ['object_Model3'] = 'objects/characters/animals/hen_v2/hen_v2_speckled.cdf';
                ['object_Model4'] = 'objects/characters/animals/hen_v2/hen_v2_white.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 20;
                ['AttractDistMin'] = 5;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 1;
                ['FactorSeparation'] = 1;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = true;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 15;
                ['FactorHeight'] = 1;
                ['FactorOrigin'] = 0.3;
                ['HeightMax'] = 1;
                ['HeightMin'] = 0;
                ['MaxAnimSpeed'] = 1;
                ['MaxDistFromOrigin'] = 30;
                ['RunAnimationSpeed'] = 2;
                ['RunThreshold'] = 1.1;
                ['SpeedMax'] = 0.4;
                ['SpeedMin'] = 0.4;
                ['SpeedScared'] = 2;
                ['WalkAnimationSpeed'] = 0.4;
            };
            ['Options'] = {
                ['ActiveHoursBegin'] = 4;
                ['ActiveHoursEnd'] = 21;
                ['PickableMessage'] = '';
                ['Radius'] = 6;
                ['VisibilityDist'] = 40;
                ['bActivate'] = true;
                ['bAvoidWater'] = true;
                ['bDisableOnRain'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = true;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bOwnedByHome'] = true;
            ['bRequiresOwner'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'def0005e-0000-0000-0000-def00000005e';
        };
        ['Sounds'] = {
            [03] = 'b_hen_death';
            [01] = 'b_hen_idle';
            [02] = 'b_hen_scared';
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Boids';
    };
    ChickensBrownLight = {
        ['Animations'] = {
            [08] = 'hen_run_fwd';
            [01] = 'hen_walk_fwd';
            [04] = 'hen_idle_03_eating';
            [06] = 'throw';
            [02] = 'hen_idle_01_look_around';
            [03] = 'hen_idle_02_look_around';
            [07] = 'rooster_crowing';
            [05] = 'pickup';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Deactivate'] = 'bool';
            };
        };
        ['GetFlockType'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['SpecialModel'] = 'Data/objects/characters/animals/rooster/rooster.cdf';
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '18ff9093-2cc4-4ab3-9f34-7cb0dd7cd30a';
                ['nCount'] = 10;
                ['object_Model'] = 'objects/characters/animals/hen_v2/hen_v2.cdf';
                ['object_Model1'] = 'objects/characters/animals/hen_v2/hen_v2_brown.cdf';
                ['object_Model2'] = 'objects/characters/animals/hen_v2/hen_v2_black.cdf';
                ['object_Model3'] = 'objects/characters/animals/hen_v2/hen_v2_speckled.cdf';
                ['object_Model4'] = 'objects/characters/animals/hen_v2/hen_v2_white.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 20;
                ['AttractDistMin'] = 5;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 1;
                ['FactorSeparation'] = 1;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = true;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 15;
                ['FactorHeight'] = 1;
                ['FactorOrigin'] = 0.3;
                ['HeightMax'] = 1;
                ['HeightMin'] = 0;
                ['MaxAnimSpeed'] = 1;
                ['MaxDistFromOrigin'] = 30;
                ['RunAnimationSpeed'] = 2;
                ['RunThreshold'] = 1.1;
                ['SpeedMax'] = 0.4;
                ['SpeedMin'] = 0.4;
                ['SpeedScared'] = 2;
                ['WalkAnimationSpeed'] = 0.4;
            };
            ['Options'] = {
                ['ActiveHoursBegin'] = 4;
                ['ActiveHoursEnd'] = 21;
                ['PickableMessage'] = '';
                ['Radius'] = 6;
                ['VisibilityDist'] = 40;
                ['bActivate'] = true;
                ['bAvoidWater'] = true;
                ['bDisableOnRain'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = true;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bOwnedByHome'] = true;
            ['bRequiresOwner'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'def0005e-0000-0000-0000-def00000005e';
        };
        ['Sounds'] = {
            [03] = 'b_hen_death';
            [01] = 'b_hen_idle';
            [02] = 'b_hen_scared';
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Boids';
    };
    ChickensWhite = {
        ['Animations'] = {
            [08] = 'hen_run_fwd';
            [01] = 'hen_walk_fwd';
            [04] = 'hen_idle_03_eating';
            [06] = 'throw';
            [02] = 'hen_idle_01_look_around';
            [03] = 'hen_idle_02_look_around';
            [07] = 'rooster_crowing';
            [05] = 'pickup';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Deactivate'] = 'bool';
            };
        };
        ['GetFlockType'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['SpecialModel'] = 'Data/objects/characters/animals/rooster/rooster.cdf';
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '18ff9093-2cc4-4ab3-9f34-7cb0dd7cd30a';
                ['nCount'] = 10;
                ['object_Model'] = 'objects/characters/animals/hen_v2/hen_v2_white.cdf';
                ['object_Model1'] = 'objects/characters/animals/hen_v2/hen_v2_brown.cdf';
                ['object_Model2'] = 'objects/characters/animals/hen_v2/hen_v2_black.cdf';
                ['object_Model3'] = 'objects/characters/animals/hen_v2/hen_v2_speckled.cdf';
                ['object_Model4'] = 'objects/characters/animals/hen_v2/hen_v2_white.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 20;
                ['AttractDistMin'] = 5;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 1;
                ['FactorSeparation'] = 1;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = true;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 15;
                ['FactorHeight'] = 1;
                ['FactorOrigin'] = 0.3;
                ['HeightMax'] = 1;
                ['HeightMin'] = 0;
                ['MaxAnimSpeed'] = 1;
                ['MaxDistFromOrigin'] = 30;
                ['RunAnimationSpeed'] = 2;
                ['RunThreshold'] = 1.1;
                ['SpeedMax'] = 0.4;
                ['SpeedMin'] = 0.4;
                ['SpeedScared'] = 2;
                ['WalkAnimationSpeed'] = 0.4;
            };
            ['Options'] = {
                ['ActiveHoursBegin'] = 4;
                ['ActiveHoursEnd'] = 21;
                ['PickableMessage'] = '';
                ['Radius'] = 6;
                ['VisibilityDist'] = 40;
                ['bActivate'] = true;
                ['bAvoidWater'] = true;
                ['bDisableOnRain'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = true;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bOwnedByHome'] = true;
            ['bRequiresOwner'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'def0005e-0000-0000-0000-def00000005e';
        };
        ['Sounds'] = {
            [03] = 'b_hen_death';
            [01] = 'b_hen_idle';
            [02] = 'b_hen_scared';
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Boids';
    };
    ChoppingBlock = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Eff2Spawn'] = function (...) end;
        ['Event_EffPos'] = function (...) end;
        ['Event_EffSpawn'] = function (...) end;
        ['Event_LogEntityId'] = function (...) end;
        ['Event_LogHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Effect2Spawn'] = {
                    [02] = 'void';
                    [01] = function (...) end;
                };
                ['EffectPos'] = {
                    [02] = 'Vec3';
                    [01] = function (...) end;
                };
                ['EffectSpawn'] = {
                    [02] = 'void';
                    [01] = function (...) end;
                };
                ['LogEntityId'] = {
                    [02] = 'int';
                    [01] = function (...) end;
                };
                ['LogHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['LogVisible'] = 'bool';
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Cutting'] = {
                ['Effect'] = 'particles_woodcutting.cutting.wood_split';
                ['Effect2'] = 'particles_woodcutting.cutting.wood_chip';
                ['pos'] = {
                    ['x'] = 0;
                    ['y'] = 0;
                    ['z'] = 0;
                };
            };
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/props/misc/wood_stock_anim/wood_stock_anim.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['Reset'] = function (...) end;
        ['RunCuttingEffect'] = function (...) end;
        ['RunCuttingEffect2'] = function (...) end;
        ['m_upDir'] = {
            ['x'] = 1;
            ['y'] = 0;
            ['z'] = 0;
        };
    };
    Cloth = {
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
        };
        ['Event_WindOff'] = function (...) end;
        ['Event_WindOn'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['WindOff'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['WindOn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['WindOff'] = 'bool';
                ['WindOn'] = 'bool';
            };
        };
        ['LookForEntityToAttachTo'] = function (...) end;
        ['OnDamage'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['accuracy'] = 0.05;
            ['air_resistance'] = 1;
            ['attach_radius'] = 0;
            ['bCollideWithPhysical'] = 1;
            ['bCollideWithPlayers'] = 1;
            ['bCollideWithStatics'] = 1;
            ['bCollideWithTerrain'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bRigidCore'] = 0;
            ['bSaved_by_game'] = true;
            ['collision_impulse_scale'] = 1;
            ['damping'] = 0.3;
            ['density'] = 200;
            ['explosion_scale'] = 0.003;
            ['fileModel'] = 'Objects/props/misc/cloth/cloth.cgf';
            ['friction'] = 0;
            ['gravity'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = '-9.8';
            };
            ['hardness'] = 20;
            ['impulse_scale'] = 0.02;
            ['mass'] = 5;
            ['mass_decay'] = 0;
            ['max_collision_impulse'] = 160;
            ['max_iters'] = 20;
            ['max_safe_step'] = 0.2;
            ['max_time_step'] = 0.02;
            ['sleep_speed'] = 0.01;
            ['thickness'] = 0.06;
            ['water_resistance'] = 600;
            ['wind'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['wind_event'] = {
                ['x'] = 0;
                ['y'] = 10;
                ['z'] = 0;
            };
            ['wind_variance'] = 0.2;
        };
        ['Server'] = {
            ['OnStartGame'] = function (...) end;
            ['OnUnHidden'] = function (...) end;
        };
        ['id_attach_to'] = -1;
        ['id_part_attach_to'] = -1;
    };
    Cloud = {
        ['CreateCloud'] = function (...) end;
        ['DeleteCloud'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Clouds.bmp';
            ['Model'] = 'Editor/Objects/Particles.cgf';
        };
        ['Event_Hide'] = function (...) end;
        ['Event_Show'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Show'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hide'] = 'bool';
                ['Show'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Movement'] = {
                ['bAutoMove'] = 0;
                ['fFadeDistance'] = 0;
                ['vector_SpaceLoopBox'] = {
                    ['x'] = 2000;
                    ['y'] = 2000;
                    ['z'] = 2000;
                };
                ['vector_Speed'] = {
                    ['x'] = 0;
                    ['y'] = 0;
                    ['z'] = 0;
                };
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['fScale'] = 1;
            ['file_CloudFile'] = 'Libs/Clouds/Default.xml';
        };
        ['SetMovementProperties'] = function (...) end;
        ['type'] = 'Cloud';
    };
    CombatDebug = {
        ['AddAllCombatPerks'] = function (...) end;
        ['AddCombatPerks'] = function (...) end;
        ['AddSkill'] = function (...) end;
        ['AddStat'] = function (...) end;
        ['DebugSkillKey'] = function (...) end;
        ['DebugSwitchWeapons'] = function (...) end;
        ['EnemyArmor'] = 0;
        ['EnemyProfile'] = 0;
        ['EnemyWeapon'] = 0;
        ['IDEnemy'] = 0;
        ['IDPlayer'] = 0;
        ['MakeSpawnedTough'] = function (...) end;
        ['PlayerArmor'] = 0;
        ['PlayerProfile'] = 0;
        ['PlayerWeapon'] = 0;
        ['RemoveAllCombatPerks'] = function (...) end;
        ['SetArmorProfile'] = function (...) end;
        ['SetDef'] = function (...) end;
        ['SetDefBack'] = function (...) end;
        ['SetEnv'] = function (...) end;
        ['SetHardcoreCVars'] = function (...) end;
        ['SetSkillProfile'] = function (...) end;
        ['Spawn'] = function (...) end;
        ['SpawnBattle'] = function (...) end;
        ['SpawnBattleOld'] = function (...) end;
        ['SpawnEnemy'] = function (...) end;
        ['SpawnFighters'] = function (...) end;
        ['SpawnFriend'] = function (...) end;
        ['StartLog'] = function (...) end;
        ['StopLog'] = function (...) end;
        ['TestCombat'] = function (...) end;
        ['TestLock'] = function (...) end;
        ['dbgSetV6'] = function (...) end;
    };
    Comment = {
        ['Editor'] = {
            ['Icon'] = 'Comment.bmp';
            ['Model'] = 'Editor/Objects/comment.cgf';
        };
        ['Event_Hide'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hide'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['Text'] = 'This is a comment';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bFixed'] = false;
            ['bHidden'] = false;
            ['bSaved_by_game'] = false;
            ['clrDiffuse'] = {
                ['x'] = 1;
                ['y'] = 0.5;
                ['z'] = 0;
            };
            ['fMaxDist'] = 100;
            ['fSize'] = 1.2;
            ['nCharsPerLine'] = 30;
        };
        ['bNoUpdateInGame'] = 1;
        ['fMaxDistSquared'] = 0;
        ['hidden'] = false;
        ['lineCount'] = 0;
    };
    Concept = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIncludeModConcepts'] = false;
            ['bSaved_by_game'] = true;
            ['fileConcept'] = '';
        };
    };
    Constraint = {
        ['Apply'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Magnet.bmp';
            ['ShowBounds'] = 1;
        };
        ['Event_ConstraintBroken'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['ConstraintBroken'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['ConstraintBroken'] = 'bool';
            };
        };
        ['OnDestroy'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['Properties'] = {
            ['Limits'] = {
                ['x_max'] = 0;
                ['x_min'] = 0;
                ['yz_max'] = 0;
            };
            ['bConstrainFully'] = 1;
            ['bConstrainToLine'] = 0;
            ['bConstrainToPlane'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNoRotation'] = 0;
            ['bNoSelfCollisions'] = 1;
            ['bSaved_by_game'] = true;
            ['bUseEntityFrame'] = 1;
            ['damping'] = 0;
            ['max_bend_torque'] = 0;
            ['max_pull_force'] = 0;
            ['radius'] = 0.03;
        };
        ['numUpdates'] = 0;
    };
    CreateItemTable = function (...) end;
    Crime = {
        ['BuildLockpickPromptStrName'] = function (...) end;
        ['DetermineSuspiciousDealReaction'] = function (...) end;
        ['GetSkillcheckLevelFromPrice'] = function (...) end;
        ['GetStatusMultiplier'] = function (...) end;
        ['ProduceAiSoundOnDudePosition'] = function (...) end;
        ['SendCampTrespassChatResult'] = function (...) end;
        ['SendCombatChatResult'] = function (...) end;
        ['SendFriskChatResult'] = function (...) end;
        ['SendFriskDialogResult'] = function (...) end;
        ['SendOffenceChatAction'] = function (...) end;
        ['SendResolveDialogResult'] = function (...) end;
        ['SendSelfhelpChatResult'] = function (...) end;
        ['SendSelfhelpResolveDialogResult'] = function (...) end;
        ['SendSurrenderChatResult'] = function (...) end;
        ['SendSurrenderDialogResult'] = function (...) end;
    };
    CrimeDebugger = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = '43c857b4-032b-844f-3d1b-3cc90d5a2382';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['SetDebugEnabled'] = function (...) end;
        ['SetHighestPerceptionThreshold'] = function (...) end;
        ['_getPerceptionIconPosition'] = function (...) end;
        ['_getPerceptionIconString'] = function (...) end;
        ['bPerceptionDebugEnabled'] = false;
        ['fHighestPerceptionThreshold'] = 0;
    };
    CryAction = {
        ['ActivateEffect'] = function (...) end;
        ['ActivateExtensionForGameObject'] = function (...) end;
        ['AddAngleSignal'] = function (...) end;
        ['AddRangeSignal'] = function (...) end;
        ['AddTargetRangeSignal'] = function (...) end;
        ['BanPlayer'] = function (...) end;
        ['BindGameObjectToNetwork'] = function (...) end;
        ['CacheItemGeometry'] = function (...) end;
        ['CacheItemSound'] = function (...) end;
        ['ClearEntityTags'] = function (...) end;
        ['ClearStaticTag'] = function (...) end;
        ['ConnectToServer'] = function (...) end;
        ['CreateGameObjectForEntity'] = function (...) end;
        ['DestroyRangeSignaling'] = function (...) end;
        ['DisableSignalTimer'] = function (...) end;
        ['DontSyncPhysics'] = function (...) end;
        ['EnableRangeSignaling'] = function (...) end;
        ['EnableSignalTimer'] = function (...) end;
        ['ForceGameObjectUpdate'] = function (...) end;
        ['GetClassName'] = function (...) end;
        ['GetPlayerList'] = function (...) end;
        ['GetServer'] = function (...) end;
        ['GetServerTime'] = function (...) end;
        ['GetWaterInfo'] = function (...) end;
        ['HasAI'] = function (...) end;
        ['IsChannelOnHold'] = function (...) end;
        ['IsChannelSpecial'] = function (...) end;
        ['IsClient'] = function (...) end;
        ['IsGameObjectProbablyVisible'] = function (...) end;
        ['IsGameStarted'] = function (...) end;
        ['IsImmersivenessEnabled'] = function (...) end;
        ['IsRMIServer'] = function (...) end;
        ['IsServer'] = function (...) end;
        ['LoadXML'] = function (...) end;
        ['PauseGame'] = function (...) end;
        ['Persistant2DText'] = function (...) end;
        ['PersistantArrow'] = function (...) end;
        ['PersistantEntityTag'] = function (...) end;
        ['PersistantLine'] = function (...) end;
        ['PersistantSphere'] = function (...) end;
        ['PreLoadADB'] = function (...) end;
        ['RefreshPings'] = function (...) end;
        ['RegisterWithAI'] = function (...) end;
        ['ResetRangeSignaling'] = function (...) end;
        ['ResetSignalTimer'] = function (...) end;
        ['ResetToNormalCamera'] = function (...) end;
        ['SaveXML'] = function (...) end;
        ['SendGameplayEvent'] = function (...) end;
        ['SetAimQueryMode'] = function (...) end;
        ['SetNetworkParent'] = function (...) end;
        ['SetSignalTimerRate'] = function (...) end;
        ['SetViewCamera'] = function (...) end;
        ['SetViewCameraByAngles'] = function (...) end;
    };
    CutsceneHolder = {
        ['Editor'] = {
            ['Icon'] = 'CutsceneHolder.bmp';
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esCutsceneName'] = '';
        };
    };
    DeadBody = {
        ['Client'] = {
            ['OnInit'] = function (...) end;
        };
        ['Client_OnInit'] = function (...) end;
        ['DeadBodyParams'] = {
            ['damping'] = 0.3;
            ['freefall_damping'] = 0.1;
            ['lying_damping'] = 1.5;
            ['lying_mode_ncolls'] = 4;
            ['lying_sleep_speed'] = 0.065;
            ['max_time_step'] = 0.025;
            ['sleep_speed'] = 0.025;
        };
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Awake'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Hit'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Awake'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Awake'] = 'bool';
                ['Hit'] = 'bool';
                ['Scanned'] = 'bool';
            };
        };
        ['HasBeenScanned'] = function (...) end;
        ['OnHit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['PhysParams'] = {
            ['eyeheight'] = 1.7;
            ['height'] = 1.8;
            ['lod'] = 1;
            ['mass'] = 80;
            ['radius'] = 0.45;
            ['retain_joint_vel'] = 0;
            ['sphereheight'] = 1.2;
            ['stiffness_scale'] = 0;
        };
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Buoyancy'] = {
                ['water_damping'] = 0;
                ['water_density'] = 1000;
                ['water_resistance'] = 1000;
            };
            ['Mass'] = 80;
            ['MaxTimeStep'] = 0.025;
            ['PoseAnim'] = '';
            ['Stiffness'] = 0;
            ['TacticalInfo'] = {
                ['LookupName'] = '';
                ['bScannable'] = 0;
            };
            ['bCollidesWithPlayers'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bExtraStiff'] = 0;
            ['bNoFriendlyFire'] = false;
            ['bPushableByPlayers'] = false;
            ['bResting'] = 1;
            ['bSaved_by_game'] = true;
            ['lying_damping'] = 1.5;
            ['object_Model'] = 'objects/characters/humans/male/skeleton/male.cdf';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Server'] = {
            ['OnDamage'] = function (...) end;
            ['OnHit'] = function (...) end;
            ['OnInit'] = function (...) end;
        };
        ['Server_OnDamageDead'] = function (...) end;
        ['Server_OnInit'] = function (...) end;
        ['temp_ModelName'] = '';
        ['type'] = 'DeadBody';
    };
    DeadBody_Base_Human = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fArm_left'] = 0;
                    ['fArm_right'] = 0;
                    ['fHead'] = 0;
                    ['fLeg_left'] = 0;
                    ['fLeg_right'] = 0;
                    ['fTorso'] = 0;
                };
                ['bLootableByPlayer'] = true;
                ['bRagdollOnly'] = false;
                ['bRagdollOnly_DontPosition'] = false;
                ['fAddDirt'] = 0;
            };
        };
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
    };
    DeadBody_Horse = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fHead'] = 0;
                    ['fLegs'] = 0;
                    ['fTorso'] = 0;
                };
                ['bRagdollOnly'] = false;
                ['esDeadBody_Horse_Variant'] = 'horse_lyingOnLeftSide_01';
                ['fAddDirt'] = 0;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
    };
    DeadBody_Human = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fArm_left'] = 0;
                    ['fArm_right'] = 0;
                    ['fHead'] = 0;
                    ['fLeg_left'] = 0;
                    ['fLeg_right'] = 0;
                    ['fTorso'] = 0;
                };
                ['bLootableByPlayer'] = true;
                ['bRagdollOnly'] = false;
                ['bRagdollOnly_DontPosition'] = false;
                ['esDeadBody_Human_Variant'] = 'male_lyingOnBack_01';
                ['fAddDirt'] = 0;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
    };
    DeadBody_WolfDog = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fTorso'] = 0;
                };
                ['esDeadBody_WolfDog_Variant'] = 'wolfDog_lyingOnRightSide_01';
                ['fAddDirt'] = 0;
            };
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['unstanceName'] = '';
    };
    Debris = {
        ['Client'] = {
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['CommonSwitchToMaterial'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Activate'] = function (...) end;
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_SwitchToMaterial1'] = function (...) end;
        ['Event_SwitchToMaterial2'] = function (...) end;
        ['Event_SwitchToMaterialOriginal'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['DisableUsable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['MakeInvulnerable'] = {
                    [02] = 'any';
                };
                ['MakeVulnerable'] = {
                    [02] = 'any';
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ResetHealth'] = {
                    [02] = 'any';
                };
                ['SwitchToMaterial1'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['SwitchToMaterial2'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['SwitchToMaterialOriginal'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['Dead'] = 'bool';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Health'] = 'float';
                ['Hide'] = 'bool';
                ['Hit'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnDamage'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPhysicsBreak'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['AI'] = {
                ['bUsedAsDynamicObstacle'] = 1;
            };
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['Buoyancy'] = {
                    ['water_damping'] = 0;
                    ['water_density'] = 1000;
                    ['water_resistance'] = 1000;
                };
                ['CGFPropsOverride'] = {
                    ['Constraint'] = {
                        ['constraint_collides'] = '';
                        ['constraint_damping'] = '';
                        ['constraint_limit'] = '';
                        ['constraint_maxang'] = '';
                        ['constraint_minang'] = '';
                    };
                    ['Deformable'] = {
                        ['explosion_scale'] = '';
                        ['hardness'] = '';
                        ['max_impulse'] = '';
                        ['max_stretch'] = '';
                        ['skin_dist'] = '';
                        ['stiffness'] = '';
                        ['thickness'] = '';
                    };
                    ['Joint'] = {
                        ['bend'] = '';
                        ['limit'] = '';
                        ['pull'] = '';
                        ['push'] = '';
                        ['shift'] = '';
                        ['twist'] = '';
                    };
                    ['player_can_break'] = '';
                };
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['ForeignData'] = {
                    ['bMovingPlatform'] = 0;
                };
                ['Mass'] = -1;
                ['Simulation'] = {
                    ['bFixedDamping'] = 0;
                    ['bUseSimpleSolver'] = 0;
                    ['damping'] = 0;
                    ['max_time_step'] = 0.02;
                    ['sleep_speed'] = 0.04;
                };
                ['bActivateOnDamage'] = 0;
                ['bCanBreakOthers'] = 0;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = true;
                ['bResting'] = 1;
                ['bRigidBody'] = true;
                ['bRigidBodyActive'] = true;
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bDamagesPlayerOnCollisionSP'] = 0;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bMissionCritical'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = false;
            ['bSerialize'] = 0;
            ['bUsable'] = false;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'objects/default/primitive_pyramid.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['Server'] = {
            ['Activated'] = {
                ['OnBeginState'] = function (...) end;
                ['OnDamage'] = function (...) end;
                ['OnPhysicsBreak'] = function (...) end;
            };
            ['Default'] = {
                ['OnBeginState'] = function (...) end;
                ['OnDamage'] = function (...) end;
                ['OnPhysicsBreak'] = function (...) end;
            };
        };
        ['SetFromProperties'] = function (...) end;
        ['SetupModel'] = function (...) end;
        ['States'] = {
            [02] = 'Activated';
            [01] = 'Default';
        };
        ['__super'] = {
            ['Client'] = {
                ['OnPhysicsBreak'] = function (...) end;
            };
            ['CommonSwitchToMaterial'] = function (...) end;
            ['Editor'] = {
                ['Icon'] = 'physicsobject.bmp';
                ['IconOnTop'] = 1;
            };
            ['Event_Activate'] = function (...) end;
            ['Event_DisableUsable'] = function (...) end;
            ['Event_EnableUsable'] = function (...) end;
            ['Event_Hide'] = function (...) end;
            ['Event_Ragdollize'] = function (...) end;
            ['Event_Remove'] = function (...) end;
            ['Event_SwitchToMaterial1'] = function (...) end;
            ['Event_SwitchToMaterial2'] = function (...) end;
            ['Event_SwitchToMaterialOriginal'] = function (...) end;
            ['Event_UnHide'] = function (...) end;
            ['Event_Used'] = function (...) end;
            ['FlowEvents'] = {
                ['Inputs'] = {
                    ['Activate'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['DisableUsable'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['EnableUsable'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Hide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['MakeInvulnerable'] = {
                        [02] = 'any';
                    };
                    ['MakeVulnerable'] = {
                        [02] = 'any';
                    };
                    ['Ragdollize'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Remove'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['ResetHealth'] = {
                        [02] = 'any';
                    };
                    ['SwitchToMaterial1'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['SwitchToMaterial2'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['SwitchToMaterialOriginal'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['UnHide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Used'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                };
                ['Outputs'] = {
                    ['Activate'] = 'bool';
                    ['Break'] = 'int';
                    ['Dead'] = 'bool';
                    ['DisableUsable'] = 'bool';
                    ['EnableUsable'] = 'bool';
                    ['Health'] = 'float';
                    ['Hide'] = 'bool';
                    ['Hit'] = 'bool';
                    ['Ragdollized'] = 'bool';
                    ['Remove'] = 'bool';
                    ['UnHide'] = 'bool';
                    ['Used'] = 'bool';
                };
            };
            ['GetUsableMessage'] = function (...) end;
            ['IsRigidBody'] = function (...) end;
            ['IsUsable'] = function (...) end;
            ['OnDamage'] = function (...) end;
            ['OnLoad'] = function (...) end;
            ['OnPhysicsBreak'] = function (...) end;
            ['OnPropertyChange'] = function (...) end;
            ['OnReset'] = function (...) end;
            ['OnSave'] = function (...) end;
            ['OnSpawn'] = function (...) end;
            ['OnUsed'] = function (...) end;
            ['PhysicalizeThis'] = function (...) end;
            ['Properties'] = {
                ['AI'] = {
                    ['bUsedAsDynamicObstacle'] = 1;
                };
                ['DmgFactorWhenCollidingAI'] = 1;
                ['MultiplayerOptions'] = {
                    ['bNetworked'] = false;
                };
                ['Physics'] = {
                    ['Buoyancy'] = {
                        ['water_damping'] = 0;
                        ['water_density'] = 1000;
                        ['water_resistance'] = 1000;
                    };
                    ['CGFPropsOverride'] = {
                        ['Constraint'] = {
                            ['constraint_collides'] = '';
                            ['constraint_damping'] = '';
                            ['constraint_limit'] = '';
                            ['constraint_maxang'] = '';
                            ['constraint_minang'] = '';
                        };
                        ['Deformable'] = {
                            ['explosion_scale'] = '';
                            ['hardness'] = '';
                            ['max_impulse'] = '';
                            ['max_stretch'] = '';
                            ['skin_dist'] = '';
                            ['stiffness'] = '';
                            ['thickness'] = '';
                        };
                        ['Joint'] = {
                            ['bend'] = '';
                            ['limit'] = '';
                            ['pull'] = '';
                            ['push'] = '';
                            ['shift'] = '';
                            ['twist'] = '';
                        };
                        ['player_can_break'] = '';
                    };
                    ['CollisionFiltering'] = {
                        ['collisionIgnore'] = {
                            ['bT_collision_class_articulated'] = 0;
                            ['bT_collision_class_living'] = 0;
                            ['bT_collision_class_particle'] = 0;
                            ['bT_collision_class_soft'] = 0;
                            ['bT_collision_class_terrain'] = 0;
                            ['bT_collision_class_wheeled'] = 0;
                            ['bT_gcc_ai'] = 0;
                            ['bT_gcc_animal'] = 0;
                            ['bT_gcc_decoy_projectile'] = 0;
                            ['bT_gcc_horse'] = 0;
                            ['bT_gcc_horse_bridle'] = 0;
                            ['bT_gcc_ignore_z_correction'] = 0;
                            ['bT_gcc_interactive'] = 0;
                            ['bT_gcc_item'] = 0;
                            ['bT_gcc_ledge'] = 0;
                            ['bT_gcc_npc_ignored_type'] = 0;
                            ['bT_gcc_npc_reported_type'] = 0;
                            ['bT_gcc_player_body'] = 0;
                            ['bT_gcc_player_capsule'] = 0;
                            ['bT_gcc_player_ghostable_type'] = 0;
                            ['bT_gcc_player_type'] = 0;
                            ['bT_gcc_ragdoll'] = 0;
                            ['bT_gcc_rigid'] = 0;
                            ['bT_gcc_vehicle'] = 0;
                        };
                        ['collisionType'] = {
                            ['bT_collision_class_articulated'] = 0;
                            ['bT_collision_class_living'] = 0;
                            ['bT_collision_class_particle'] = 0;
                            ['bT_collision_class_soft'] = 0;
                            ['bT_collision_class_terrain'] = 0;
                            ['bT_collision_class_wheeled'] = 0;
                            ['bT_gcc_ai'] = 0;
                            ['bT_gcc_animal'] = 0;
                            ['bT_gcc_decoy_projectile'] = 0;
                            ['bT_gcc_horse'] = 0;
                            ['bT_gcc_horse_bridle'] = 0;
                            ['bT_gcc_ignore_z_correction'] = 0;
                            ['bT_gcc_interactive'] = 0;
                            ['bT_gcc_item'] = 0;
                            ['bT_gcc_ledge'] = 0;
                            ['bT_gcc_npc_ignored_type'] = 0;
                            ['bT_gcc_npc_reported_type'] = 0;
                            ['bT_gcc_player_body'] = 0;
                            ['bT_gcc_player_capsule'] = 0;
                            ['bT_gcc_player_ghostable_type'] = 0;
                            ['bT_gcc_player_type'] = 0;
                            ['bT_gcc_ragdoll'] = 0;
                            ['bT_gcc_rigid'] = 0;
                            ['bT_gcc_vehicle'] = 0;
                        };
                    };
                    ['Density'] = -1;
                    ['ForeignData'] = {
                        ['bMovingPlatform'] = 0;
                    };
                    ['Mass'] = -1;
                    ['Simulation'] = {
                        ['bFixedDamping'] = 0;
                        ['bUseSimpleSolver'] = 0;
                        ['damping'] = 0;
                        ['max_time_step'] = 0.02;
                        ['sleep_speed'] = 0.04;
                    };
                    ['bActivateOnDamage'] = 0;
                    ['bCanBreakOthers'] = 0;
                    ['bPhysicalize'] = true;
                    ['bPushableByPlayers'] = true;
                    ['bResting'] = 1;
                    ['bRigidBody'] = true;
                    ['bRigidBodyActive'] = true;
                };
                ['UseMessage'] = '';
                ['bCanTriggerAreas'] = false;
                ['bDamagesPlayerOnCollisionSP'] = 0;
                ['bExcludeCover'] = false;
                ['bExported_to_game'] = true;
                ['bExported_to_test'] = true;
                ['bHeavyObject'] = false;
                ['bInteractLargeObject'] = false;
                ['bMissionCritical'] = false;
                ['bPickable'] = false;
                ['bSaved_by_game'] = true;
                ['bSerialize'] = 0;
                ['bUsable'] = false;
                ['guidSmartObjectType'] = '';
                ['object_Model'] = 'objects/default/primitive_pyramid.cgf';
                ['sWH_AI_EntityCategory'] = '';
                ['soclass_SmartObjectHelpers'] = '';
                ['soclasses_SmartObjectClass'] = '';
            };
            ['ResetOnUsed'] = function (...) end;
            ['Server'] = {
                ['Activated'] = {
                    ['OnBeginState'] = function (...) end;
                    ['OnDamage'] = function (...) end;
                    ['OnPhysicsBreak'] = function (...) end;
                };
                ['Default'] = {
                    ['OnBeginState'] = function (...) end;
                    ['OnDamage'] = function (...) end;
                    ['OnPhysicsBreak'] = function (...) end;
                };
            };
            ['SetFromProperties'] = function (...) end;
            ['SetupModel'] = function (...) end;
            ['States'] = {
                [01] = 'Default';
                [02] = 'Activated';
            };
            ['bRigidBodyActive'] = true;
        };
        ['bRigidBodyActive'] = true;
    };
    DebugUtils = {
        ['CheckExp'] = function (...) end;
        ['DistanceToPlayer'] = function (...) end;
        ['FakeLoadedGameVersion'] = function (...) end;
        ['FlyMode'] = function (...) end;
        ['Log'] = function (...) end;
        ['LogError'] = function (...) end;
        ['LogWarning'] = function (...) end;
        ['NavmeshCleaner'] = function (...) end;
        ['RainOff'] = function (...) end;
        ['RainOn'] = function (...) end;
        ['UnlockAllCodexEntries'] = function (...) end;
        ['WarnDeprecated'] = function (...) end;
    };
    DestroStash = {
        ['AfterReset'] = function (...) end;
        ['AfterShot'] = function (...) end;
        ['AssignInventory'] = function (...) end;
        ['CanBeUsed'] = function (...) end;
        ['Client'] = {
            ['OnHit'] = function (...) end;
        };
        ['Close'] = function (...) end;
        ['DoPlaySound'] = function (...) end;
        ['DoStopSound'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DestroStash.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Close'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Open'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Close'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Open'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Close'] = 'bool';
                ['Hide'] = 'bool';
                ['Open'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetSoundTriggerID'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Open'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Database'] = {
                ['bReadOnly'] = true;
                ['guidInventoryDBId'] = 0;
                ['sInventoryPreset'] = '';
            };
            ['Lock'] = {
                ['bCanLockPick'] = false;
                ['bCanUnlockWithDynamicKey'] = false;
                ['bLockDifficultyOverride'] = false;
                ['bLocked'] = false;
                ['bSendMessage'] = false;
                ['esLockFanciness'] = 'Common';
                ['fLockDifficulty'] = 1;
                ['guidItemClassId'] = '';
            };
            ['ParticleEffect'] = '';
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = 1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['Sounds'] = {
                ['snd_Hit'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/natural/animal/bird_nest.cgf';
            ['object_ShardModel'] = 'objects/natural/stones/stone_basalt_b.cgf';
        };
        ['Reset'] = function (...) end;
        ['SpawnShard'] = function (...) end;
        ['StartParticleEffect'] = function (...) end;
        ['bLocked'] = false;
        ['inventoryId'] = 0;
        ['shot'] = 0;
    };
    DestroyableObject = {
        ['ActivateDelayEffect'] = function (...) end;
        ['AfterThrownTimer'] = function (...) end;
        ['Base_OnUsed'] = function (...) end;
        ['CacheResources'] = function (...) end;
        ['CanBeMadeTargetable'] = function (...) end;
        ['Client'] = {
            ['Alive'] = {
                ['OnBeginState'] = function (...) end;
                ['OnPhysicsBreak'] = function (...) end;
            };
            ['ClActivateDelayEffect'] = function (...) end;
            ['ClExplode'] = function (...) end;
            ['ClUsedBy'] = function (...) end;
            ['Dead'] = {
                ['OnBeginState'] = function (...) end;
            };
            ['OnInit'] = function (...) end;
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['CommonInit'] = function (...) end;
        ['DeactivateTacticalInfo'] = function (...) end;
        ['Die'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'explosion.bmp';
            ['IsScalable'] = false;
        };
        ['Event_Dead'] = function (...) end;
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Explode'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Hit'] = function (...) end;
        ['Event_MakeInvulnerable'] = function (...) end;
        ['Event_MakeVulnerable'] = function (...) end;
        ['Event_Reset'] = function (...) end;
        ['Event_ResetHealth'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['Explode'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Explode'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['MakeInvulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['MakeVulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['Reset'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ResetHealth'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Break'] = 'int';
                ['Dead'] = 'bool';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Explode'] = 'bool';
                ['Health'] = 'float';
                ['Hide'] = 'bool';
                ['Hit'] = 'bool';
                ['HitBy'] = 'entity';
                ['Reset'] = 'bool';
                ['Scanned'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
                ['UsedBy'] = 'entity';
            };
        };
        ['GetHealthRatio'] = function (...) end;
        ['GetMaxHealth'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['HasBeenScanned'] = function (...) end;
        ['IsDead'] = function (...) end;
        ['IsInvulnerable'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnThrown'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['AutoAimTarget'] = {
                ['AfterThrownTargetableTime'] = 3;
                ['InnerRadiusVolumeFactor'] = 0.35;
                ['OuterRadiusVolumeFactor'] = 0.6;
                ['SnapRadiusVolumeFactor'] = 1.25;
                ['bMakeTargetableOnThrown'] = 0;
            };
            ['Breakage'] = {
                ['bSurfaceEffects'] = 1;
                ['fExplodeImpulse'] = 0;
                ['fLifeTime'] = 10;
            };
            ['DamageMultipliers'] = {
                ['fBullet'] = 1;
                ['fCollision'] = 1;
                ['fProjectileClass'] = 1;
            };
            ['DestroyedSubObject'] = '';
            ['DmgFactorWhenCollidingAI'] = 1;
            ['Explosion'] = {
                ['Damage'] = 1000;
                ['Delay'] = 0;
                ['DelayEffect'] = {
                    ['Params'] = {
                        ['AttachForm'] = 'none';
                        ['AttachType'] = 'none';
                        ['CountScale'] = 1;
                        ['Scale'] = 1;
                        ['SpawnPeriod'] = 0;
                        ['bCountPerUnit'] = false;
                        ['bPrime'] = false;
                        ['bSizePerUnit'] = 0;
                    };
                    ['ParticleEffect'] = '';
                    ['bHasDelayEffect'] = 0;
                    ['vOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 0;
                    };
                    ['vRotation'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 0;
                    };
                };
                ['Direction'] = {
                    ['x'] = 0;
                    ['y'] = 0;
                    ['z'] = 1;
                };
                ['EffectScale'] = 1;
                ['MinPhysRadius'] = 2.5;
                ['MinRadius'] = 5;
                ['ParticleEffect'] = 'explosions.grenade_air.explosion';
                ['PhysRadius'] = 5;
                ['Pressure'] = 1000;
                ['Radius'] = 10;
                ['SoundRadius'] = 0;
                ['vOffset'] = {
                    ['x'] = 0;
                    ['y'] = 0;
                    ['z'] = 0;
                };
            };
            ['Health'] = {
                ['MaxHealth'] = 500;
                ['bInvulnerable'] = false;
                ['bOnlyEnemyFire'] = true;
            };
            ['ModelSubObject'] = '';
            ['Physics'] = {
                ['Density'] = -1;
                ['MP'] = {
                    ['bDontSyncPos'] = 0;
                };
                ['Mass'] = 100;
                ['Simulation'] = {
                    ['damping'] = 0;
                    ['max_time_step'] = 0.02;
                    ['sleep_speed'] = 0.04;
                };
                ['bActivateOnDamage'] = 0;
                ['bCanBreakOthers'] = 0;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
                ['bRigidBodyActive'] = true;
                ['bRigidBodyAfterDeath'] = 1;
            };
            ['Sounds'] = {
                ['bStopSoundsOnDestroyed'] = 1;
                ['fAISoundRadius'] = 30;
                ['sound_Alive'] = '';
                ['sound_Dead'] = '';
                ['sound_Dying'] = '';
            };
            ['TacticalInfo'] = {
                ['LookupName'] = '';
                ['bScannable'] = 0;
            };
            ['UseMessage'] = '';
            ['Vulnerability'] = {
                ['bBullet'] = 1;
                ['bCollision'] = 1;
                ['bExplosion'] = 1;
                ['bMelee'] = 1;
                ['bOther'] = 1;
                ['projectileClass'] = '';
            };
            ['bAutoGenAIHidePts'] = 0;
            ['bExplode'] = 1;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractLargeObject'] = false;
            ['bOnlyAllowPlayerToFullyDestroyObject'] = 0;
            ['bPickable'] = false;
            ['bPlayerOnly'] = 1;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
            ['esFaction'] = '';
            ['fDamageTreshold'] = 0;
            ['object_Model'] = 'objects/default/primitive_sphere.cgf';
            ['object_ModelDestroyed'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterWithAI'] = function (...) end;
        ['Reload'] = function (...) end;
        ['RemoveEffect'] = function (...) end;
        ['ResetOnUsed'] = function (...) end;
        ['RestorePhysicalState'] = function (...) end;
        ['SavePhysicalState'] = function (...) end;
        ['Server'] = {
            ['Alive'] = {
                ['OnTimer'] = function (...) end;
            };
            ['Dead'] = {
                ['OnBeginState'] = function (...) end;
            };
            ['OnHit'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnTimer'] = function (...) end;
            ['SvRequestUsedBy'] = function (...) end;
        };
        ['SetCurrentSlot'] = function (...) end;
        ['SetInvulnerability'] = function (...) end;
        ['SetupHealthProperties'] = function (...) end;
        ['States'] = {
            [02] = 'Dead';
            [01] = 'Alive';
        };
        ['__client_dispatch'] = {
            [03] = 'ClActivateDelayEffect:';
            [01] = 'ClExplode:';
            [02] = 'ClUsedBy:E';
            ['ClActivateDelayEffect'] = function (...) end;
            ['ClExplode'] = function (...) end;
            ['ClUsedBy'] = function (...) end;
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            [01] = 'SvRequestUsedBy:E';
            ['SvRequestUsedBy'] = function (...) end;
            ['__validated'] = false;
        };
    };
    DetailMovementSmartObject = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MovementDetails'] = {
                ['esMovementSpeed'] = 'b_Walk';
                ['fContinualSuccessDistance'] = 10;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['movementSpeed'] = 'Walk';
    };
    DialogModule = {
        ['AnalyzeRequest'] = function (...) end;
        ['ForceDialog'] = function (...) end;
        ['IsSoulInDialog'] = function (...) end;
        ['ResetHaggle'] = function (...) end;
        ['SetAIInteractionState'] = function (...) end;
        ['SetPlayerInteractiveState'] = function (...) end;
    };
    DialogState = function (...) end;
    DialogTrigger = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
        };
    };
    DialogUtils = {
        ['DialogState'] = function (...) end;
        ['EventChaseCheckItemsOnPlayer'] = function (...) end;
        ['GetMoneySliderInputSelectedAmount'] = function (...) end;
        ['HidePaymentAmount'] = function (...) end;
        ['ImpressByPlayer'] = function (...) end;
        ['MoneySliderSetupResultNpcLimitFail'] = function (...) end;
        ['MoneySliderSetupResultPlayerLimitFail'] = function (...) end;
        ['MoneySliderSetupResultSuccess'] = function (...) end;
        ['PersuadeByPlayer'] = function (...) end;
        ['ProcessPayment'] = function (...) end;
        ['RequestPlayerMonologByMetarole'] = function (...) end;
        ['SetupBribe'] = function (...) end;
        ['SetupHaggle'] = function (...) end;
        ['SetupMoneySlider'] = function (...) end;
        ['ShowPaymentAmount'] = function (...) end;
        ['SimpleBribeTransaction'] = function (...) end;
        ['SkillCheck'] = function (...) end;
        ['ThreatenByPlayer'] = function (...) end;
        ['dialogParticipant'] = '';
    };
    DialogueHolder = {
        ['Editor'] = {
            ['Icon'] = 'DialogueHolder.bmp';
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
    };
    Dice = {
        ['HoldDie'] = function (...) end;
        ['OverrideNextThrow'] = function (...) end;
        ['RollDie'] = function (...) end;
        ['SetAIDifficulty'] = function (...) end;
        ['SetAIRiskTaking'] = function (...) end;
        ['SetAdvantage'] = function (...) end;
        ['SetScore'] = function (...) end;
        ['ToggleHoldDie'] = function (...) end;
    };
    DiceInteractor = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 0;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = false;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/manmade/task_specific_props/entertainment/games/dice/dice_board.cgf';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetDiceAvailable'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['diceAvailable'] = true;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    DiceMinigameCup = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 0;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = false;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['object_Model'] = 'objects/manmade/task_specific_props/entertainment/games/dice/dice_cup_b.cgf';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['__super'] = {
            ['Editor'] = {
                ['Icon'] = 'animobject.bmp';
                ['IconOnTop'] = 1;
                ['ShowBounds'] = 1;
            };
            ['Event_Use'] = function (...) end;
            ['Event_User'] = function (...) end;
            ['FlowEvents'] = {
                ['Inputs'] = {
                    ['Use'] = {
                        [02] = 'entityid';
                        [01] = function (...) end;
                    };
                    ['User'] = {
                        [02] = 'entityid';
                        [01] = function (...) end;
                    };
                };
                ['Outputs'] = {
                    ['OnUse'] = 'bool';
                };
            };
            ['GetUsableMessage'] = function (...) end;
            ['IsUsable'] = function (...) end;
            ['IsUsableMsgChanged'] = function (...) end;
            ['LoadModel'] = function (...) end;
            ['OnPropertyChange'] = function (...) end;
            ['OnReset'] = function (...) end;
            ['OnSpawn'] = function (...) end;
            ['OnUsed'] = function (...) end;
            ['PhysicalizeThis'] = function (...) end;
            ['Properties'] = {
                ['Physics'] = {
                    ['Density'] = -1;
                    ['Mass'] = -1;
                    ['bPhysicalize'] = true;
                    ['bPushableByPlayers'] = false;
                    ['bRigidBody'] = true;
                };
                ['object_Model'] = '';
                ['soclasses_SmartObjectClass'] = '';
            };
            ['Reset'] = function (...) end;
            ['ResetChild'] = function (...) end;
            ['SetupTrigger'] = function (...) end;
            ['bUseTrigger'] = false;
            ['bUseableMsgChanged'] = 0;
            ['fMinUseDistance'] = 0.7;
            ['fUseAngle'] = 0.7;
            ['nUserId'] = 0;
        };
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    Dog = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['dashPossibleCheckDistance'] = 12;
            ['dashPossibleCheckRequiredSpeedParam'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_dog_controllerdefs.xml';
        ['ActorCanTalk'] = function (...) end;
        ['AddAnimalLootAction'] = function (...) end;
        ['AddLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_dog_database.adb';
        ['CombatOpponentMnTag'] = 'oppDog';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetCanTalkHintType'] = function (...) end;
        ['GetChatActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnBonding'] = function (...) end;
        ['OnChat'] = function (...) end;
        ['OnChatOpen'] = function (...) end;
        ['OnChatRequestAccepted'] = function (...) end;
        ['OnChatWithFocus'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnFollow'] = function (...) end;
        ['OnGrabCorpse'] = function (...) end;
        ['OnHorsePullDown'] = function (...) end;
        ['OnKnockout'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMercyKill'] = function (...) end;
        ['OnPickpocketing'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStealthKill'] = function (...) end;
        ['OnTalk'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OpponentMnTag'] = 'relatedDog';
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 1;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 1;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Dog';
                ['footstepEffect'] = 'footsteps_Dog';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
                ['esDefaultBehavior'] = 'none';
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_CreateSituationSubsystem'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'dog';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/Dog/dog.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.55;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.05;
                ['z'] = 0.52;
            };
            ['posCarcass'] = {
                ['x'] = 0.1;
                ['y'] = 0.16;
                ['z'] = 0.08;
            };
            ['radius'] = 0.13;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Dog';
        ['defaultSoulClass'] = 'dog';
        ['gameParams'] = {
            ['animatedCharacterTurnSpeedSmoothingTime'] = 0.2;
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['lookFOV'] = 180;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 30;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 25;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 25;
            ['stiffness_scale'] = 73;
        };
    };
    DogMarkingSpot = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
            ['IconOnTop'] = 1;
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = false;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = '99b89107-acd5-4d85-8930-7dd1f5f8c864';
            ['object_editorModel'] = 'objects/helpers/dog/dog_marking.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = 'dogMarkPoint';
        };
    };
    DummyTarget = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Combat'] = {
                    ['Run'] = {
                        [01] = 2.5;
                        [02] = 2.3;
                        [03] = 6;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [03] = 6.5;
                        [02] = 2.3;
                        [01] = 6.5;
                    };
                    ['Walk'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 0.8;
                    };
                };
                ['Cover'] = {
                    ['Run'] = {
                        [02] = 7;
                        [01] = 7;
                        [03] = 7;
                    };
                    ['Slow'] = {
                        [01] = 1;
                        [02] = 1;
                        [03] = 1;
                    };
                    ['Sprint'] = {
                        [02] = 7;
                        [01] = 7;
                        [03] = 7;
                    };
                    ['Walk'] = {
                        [02] = 1.9;
                        [03] = 1.9;
                        [01] = 1.9;
                    };
                };
                ['Crouch'] = {
                    ['Run'] = {
                        [02] = 2.7;
                        [03] = 5.5;
                        [01] = 3.5;
                    };
                    ['Slow'] = {
                        [02] = 0.3;
                        [03] = 1.3;
                        [01] = 0.5;
                    };
                    ['Walk'] = {
                        [01] = 0.9;
                        [02] = 0.3;
                        [03] = 1.3;
                    };
                };
                ['Prone'] = {
                    ['Run'] = {
                        [03] = 0.5;
                        [02] = 0.4;
                        [01] = 0.5;
                    };
                    ['Slow'] = {
                        [03] = 0.5;
                        [02] = 0.4;
                        [01] = 0.4;
                    };
                    ['Walk'] = {
                        [03] = 0.5;
                        [02] = 0.4;
                        [01] = 0.5;
                    };
                };
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 7.2;
                        [02] = 2;
                        [01] = 4.5;
                    };
                    ['Slow'] = {
                        [03] = 1.9;
                        [01] = 1;
                        [02] = 1;
                    };
                    ['Walk'] = {
                        [03] = 1.9;
                        [01] = 1.3;
                        [02] = 1;
                    };
                };
                ['Stealth'] = {
                    ['Run'] = {
                        [02] = 2.7;
                        [03] = 5.5;
                        [01] = 3.5;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [02] = 0.7;
                        [03] = 1;
                    };
                    ['Walk'] = {
                        [01] = 0.9;
                        [02] = 0.7;
                        [03] = 1;
                    };
                };
                ['Swim'] = {
                    ['Run'] = {
                        [03] = 4.3;
                        [01] = 3;
                        [02] = 2.9;
                    };
                    ['Slow'] = {
                        [02] = 0.6;
                        [01] = 0.5;
                        [03] = 0.7;
                    };
                    ['Walk'] = {
                        [02] = 0.6;
                        [01] = 0.6;
                        [03] = 0.7;
                    };
                };
            };
            ['aimTurnSpeed'] = -1;
            ['allowEntityClampingByAnimation'] = 1;
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['directionalScaleRefSpeedMax'] = 8;
            ['directionalScaleRefSpeedMin'] = 1;
            ['fireTurnSpeed'] = -1;
            ['lightAffectsSpeed'] = 1;
            ['lookCombatTurnSpeed'] = 50;
            ['lookIdleTurnSpeed'] = 30;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 3;
            ['maxDecel'] = 8;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_DEFAULT';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 2;
        };
        ['AI_changeCoverInterval'] = 7;
        ['AI_changeCoverLastTime'] = 0;
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_male_controllerdefs.xml';
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_male_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_npc';
                ['footstepEffect'] = 'footsteps_npc';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['commrange'] = 30;
            ['distanceToHideFrom'] = 3;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = 'CombatDummy';
            ['esClothingConfig'] = 'male2';
            ['esCommConfig'] = 'npc_default';
            ['esFaction'] = 'grunts';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['preferredCombatDistance'] = 20;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['voiceType'] = 'enemy';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['colliderEnergyScale'] = 10;
        ['colliderRagdollScale'] = 150;
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    Dump = {
        ['Dump'] = function (...) end;
        ['FormatTerminal'] = function (...) end;
        ['ListKeys'] = function (...) end;
        ['Print'] = function (...) end;
    };
    Entity = {
        ['Activate'] = function (...) end;
        ['ActivateOutput'] = function (...) end;
        ['ActivatePlayerPhysics'] = function (...) end;
        ['AddConstraint'] = function (...) end;
        ['AddImpulse'] = function (...) end;
        ['AttachChild'] = function (...) end;
        ['AttachSurfaceEffect'] = function (...) end;
        ['AuxAudioProxiesMoveWithEntity'] = function (...) end;
        ['AwakeCharacterPhysics'] = function (...) end;
        ['AwakeEnvironment'] = function (...) end;
        ['AwakePhysics'] = function (...) end;
        ['BreakToPieces'] = function (...) end;
        ['CalcWorldAnglesFromRelativeDir'] = function (...) end;
        ['CancelSubpipe'] = function (...) end;
        ['ChangeAttachmentMaterial'] = function (...) end;
        ['CharacterUpdateAlways'] = function (...) end;
        ['CharacterUpdateOnRender'] = function (...) end;
        ['CheckCollisions'] = function (...) end;
        ['CheckShaderParamCallbacks'] = function (...) end;
        ['CloneMaterial'] = function (...) end;
        ['CopySlotTM'] = function (...) end;
        ['CountLinks'] = function (...) end;
        ['CreateAuxAudioProxy'] = function (...) end;
        ['CreateBBoxProxy'] = function (...) end;
        ['CreateBoneAttachment'] = function (...) end;
        ['CreateCameraProxy'] = function (...) end;
        ['CreateDRSProxy'] = function (...) end;
        ['CreateLink'] = function (...) end;
        ['CreateRenderProxy'] = function (...) end;
        ['CreateSkinAttachment'] = function (...) end;
        ['Damage'] = function (...) end;
        ['DeactivateParticleEmitter'] = function (...) end;
        ['DeleteParticleEmitter'] = function (...) end;
        ['DeleteThis'] = function (...) end;
        ['DestroyAttachment'] = function (...) end;
        ['DestroyBBoxProxy'] = function (...) end;
        ['DestroyPhysics'] = function (...) end;
        ['DetachAll'] = function (...) end;
        ['DetachThis'] = function (...) end;
        ['DisableAnimationEvent'] = function (...) end;
        ['DrawSlot'] = function (...) end;
        ['EnableBoneAnimation'] = function (...) end;
        ['EnableBoneAnimationAll'] = function (...) end;
        ['EnableInheritXForm'] = function (...) end;
        ['EnableMaterialLayer'] = function (...) end;
        ['EnablePhysics'] = function (...) end;
        ['EnableProceduralFacialAnimation'] = function (...) end;
        ['ExecuteAudioTrigger'] = function (...) end;
        ['FadeGlobalDensity'] = function (...) end;
        ['ForceCharacterUpdate'] = function (...) end;
        ['ForwardTriggerEventsTo'] = function (...) end;
        ['FreeAllSlots'] = function (...) end;
        ['FreeSlot'] = function (...) end;
        ['GetAIName'] = function (...) end;
        ['GetAllAuxAudioProxiesID'] = function (...) end;
        ['GetAngles'] = function (...) end;
        ['GetAnimationLength'] = function (...) end;
        ['GetAnimationSpeed'] = function (...) end;
        ['GetAnimationTime'] = function (...) end;
        ['GetArchetype'] = function (...) end;
        ['GetAttachmentBone'] = function (...) end;
        ['GetAttachmentCGF'] = function (...) end;
        ['GetBBoxProxyBBox'] = function (...) end;
        ['GetBoneAngularVelocity'] = function (...) end;
        ['GetBoneDir'] = function (...) end;
        ['GetBoneLocal'] = function (...) end;
        ['GetBoneNameFromTable'] = function (...) end;
        ['GetBonePos'] = function (...) end;
        ['GetBoneVelocity'] = function (...) end;
        ['GetCenterOfMassPos'] = function (...) end;
        ['GetCharacter'] = function (...) end;
        ['GetChild'] = function (...) end;
        ['GetChildCount'] = function (...) end;
        ['GetCurAnimation'] = function (...) end;
        ['GetDefaultAuxAudioProxyID'] = function (...) end;
        ['GetDirectionVector'] = function (...) end;
        ['GetDistance'] = function (...) end;
        ['GetEntityMaterial'] = function (...) end;
        ['GetExplosionImpulse'] = function (...) end;
        ['GetExplosionObstruction'] = function (...) end;
        ['GetFlags'] = function (...) end;
        ['GetFlagsExtended'] = function (...) end;
        ['GetGUID'] = function (...) end;
        ['GetGeomCachePrecachedTime'] = function (...) end;
        ['GetGravity'] = function (...) end;
        ['GetHelperAngles'] = function (...) end;
        ['GetHelperDir'] = function (...) end;
        ['GetHelperPos'] = function (...) end;
        ['GetLink'] = function (...) end;
        ['GetLinkName'] = function (...) end;
        ['GetLinkTarget'] = function (...) end;
        ['GetLocalAngles'] = function (...) end;
        ['GetLocalBBox'] = function (...) end;
        ['GetLocalPos'] = function (...) end;
        ['GetLocalScale'] = function (...) end;
        ['GetLodRatio'] = function (...) end;
        ['GetMass'] = function (...) end;
        ['GetMaterial'] = function (...) end;
        ['GetMaterialFloat'] = function (...) end;
        ['GetMaterialVec3'] = function (...) end;
        ['GetName'] = function (...) end;
        ['GetParent'] = function (...) end;
        ['GetParentSlot'] = function (...) end;
        ['GetPhysicalStats'] = function (...) end;
        ['GetPos'] = function (...) end;
        ['GetProjectedWorldBBox'] = function (...) end;
        ['GetRawId'] = function (...) end;
        ['GetScale'] = function (...) end;
        ['GetSlotAngles'] = function (...) end;
        ['GetSlotCount'] = function (...) end;
        ['GetSlotHelperPos'] = function (...) end;
        ['GetSlotPos'] = function (...) end;
        ['GetSlotScale'] = function (...) end;
        ['GetSlotWorldDir'] = function (...) end;
        ['GetSlotWorldPos'] = function (...) end;
        ['GetSpeed'] = function (...) end;
        ['GetState'] = function (...) end;
        ['GetSubmergedVolume'] = function (...) end;
        ['GetTimeOfDayHour'] = function (...) end;
        ['GetTimeSinceLastSeen'] = function (...) end;
        ['GetTouchedPoint'] = function (...) end;
        ['GetTouchedSurfaceID'] = function (...) end;
        ['GetTriggerBBox'] = function (...) end;
        ['GetUpdateRadius'] = function (...) end;
        ['GetVelocity'] = function (...) end;
        ['GetVelocityEx'] = function (...) end;
        ['GetViewDistRatio'] = function (...) end;
        ['GetVolume'] = function (...) end;
        ['GetWorldAngles'] = function (...) end;
        ['GetWorldBBox'] = function (...) end;
        ['GetWorldBoundsCenter'] = function (...) end;
        ['GetWorldDir'] = function (...) end;
        ['GetWorldPos'] = function (...) end;
        ['GetWorldScale'] = function (...) end;
        ['GotoState'] = function (...) end;
        ['HasFlags'] = function (...) end;
        ['HasFlagsExtended'] = function (...) end;
        ['Hide'] = function (...) end;
        ['HideAllAttachments'] = function (...) end;
        ['HideAttachment'] = function (...) end;
        ['HideAttachmentMaster'] = function (...) end;
        ['IgnorePhysicsUpdatesOnSlot'] = function (...) end;
        ['InsertSubpipe'] = function (...) end;
        ['IntersectRay'] = function (...) end;
        ['InvalidateLocalBBox'] = function (...) end;
        ['InvalidateTrigger'] = function (...) end;
        ['IsActive'] = function (...) end;
        ['IsAnimationRunning'] = function (...) end;
        ['IsColliding'] = function (...) end;
        ['IsEntityInside'] = function (...) end;
        ['IsEntityInsideArea'] = function (...) end;
        ['IsFromPool'] = function (...) end;
        ['IsGarbage'] = function (...) end;
        ['IsGeomCacheStreaming'] = function (...) end;
        ['IsHidden'] = function (...) end;
        ['IsInState'] = function (...) end;
        ['IsPerInstanceStreamable'] = function (...) end;
        ['IsPointInsideArea'] = function (...) end;
        ['IsSlotCharacter'] = function (...) end;
        ['IsSlotGeometry'] = function (...) end;
        ['IsSlotLight'] = function (...) end;
        ['IsSlotParticleEmitter'] = function (...) end;
        ['IsSlotValid'] = function (...) end;
        ['IsUsingPipe'] = function (...) end;
        ['KillTimer'] = function (...) end;
        ['LoadCharacter'] = function (...) end;
        ['LoadCloud'] = function (...) end;
        ['LoadFogVolume'] = function (...) end;
        ['LoadGeomCache'] = function (...) end;
        ['LoadLight'] = function (...) end;
        ['LoadObject'] = function (...) end;
        ['LoadObjectLattice'] = function (...) end;
        ['LoadObjectWithFlags'] = function (...) end;
        ['LoadParticleEffect'] = function (...) end;
        ['LoadPrismObject'] = function (...) end;
        ['LoadSubObject'] = function (...) end;
        ['LoadVolumeObject'] = function (...) end;
        ['MaterialFlashInvoke'] = function (...) end;
        ['MultiplyWithSlotTM'] = function (...) end;
        ['NetPresent'] = function (...) end;
        ['NoBulletForce'] = function (...) end;
        ['NoExplosionCollision'] = function (...) end;
        ['PassParamsToPipe'] = function (...) end;
        ['Physicalize'] = function (...) end;
        ['PhysicalizeAttachment'] = function (...) end;
        ['PhysicalizeSlot'] = function (...) end;
        ['PlayFacialAnimation'] = function (...) end;
        ['PreLoadParticleEffect'] = function (...) end;
        ['ProcessBroadcastEvent'] = function (...) end;
        ['RagDollize'] = function (...) end;
        ['ReattachSoftEntityVtx'] = function (...) end;
        ['RedirectAnimationToLayer0'] = function (...) end;
        ['RegisterForAreaEvents'] = function (...) end;
        ['RemoveAllLinks'] = function (...) end;
        ['RemoveAuxAudioProxy'] = function (...) end;
        ['RemoveDecals'] = function (...) end;
        ['RemoveLink'] = function (...) end;
        ['RenderAlways'] = function (...) end;
        ['RenderShadow'] = function (...) end;
        ['ReplaceMaterial'] = function (...) end;
        ['ResetAnimation'] = function (...) end;
        ['ResetAttachment'] = function (...) end;
        ['ResetMaterial'] = function (...) end;
        ['ResetPhysics'] = function (...) end;
        ['SelectPipe'] = function (...) end;
        ['SetAIName'] = function (...) end;
        ['SetAngles'] = function (...) end;
        ['SetAnimateOffScreenShadow'] = function (...) end;
        ['SetAnimationBlendOut'] = function (...) end;
        ['SetAnimationDrivenMotion'] = function (...) end;
        ['SetAnimationEvent'] = function (...) end;
        ['SetAnimationFlip'] = function (...) end;
        ['SetAnimationKeyEvent'] = function (...) end;
        ['SetAnimationSpeed'] = function (...) end;
        ['SetAnimationTime'] = function (...) end;
        ['SetAttachmentAngles'] = function (...) end;
        ['SetAttachmentCGF'] = function (...) end;
        ['SetAttachmentDir'] = function (...) end;
        ['SetAttachmentEffect'] = function (...) end;
        ['SetAttachmentLight'] = function (...) end;
        ['SetAttachmentObject'] = function (...) end;
        ['SetAttachmentPos'] = function (...) end;
        ['SetAudioEnvironmentID'] = function (...) end;
        ['SetAudioObstructionCalcType'] = function (...) end;
        ['SetAudioProxyOffset'] = function (...) end;
        ['SetAudioRtpcValue'] = function (...) end;
        ['SetAudioSwitchState'] = function (...) end;
        ['SetBBoxProxyBBox'] = function (...) end;
        ['SetCharacterPhysicParams'] = function (...) end;
        ['SetCloudMovementProperties'] = function (...) end;
        ['SetColliderMode'] = function (...) end;
        ['SetCurrentAudioEnvironments'] = function (...) end;
        ['SetDefaultIdleAnimations'] = function (...) end;
        ['SetDirectionVector'] = function (...) end;
        ['SetEnvironmentFadeDistance'] = function (...) end;
        ['SetFadeDistance'] = function (...) end;
        ['SetFlags'] = function (...) end;
        ['SetFlagsExtended'] = function (...) end;
        ['SetGeomCacheDrawing'] = function (...) end;
        ['SetGeomCacheParams'] = function (...) end;
        ['SetGeomCachePlaybackTime'] = function (...) end;
        ['SetGeomCacheStreaming'] = function (...) end;
        ['SetLightColorParams'] = function (...) end;
        ['SetLinkTarget'] = function (...) end;
        ['SetLocalAngles'] = function (...) end;
        ['SetLocalBBox'] = function (...) end;
        ['SetLocalPos'] = function (...) end;
        ['SetLocalScale'] = function (...) end;
        ['SetLodRatio'] = function (...) end;
        ['SetMaterial'] = function (...) end;
        ['SetMaterialFloat'] = function (...) end;
        ['SetMaterialVec3'] = function (...) end;
        ['SetName'] = function (...) end;
        ['SetParentSlot'] = function (...) end;
        ['SetPhysicParams'] = function (...) end;
        ['SetPos'] = function (...) end;
        ['SetPublicParam'] = function (...) end;
        ['SetRegisterInSectors'] = function (...) end;
        ['SetScale'] = function (...) end;
        ['SetScriptUpdateRate'] = function (...) end;
        ['SetSelfAsLightCasterException'] = function (...) end;
        ['SetSlotAngles'] = function (...) end;
        ['SetSlotHud3D'] = function (...) end;
        ['SetSlotPos'] = function (...) end;
        ['SetSlotPosAndDir'] = function (...) end;
        ['SetSlotScale'] = function (...) end;
        ['SetSlotScaleAsymmetric'] = function (...) end;
        ['SetSlotWorldTM'] = function (...) end;
        ['SetStateClientside'] = function (...) end;
        ['SetTimer'] = function (...) end;
        ['SetTriggerBBox'] = function (...) end;
        ['SetUpdatePolicy'] = function (...) end;
        ['SetUpdateRadius'] = function (...) end;
        ['SetVelocity'] = function (...) end;
        ['SetVelocityEx'] = function (...) end;
        ['SetViewDistRatio'] = function (...) end;
        ['SetViewDistUnlimited'] = function (...) end;
        ['SetVolumeObjectMovementProperties'] = function (...) end;
        ['SetWorldAngles'] = function (...) end;
        ['SetWorldPos'] = function (...) end;
        ['SetWorldScale'] = function (...) end;
        ['StartAnimation'] = function (...) end;
        ['StopAnimation'] = function (...) end;
        ['StopAudioTrigger'] = function (...) end;
        ['ToGlobal'] = function (...) end;
        ['ToLocal'] = function (...) end;
        ['TriggerEvent'] = function (...) end;
        ['UnSeenFrames'] = function (...) end;
        ['UpdateAreas'] = function (...) end;
        ['UpdateLightClipBounds'] = function (...) end;
        ['UpdateSlotPhysics'] = function (...) end;
        ['VectorToGlobal'] = function (...) end;
        ['VectorToLocal'] = function (...) end;
    };
    EntityCommon = {
        ['AddHeavyObjectProperty'] = function (...) end;
        ['AddInteractLargeObjectProperty'] = function (...) end;
        ['ApplyCollisionFiltering'] = function (...) end;
        ['BroadcastEvent'] = function (...) end;
        ['CompareEntitiesByName'] = function (...) end;
        ['Derive'] = function (...) end;
        ['DeriveOverride'] = function (...) end;
        ['GetCollisionFiltering'] = function (...) end;
        ['MakeAICoverEntity'] = function (...) end;
        ['MakeCompareEntitiesByDistanceFromPoint'] = function (...) end;
        ['MakeKillable'] = function (...) end;
        ['MakePickable'] = function (...) end;
        ['MakeRenderProxyOptions'] = function (...) end;
        ['MakeSpawnable'] = function (...) end;
        ['MakeTargetableByAI'] = function (...) end;
        ['MakeThrownObjectTargetable'] = function (...) end;
        ['MakeUninteractableFromScript'] = function (...) end;
        ['MakeUsable'] = function (...) end;
        ['OnEntityBookmarkCreated'] = function (...) end;
        ['PhysicalizeRigid'] = function (...) end;
        ['SetupCollisionFiltering'] = function (...) end;
        ['TempPhysParams'] = {
            ['density'] = 0;
            ['mass'] = 0;
        };
        ['TempPhysicsFlags'] = {
            ['flags'] = 0;
            ['flags_mask'] = 0;
        };
        ['TempSimulationParams'] = {
            ['max_time_step'] = 0.02;
        };
    };
    EntityNamed = function (...) end;
    EntityUtils = {
        ['DumpEntities'] = function (...) end;
        ['EntityNamed'] = function (...) end;
        ['GetEntityCategory'] = function (...) end;
        ['GetMiscProperty'] = function (...) end;
        ['GetName'] = function (...) end;
        ['GetScriptProperty'] = function (...) end;
        ['GetScriptSoulData'] = function (...) end;
        ['IsAnimal'] = function (...) end;
        ['IsFemale'] = function (...) end;
        ['Teleport'] = function (...) end;
    };
    Enum = {
        ['FromIndex'] = function (...) end;
        ['FromStr'] = function (...) end;
        ['ListValues'] = function (...) end;
        ['__index'] = function (...) end;
        ['new'] = function (...) end;
    };
    EnumValue = {
        ['ToIndex'] = function (...) end;
        ['ToStr'] = function (...) end;
        ['__le'] = function (...) end;
        ['__lt'] = function (...) end;
    };
    EnvironmentLight = {
        ['ActivateLight'] = function (...) end;
        ['CacheResources'] = function (...) end;
        ['Editor'] = {
            ['AbsoluteRadius'] = 1;
            ['ShowBounds'] = 0;
        };
        ['Event_Active'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Active'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Active'] = 'bool';
            };
        };
        ['LoadLightToSlot'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyAnimated'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['BoxSizeX'] = 10;
            ['BoxSizeY'] = 10;
            ['BoxSizeZ'] = 10;
            ['Color'] = {
                ['clrDiffuse'] = {
                    ['x'] = 1;
                    ['y'] = 1;
                    ['z'] = 1;
                };
                ['fDiffuseMultiplier'] = 1;
                ['fGIMultiplier'] = 1;
                ['fSpecularMultiplier'] = 1;
                ['fToDMulWeight'] = 1;
                ['fVolumetricMultiplier'] = 1;
            };
            ['GenOffsetX'] = 0;
            ['GenOffsetY'] = 0;
            ['GenOffsetZ'] = 0;
            ['Options'] = {
                ['SortPriority'] = 0;
                ['_texture_deferred_cubemap'] = '';
                ['bAffectsThisAreaOnly'] = false;
                ['bAffectsVolumetricFogOnly'] = false;
                ['bDeferredClipBounds'] = false;
                ['bIgnoresVisAreas'] = false;
                ['bVolumetricFog'] = true;
                ['fAttenuationFalloffMax'] = 0.3;
                ['fGiBiasMultiplier'] = 1;
            };
            ['OptionsAdvanced'] = {
                ['bDynamic'] = true;
                ['texture_deferred_cubemap'] = '';
            };
            ['Projection'] = {
                ['bBoxProject'] = false;
                ['fBoxHeight'] = 10;
                ['fBoxLength'] = 10;
                ['fBoxWidth'] = 10;
            };
            ['bActive'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
        };
    };
    EquipWeapon = function (...) end;
    Explosion = {
        ['Editor'] = {
            ['Icon'] = 'explosion.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['Event_Explode'] = function (...) end;
        ['Explode'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Explode'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Deactivate'] = 'bool';
                ['Explode'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['Properties'] = {
            ['Explosion'] = {
                ['Damage'] = 1000;
                ['Direction'] = {
                    ['x'] = 0;
                    ['y'] = 0;
                    ['z'] = 1;
                };
                ['EffectScale'] = 1;
                ['MinPhysRadius'] = 2.5;
                ['MinRadius'] = 5;
                ['ParticleEffect'] = 'explosions.grenade_air.explosion';
                ['PhysRadius'] = 5;
                ['Pressure'] = 1000;
                ['Radius'] = 10;
            };
            ['bActive'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['soclasses_SmartObjectClass'] = '';
        };
    };
    FastTravel = {
        ['Stop'] = function (...) end;
    };
    FastTravelCutsceneData = {
        ['Editor'] = {
            ['Icon'] = 'sequence.bmp';
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esDisableRandomEvents'] = 'All';
            ['esFastTravelIcon'] = 'Player';
        };
    };
    FieldMouse = {
        ['Animations'] = {
            [01] = 'rat_run';
            [03] = 'rat_idle_var01';
            [02] = 'rat_idle';
            [07] = '';
            [08] = 'rat_run_jump';
            [04] = 'rat_idle_var02';
            [06] = 'throw';
            [05] = 'pickup';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['GetFlockType'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '18ff9093-2cc4-4ab3-9f34-7cb0dd7cd30a';
                ['nCount'] = 3;
                ['object_Model'] = 'Objects/characters/animals/rat/rat.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 10;
                ['AttractDistMin'] = 0.1;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 0.5;
                ['FactorSeparation'] = 3;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = true;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 50000;
                ['FactorHeight'] = 10;
                ['FactorOrigin'] = 15;
                ['HeightMax'] = 0;
                ['HeightMin'] = 0;
                ['IgnoreTerrainElevation'] = false;
                ['IgnoreWallsBehindPlayer'] = false;
                ['MaxAnimSpeed'] = 1;
                ['MaxDistFromOrigin'] = 50;
                ['RandomMovement'] = 1;
                ['RunAnimationSpeed'] = 2.5;
                ['RunThreshold'] = 2.2;
                ['SpeedMax'] = 1.8;
                ['SpeedMin'] = 1.5;
                ['SpeedScared'] = 2.7;
                ['WalkAnimationSpeed'] = 2;
            };
            ['Options'] = {
                ['PickableMessage'] = '';
                ['Radius'] = 20;
                ['VisibilityDist'] = 80;
                ['bActivate'] = true;
                ['bAvoidWater'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = true;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['Sounds'] = {
            [02] = 'b_rat_scared';
            [01] = 'b_rat_idle';
            [03] = '';
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Boids';
    };
    FireplaceSmartObject = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEatItemClassId'] = function (...) end;
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Fireplace'] = {
                ['bFullOnInit'] = true;
                ['esFireplaceCauldronType'] = 'goulash';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['cauldronType'] = 'goulash';
    };
    Fish = {
        ['Animations'] = {
            [01] = 'fish_anim';
        };
        ['BubblesEffect'] = '';
        ['CacheResources'] = function (...) end;
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Fish.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Deactivate'] = 'bool';
            };
        };
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnSpawnBubble'] = function (...) end;
        ['OnSpawnSplash'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '06be2a3d-4e05-4a78-85cd-33879cd669c9';
                ['nCount'] = 5;
                ['object_Model'] = 'objects/characters/animals/fish/salmo_trutta.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 20;
                ['AttractDistMin'] = 5;
                ['FactorAlign'] = 0;
                ['FactorCohesion'] = 1;
                ['FactorSeparation'] = 10;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = false;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 10;
                ['FactorHeight'] = 1;
                ['FactorOrigin'] = 0.2;
                ['FactorRandomAcceleration'] = 2;
                ['HeightMax'] = 20;
                ['HeightMin'] = 1;
                ['MaxAnimSpeed'] = 1.7;
                ['SpeedMax'] = 0.9;
                ['SpeedMin'] = 0.3;
                ['SpeedScared'] = 10;
            };
            ['Options'] = {
                ['Radius'] = 5;
                ['VisibilityDist'] = 15;
                ['bActivate'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = false;
                ['bPickableWhenAlive'] = false;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['SplashEffect'] = '';
        ['bubble_dir'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 1;
        };
        ['bubble_pos'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Fish';
    };
    Flash = {
        ['Editor'] = {
            ['Icon'] = 'Flash.bmp';
        };
        ['Event_Stop'] = function (...) end;
        ['Event_Strike'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Stop'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Strike'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Stop'] = 'bool';
                ['Strike'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['Effects'] = {
                ['SkyHighlightAtten'] = 10;
                ['SkyHighlightMultiplier'] = 1;
                ['color_SkyHighlightColor'] = {
                    ['x'] = 0.8;
                    ['y'] = 0.8;
                    ['z'] = 1;
                };
                ['sound_Sound'] = '';
            };
            ['Timing'] = {
                ['fFadeInTime'] = 0.1;
                ['fFadeOutTime'] = 0.1;
                ['fFlashDuration'] = 1;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['StopStrike'] = function (...) end;
        ['TempPos'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['UpdateFlashParams'] = function (...) end;
        ['_SkyHighlight'] = {
            ['color'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['position'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['size'] = 0;
        };
    };
    Fog = {
        ['CurFadeAmount'] = 0;
        ['Editor'] = {
            ['Icon'] = 'Fog.bmp';
        };
        ['LastTime'] = 0;
        ['OnEnterArea'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLeaveArea'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['AtmosphereHeightModifier'] = 0;
            ['FadeTime'] = 1;
            ['GlobalDensityModifier'] = 1;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['ResetValues'] = function (...) end;
        ['SetFog'] = function (...) end;
        ['type'] = 'FogController';
    };
    FogVolume = {
        ['CheckMove'] = function (...) end;
        ['CreateFogVolume'] = function (...) end;
        ['DeleteFogVolume'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'FogVolume.bmp';
            ['Model'] = 'Editor/Objects/invisiblebox.cgf';
            ['ShowBounds'] = 1;
        };
        ['Event_Enabled'] = function (...) end;
        ['Event_Fade'] = function (...) end;
        ['Event_FadeTime'] = function (...) end;
        ['Event_FadeValue'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_SetDensityNoiseOffset'] = function (...) end;
        ['Event_SetDensityNoiseScale'] = function (...) end;
        ['Event_SetGlobalDensity'] = function (...) end;
        ['Event_SetWindInfluence'] = function (...) end;
        ['Event_Show'] = function (...) end;
        ['Fader'] = {
            ['fadeTime'] = 0;
            ['fadeToValue'] = 0;
        };
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['AO_Enabled'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['EV_Density'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['EV_DensityNoiseOffset'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['EV_DensityNoiseScale'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['EV_WindInfluence'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Enabled'] = 'bool';
            };
        };
        ['InitFogVolumeProperties'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyAnimated'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DensityNoiseFrequency'] = {
                ['x'] = 10;
                ['y'] = 10;
                ['z'] = 10;
            };
            ['DensityNoiseOffset'] = 1;
            ['DensityNoiseScale'] = 1;
            ['DensityNoiseTimeFrequency'] = 0;
            ['DensityOffset'] = 0;
            ['EmissionIntensity'] = 0;
            ['FallOffDirLati'] = 90;
            ['FallOffDirLong'] = 0;
            ['FallOffScale'] = 1;
            ['FallOffShift'] = 0;
            ['GlobalDensity'] = 1;
            ['NearCutoff'] = 0;
            ['RampEnd'] = 50;
            ['RampInfluence'] = 0;
            ['RampStart'] = 0;
            ['Size'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
            ['SoftEdges'] = 1;
            ['WindInfluence'] = 1;
            ['bActive'] = true;
            ['bAffectsThisAreaOnly'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIgnoresVisAreas'] = false;
            ['bSaved_by_game'] = false;
            ['bUseGlobalFogColor'] = false;
            ['color_Color'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
            ['color_Emission'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
            ['eiVolumeType'] = 0;
            ['fHDRDynamic'] = 0;
        };
        ['type'] = 'FogVolume';
    };
    FoodProcessingTrigger = {
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '';
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['ShowFoodProcessingTutorials'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    Framework = {
        ['Expr'] = function (...) end;
        ['IsValidWUID'] = function (...) end;
        ['ScriptHandlerToString'] = function (...) end;
        ['WUIDToMsg'] = function (...) end;
        ['WUIDToString'] = function (...) end;
        ['WUIDToUI'] = function (...) end;
    };
    GameToken = {
        ['DumpAllTokens'] = function (...) end;
        ['GetToken'] = function (...) end;
        ['SetToken'] = function (...) end;
    };
    GameUtils = {
        ['ConvertGameGuidToLyrGuid'] = function (...) end;
        ['ConvertLyrGuidToGameGuid'] = function (...) end;
        ['DisableSave'] = function (...) end;
        ['EnableSave'] = function (...) end;
        ['GetLocalVar'] = function (...) end;
        ['HideHorseCutscene'] = function (...) end;
        ['SetLocalVar'] = function (...) end;
    };
    GeomCache = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Hide'] = function (...) end;
        ['Event_PrecacheTime'] = function (...) end;
        ['Event_SetTime'] = function (...) end;
        ['Event_Start'] = function (...) end;
        ['Event_StartDrawing'] = function (...) end;
        ['Event_StartStreaming'] = function (...) end;
        ['Event_Stop'] = function (...) end;
        ['Event_StopDrawing'] = function (...) end;
        ['Event_StopStreaming'] = function (...) end;
        ['Event_Unhide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['PrecacheTime'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['SetTime'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['Start'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['StartDrawing'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['StartStreaming'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['Stop'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['StopDrawing'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['StopStreaming'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['Unhide'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
            };
            ['Outputs'] = {
                ['Precached'] = 'bool';
            };
        };
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['bPhysicalize'] = false;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bLooping'] = false;
            ['bPlaying'] = false;
            ['bSaved_by_game'] = true;
            ['fStandInDistance'] = 0;
            ['fStartTime'] = 0;
            ['fStreamInDistance'] = 0;
            ['geomcacheFile'] = 'EngineAssets/GeomCaches/default.cax';
            ['materialFirstFrameStandInMaterial'] = '';
            ['materialLastFrameStandInMaterial'] = '';
            ['materialStandInMaterial'] = '';
            ['objectFirstFrameStandIn'] = '';
            ['objectLastFrameStandIn'] = '';
            ['objectStandIn'] = '';
        };
        ['SetFromProperties'] = function (...) end;
        ['bPlaying'] = false;
        ['bPrecachedOutputTriggered'] = false;
        ['currentTime'] = 0;
        ['precacheTime'] = 0;
    };
    GeomEntity = {
        ['Client'] = {
            ['OnInit'] = function (...) end;
            ['OnLevelLoaded'] = function (...) end;
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Dead'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Hit'] = function (...) end;
        ['Event_MakeInvulnerable'] = function (...) end;
        ['Event_MakeVulnerable'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_ResetHealth'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['MakeInvulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['MakeVulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ResetHealth'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Break'] = 'int';
                ['Dead'] = 'bool';
                ['Health'] = 'float';
                ['Hide'] = 'bool';
                ['Hit'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['GetHealthRatio'] = function (...) end;
        ['GetMaxHealth'] = function (...) end;
        ['IsDead'] = function (...) end;
        ['IsInvulnerable'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Health'] = {
                ['MaxHealth'] = 500;
                ['bInvulnerable'] = false;
                ['bOnlyEnemyFire'] = true;
            };
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['RenderProxyOptions'] = {
                ['bAnimateOffScreenShadow'] = false;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bAlwaysLoaded'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = false;
            ['bUpdateOnlyByScript'] = false;
            ['esFaction'] = '';
            ['guidSmartObjectType'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['RegisterWithAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['Server'] = {
            ['OnHit'] = function (...) end;
            ['OnInit'] = function (...) end;
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetInvulnerability'] = function (...) end;
        ['SetRenderProxyOptions'] = function (...) end;
        ['SetupHealthProperties'] = function (...) end;
    };
    GhostDummy = {
        ['Client'] = {
            ['OnPhysicsBreak'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Hide'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 1;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = true;
                ['bRigidBody'] = true;
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = false;
            ['bExported_to_test'] = false;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bMissionCritical'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
            ['object_Model'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['SetFromProperties'] = function (...) end;
        ['SetupModel'] = function (...) end;
        ['UpdateGhost'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
    };
    GhostsController = {
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
    };
    Grindstone = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['fSpeedMultiplier'] = 1;
            ['guidSmartObjectType'] = '';
            ['nDifficulty'] = 1;
            ['object_Model'] = 'objects/characters/assets/grindstone/grindstone.cdf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    Hare = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/wh_hare_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/wh_hare_database.adb';
        ['CombatOpponentMnTag'] = 'oppHare';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OpponentMnTag'] = 'relatedHare';
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Hare';
                ['footstepEffect'] = 'footsteps_Hare';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'hare';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/hare/hare.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.25;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0.2;
            };
            ['posCarcass'] = {
                ['x'] = 0;
                ['y'] = 0.12;
                ['z'] = 0.05;
            };
            ['radius'] = 0.1;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Hare';
        ['defaultSoulClass'] = 'hare';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.5;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.625;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 1.5;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 1.5;
            ['stiffness_scale'] = 73;
        };
    };
    Hazard = {
        ['AddScreenEffect'] = function (...) end;
        ['Client'] = {
            ['Activated'] = {
                ['OnTimer'] = function (...) end;
            };
            ['AddScreenEffect'] = function (...) end;
            ['Deactivated'] = {
                ['OnTimer'] = function (...) end;
            };
            ['DoFX'] = function (...) end;
            ['InitFX'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['RemoveScreenEffect'] = function (...) end;
        };
        ['DoFX'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'hazard.bmp';
            ['Model'] = 'Editor/Objects/T.cgf';
            ['ShowBounds'] = 1;
        };
        ['Event_Activated'] = function (...) end;
        ['Event_Deactivated'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activated'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Deactivated'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activated'] = 'bool';
                ['Deactivated'] = 'bool';
                ['Enter'] = 'bool';
                ['Leave'] = 'bool';
            };
        };
        ['HandleEntities'] = function (...) end;
        ['HandleEntity'] = function (...) end;
        ['InitFX'] = function (...) end;
        ['IsEntityAlreadyInTable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['Properties'] = {
            ['Damage'] = {
                ['bOnlyPlayer'] = 1;
                ['eiHazardType'] = 0;
                ['fDamage'] = 50;
            };
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['RemoveScreenEffect'] = function (...) end;
        ['Server'] = {
            ['Activated'] = {
                ['OnBeginState'] = function (...) end;
                ['OnEndState'] = function (...) end;
                ['OnEnterArea'] = function (...) end;
                ['OnLeaveArea'] = function (...) end;
                ['OnTimer'] = function (...) end;
            };
            ['Deactivated'] = {
                ['OnBeginState'] = function (...) end;
                ['OnEnterArea'] = function (...) end;
                ['OnLeaveArea'] = function (...) end;
            };
            ['OnInit'] = function (...) end;
        };
        ['States'] = {
            [02] = 'Deactivated';
            [03] = 'Turning';
            [01] = 'Activated';
        };
        ['__client_dispatch'] = {
            [03] = 'RemoveScreenEffect:E';
            [01] = 'DoFX:';
            [04] = 'InitFX:';
            [02] = 'AddScreenEffect:E';
            ['AddScreenEffect'] = function (...) end;
            ['DoFX'] = function (...) end;
            ['InitFX'] = function (...) end;
            ['RemoveScreenEffect'] = function (...) end;
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            ['__validated'] = false;
        };
        ['type'] = 'Trigger';
    };
    Hen = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_hen_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_hen_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Hare';
                ['footstepEffect'] = 'footsteps_Hare';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = false;
            ['bWH_PerceptibleObject'] = false;
            ['bWH_PerceptorObject'] = false;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/hen/hen_brown_light.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.07;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0.25;
            };
            ['radius'] = 0.15;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Hen';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.5;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.625;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 0.7;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 0.7;
            ['stiffness_scale'] = 73;
        };
    };
    Hole = {
        ['ChangeModel'] = function (...) end;
        ['CreateHole'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['Script'] = {
                ['bLegalToDig'] = false;
            };
            ['bCanBeUsed'] = true;
            ['bCover'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bPreview'] = false;
            ['bSaved_by_game'] = true;
            ['bSendMessage'] = false;
            ['fUsabilityDistance'] = 5;
            ['guidSmartObjectType'] = '';
            ['nDiggingTime'] = 6.5;
            ['object_Model'] = 'objects/characters/assets/grave_pit/grave_pit.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetInteractive'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nDepth'] = 0;
        ['nUserId'] = 0;
    };
    HoleDigging = {
        ['CheckPlayerAboveHole'] = function (...) end;
    };
    Horse = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [02] = 2;
                        [01] = 2.3;
                        [03] = 2.6;
                    };
                    ['Slow'] = {
                        [03] = 1.3;
                        [01] = 1.2;
                        [02] = 0.9;
                    };
                    ['Sprint'] = {
                        [02] = 6.5;
                        [01] = 6.8;
                        [03] = 7.1;
                    };
                    ['Walk'] = {
                        [01] = 1.7;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceAgentMinRadius'] = 0.8;
            ['collisionAvoidanceAgentRadius'] = 1.25;
            ['collisionAvoidanceObstacleOffest'] = {
                ['x'] = 0;
                ['y'] = 0.3;
                ['z'] = 0;
            };
            ['collisionAvoidanceObstacleRadius'] = 0.5;
            ['collisionAvoidanceObstacleTravel'] = 0.8;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 0.5;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_horse_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_horse_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetInspectableByPlayer'] = function (...) end;
        ['GetMountableByPlayer'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsMountLegal'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnBonding'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInspect'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMount'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStartle'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_horse';
                ['footstepEffect'] = 'footsteps_horse_mat';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bMountIsLegal'] = false;
            ['bNotPlayerInspectable'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'horse2';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/horse/horse.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['SetInspectableByPlayer'] = function (...) end;
        ['SetMountIsLegal'] = function (...) end;
        ['SetMountIsLegalFromAI'] = function (...) end;
        ['SetMountableByPlayer'] = function (...) end;
        ['SetMountableByPlayerDisabledFromAI'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['actorCombatDimension'] = {
            ['size'] = {
                ['x'] = 0.5;
                ['y'] = 1.3;
                ['z'] = 0;
            };
        };
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 1;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 1.15;
            };
            ['posCarcass'] = {
                ['x'] = 0.18;
                ['y'] = 0;
                ['z'] = 0.22;
            };
            ['radius'] = 0.32;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Horse';
        ['defaultSoulClass'] = 'horse';
        ['gameParams'] = {
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.3;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.2;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['inspectableByPlayer'] = true;
        ['maxMountDistance'] = 1.75;
        ['mountIsLegalFromAI'] = false;
        ['mountableByPlayer'] = true;
        ['mountableByPlayerDisabledFromAI'] = false;
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 30;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 480;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 90;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 480;
            ['neckMass'] = 1;
            ['stiffness_scale'] = 73;
        };
        ['simplifiedRootRotation'] = false;
    };

    ImpressByPlayer = function (...) end;
    IndulgenceBoxTrigger = {
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsPenanceMeaningful'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@kajicna_p_slozit_odpustek_VfYM';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    IngameCutsceneData = {
        ['Editor'] = {
            ['Icon'] = 'sequence.bmp';
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esGameProfile'] = '';
            ['esSequenceName'] = '';
        };
    };
    InteractionTrigger = {
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '';
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    InteractiveObjectEx = {
        ['AbortUse'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Reset'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Use'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['Event_UserId'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Reset'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Use'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UserId'] = {
                    [02] = 'entity';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Aborted'] = 'bool';
                ['Disabled'] = 'bool';
                ['Enabled'] = 'bool';
                ['Finished'] = 'bool';
                ['Hide'] = 'bool';
                ['Reset'] = 'bool';
                ['Started'] = 'bool';
                ['UnHide'] = 'bool';
                ['UsedBy'] = 'entity';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['Interaction'] = {
                ['Interaction'] = 'OpenElevatorDoor';
                ['InteractionAngle'] = 70;
                ['InteractionRadius'] = 1.5;
                ['bRemoveDecalsOnUse'] = 0;
                ['bStartInteractionOnExplosion'] = 0;
                ['object_Model'] = 'Objects/prototype/ElevatorDoors/AnimatedElevatorDoors.cga';
            };
            ['Physics'] = {
                ['bRigidBody'] = false;
            };
            ['UseMessage'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
        };
        ['ResetOnUsed'] = function (...) end;
        ['StopUse'] = function (...) end;
        ['type'] = 'InteractiveObjectEx';
        ['userId'] = 0000000000000000;
    };
    InventoryDummyDog = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 1e+06;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathLookAhead'] = 2;
            ['pathRadius'] = 0.3;
            ['pathRegenIntervalDuringTrace'] = -1;
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['walkSpeed'] = 2;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/inv_dog_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/inv_dog_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys';
                ['footstepEffect'] = 'footsteps';
            };
            ['ControlProfile'] = 2;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = true;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'dog';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'objects/characters/animals/dog/dog.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Dog';
        ['defaultSoulClass'] = 'dog';
        ['gameParams'] = {
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['enabled'] = 0;
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    InventoryDummyHorse = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [02] = 2;
                        [01] = 2.3;
                        [03] = 2.6;
                    };
                    ['Slow'] = {
                        [03] = 1.3;
                        [01] = 1.2;
                        [02] = 0.9;
                    };
                    ['Sprint'] = {
                        [02] = 6.5;
                        [01] = 6.8;
                        [03] = 7.1;
                    };
                    ['Walk'] = {
                        [01] = 1.7;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceAgentMinRadius'] = 0.8;
            ['collisionAvoidanceAgentRadius'] = 1.25;
            ['collisionAvoidanceObstacleOffest'] = {
                ['x'] = 0;
                ['y'] = 0.3;
                ['z'] = 0;
            };
            ['collisionAvoidanceObstacleRadius'] = 0.5;
            ['collisionAvoidanceObstacleTravel'] = 0.8;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 0.5;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/inv_horse_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/inv_horse_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetInspectableByPlayer'] = function (...) end;
        ['GetMountableByPlayer'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsMountLegal'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnBonding'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInspect'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMount'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStartle'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_horse';
                ['footstepEffect'] = 'footsteps_horse_mat';
            };
            ['ControlProfile'] = 2;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = true;
            ['bMountIsLegal'] = false;
            ['bNotPlayerInspectable'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'horse2';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/horse/horse.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['SetInspectableByPlayer'] = function (...) end;
        ['SetMountIsLegal'] = function (...) end;
        ['SetMountIsLegalFromAI'] = function (...) end;
        ['SetMountableByPlayer'] = function (...) end;
        ['SetMountableByPlayerDisabledFromAI'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['actorCombatDimension'] = {
            ['size'] = {
                ['x'] = 0.5;
                ['y'] = 1.3;
                ['z'] = 0;
            };
        };
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 1;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 1.15;
            };
            ['posCarcass'] = {
                ['x'] = 0.18;
                ['y'] = 0;
                ['z'] = 0.22;
            };
            ['radius'] = 0.32;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Horse';
        ['defaultSoulClass'] = 'horse';
        ['gameParams'] = {
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.3;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.2;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['inspectableByPlayer'] = true;
        ['maxMountDistance'] = 1.75;
        ['mountIsLegalFromAI'] = false;
        ['mountableByPlayer'] = true;
        ['mountableByPlayerDisabledFromAI'] = false;
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 30;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 480;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 90;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['enabled'] = 0;
            ['flags'] = 0;
            ['mass'] = 480;
            ['neckMass'] = 1;
            ['stiffness_scale'] = 73;
        };
        ['simplifiedRootRotation'] = false;
    };
    InventoryDummyPlayer = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 6;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 3.5;
            ['sprintSpeed'] = 6.4;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/inv_male_controllerdefs.xml';
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/inv_male_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitInventoryDummyPlayer'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['InventoryDummyPlayer_OnInit'] = function (...) end;
        ['InventoryDummyPlayer_OnReset'] = function (...) end;
        ['InventoryDummyPlayer_Reset'] = function (...) end;
        ['InventoryDummyPlayer_ResetCommon'] = function (...) end;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_npc';
                ['footstepEffect'] = 'footsteps_npc';
            };
            ['ControlProfile'] = 2;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = true;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'male2';
            ['esCommConfig'] = 'npc_default';
            ['esFaction'] = 'Civilians';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['voiceType'] = 'enemy';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['defaultSoulArchetype'] = 'NPC';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['enabled'] = 0;
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    InventoryDummyPlayerFemale = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 6;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 3.5;
            ['sprintSpeed'] = 6.4;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/wh_female_controllerdefs.xml';
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/wh_female_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitInventoryDummyPlayer'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['InventoryDummyPlayer_OnInit'] = function (...) end;
        ['InventoryDummyPlayer_OnReset'] = function (...) end;
        ['InventoryDummyPlayer_Reset'] = function (...) end;
        ['InventoryDummyPlayer_ResetCommon'] = function (...) end;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_npc';
                ['footstepEffect'] = 'footsteps_npc';
            };
            ['ControlProfile'] = 2;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = true;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'female2';
            ['esCommConfig'] = 'npc_default';
            ['esFaction'] = 'Civilians';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/female/skeleton/female.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['voiceType'] = 'enemy';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['defaultSoulArchetype'] = 'NPC_Female';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['enabled'] = 0;
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    InventoryWeapon = {
        ['Category'] = 'approved';
        ['Implementation'] = function (...) end;
        ['Inputs'] = {
            [04] = {
                [01] = 'DrawWeapon';
                [02] = 'bool';
            };
            [01] = {
                [01] = 't_Activate';
                [02] = 'bool';
            };
            [03] = {
                [02] = 'string';
                [01] = 'ItemGUID';
            };
            [02] = {
                [02] = 'entityid';
                [01] = 'Entity';
            };
        };
    };
    IsAnimal = function (...) end;
    IsFemale = function (...) end;
    IsInt = function (...) end;
    IsNumber = function (...) end;
    IsStr = function (...) end;
    IsTable = function (...) end;
    ItemSystem = {
        ['GetPackItemByIndex'] = function (...) end;
        ['GetPackNumItems'] = function (...) end;
        ['GetPackPrimaryItem'] = function (...) end;
        ['GiveItem'] = function (...) end;
        ['GiveItemPack'] = function (...) end;
        ['Reset'] = function (...) end;
        ['SerializePlayerLTLInfo'] = function (...) end;
        ['SetActorItem'] = function (...) end;
        ['SetActorItemByName'] = function (...) end;
    };
    ItemUtils = {
        ['AddMoneyToInventory'] = function (...) end;
        ['CheckMoneyAmount'] = function (...) end;
        ['CreateInvItem'] = function (...) end;
        ['DeliverItemByPlayer'] = function (...) end;
        ['GiveItem'] = function (...) end;
        ['GiveItemToPlayer'] = function (...) end;
        ['HasItem'] = function (...) end;
        ['IsItemInInventory'] = function (...) end;
        ['IsNullWeaponGuid'] = function (...) end;
        ['MoneyTransaction'] = function (...) end;
        ['RemoveInvItem'] = function (...) end;
        ['RemoveMoneyFromInventory'] = function (...) end;
        ['itemIDs'] = {
            ['berans_chalice'] = 'b16db2b4-788a-4a04-8b9a-6ecfebcfc8ec';
            ['black_feather'] = 'c5b24e5e-69f0-4ed9-bc74-96c3de9dc677';
            ['bloodSack'] = '76bada6c-15b5-4109-9857-0a261162849c';
            ['boar_tooth'] = 'a4f0f4c8-dc3f-4cb2-be89-f0f56fbb09fa';
            ['cizeks_dagger'] = '67ef62fd-7d5a-4235-b68e-eede03cd9c99';
            ['dlc4_matej_die'] = 'c56c54b5-b113-41ce-a250-b4eb137909bc';
            ['dog_skin'] = 'c0dd0e15-8cb8-4342-9a4b-eb3d217421c9';
            ['lockpick'] = '8d76f58e-a521-4205-a7e8-9ac077eee5f0';
            ['monasteryKey'] = '56be1ad5-676e-4b6d-9d6d-e94f3164a90c';
            ['money'] = '5ef63059-322e-4e1b-abe8-926e100c770e';
            ['necronomicon_treasure'] = '7becbe4a-c4b4-448e-bb12-5a383da1db31';
            ['newhomes_prib_report'] = 'f37ae0ba-bdad-44e9-8f85-027cacf963a8';
            ['newhomes_rat_report'] = '9036ea9d-c80a-4e0b-b0a1-09eb15efc449';
            ['raven_feather'] = '2bf46965-a851-4602-8282-cbefe7f24945';
            ['wolf_teeth'] = '7b1c57a3-54fd-441f-8cad-21157bd1a85b';
        };
    };
    JointGen = {
        ['Editor'] = {
            ['DisplayArrow'] = 1;
            ['Icon'] = 'Shake.bmp';
        };
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Impulse'] = 1000;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bForceEntityPieces'] = 0;
            ['bHierarchical'] = 1;
            ['bSaved_by_game'] = true;
            ['file_Material'] = '';
            ['minSize'] = 0.0003;
            ['object_BreakTemplate'] = 'objects/broken_cube.cgf';
            ['offset'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['radius'] = 0.05;
            ['scale'] = 1;
        };
    };
    KettleActionTrigger = {
        ['CanEat'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetEatItemClassId'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['GetLinkedSmartObject'] = function (...) end;
        ['GetOwner'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsKettleVirtuallyEmpty'] = function (...) end;
        ['IsLegal'] = function (...) end;
        ['IsLegalHold'] = function (...) end;
        ['IsLegalImpl'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnNPCStateSearchDone'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnResourcesHosted'] = function (...) end;
        ['OnResourcesHostingInterrupted'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTriggerPoint'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'Stance';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = 'sitting';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sPersistentKettleStateVariable'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'None';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = '';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    LODArea = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['connecting_outside'] = false;
        };
        ['type'] = 'LODArea';
    };
    Ladder = {
        ['Editor'] = {
            ['Icon'] = 'ladder.bmp';
            ['IconOnTop'] = 1;
        };
        ['GetActions'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['Movement'] = {
                ['movementAcceleration'] = 5;
                ['movementInertiaDecayRate'] = 5.5;
                ['movementSettleSpeed'] = 0.8;
                ['movementSpeedDownwards'] = 2.25;
                ['movementSpeedUpwards'] = 2.5;
            };
            ['Offsets'] = {
                ['bShowHelpers'] = false;
                ['getOnDistanceAwayBottom'] = 0;
                ['getOnDistanceAwayTop'] = 0.85;
                ['verticalDistanceBetweenRungs'] = 0.25;
            };
            ['ViewLimits'] = {
                ['horizontalViewLimit'] = 30;
                ['verticalDownViewLimit'] = -45;
                ['verticalUpViewLimit'] = 45;
            };
            ['bDrawWeaponOntop'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = true;
            ['bSaved_by_game'] = false;
            ['bTopBlocked'] = false;
            ['bTopOnPalisade'] = false;
            ['bUsable'] = true;
            ['bUseOnlyFromFront'] = true;
            ['esLadderType'] = 'Ladder';
            ['esNavCompoment'] = 'Ladder';
            ['fileModel'] = 'objects/manmade/common_fixtures/ladders/ladder.cgf';
            ['guidSmartObjectType'] = '';
            ['height'] = 3.7;
            ['sWH_AI_EntityCategory'] = 'Ladder';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Server'] = {
            ['OnUpdate'] = function (...) end;
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetUsable'] = function (...) end;
    };
    Lamp = {
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['ModelReset'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['ModelReset'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['ModelReset'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = true;
            ['sWH_AI_EntityCategory'] = '';
        };
        ['Properties2'] = {
            ['Helper'] = 'slt_particle';
            ['LightSource'] = 'Lights.Standard.Light_Lantern';
            ['ParticleEffect'] = 'WH_Particels.fires.candle';
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['TurnLightOn'] = function (...) end;
        ['Use'] = function (...) end;
        ['npcOnly'] = false;
    };
    LayerProfile = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esGameProfile'] = '';
        };
    };
    LedgeObject = {
        ['Editor'] = {
            ['Icon'] = 'ledge.bmp';
            ['ShowBounds'] = 1;
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
                ['StartUse'] = 'entity';
            };
        };
        ['IsClosed'] = function (...) end;
        ['IsShapeOnly'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MainSide'] = {
                ['bEndCrouched'] = false;
                ['bEndFalling'] = false;
                ['bUsableByMarines'] = true;
                ['esLedgeType'] = 'Vault';
            };
            ['OppositeSide'] = {
                ['bEndCrouched'] = false;
                ['bEndFalling'] = false;
                ['bUsableByMarines'] = true;
                ['esLedgeType'] = 'Vault';
            };
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIsThin'] = true;
            ['bIsWindow'] = false;
            ['bLedgeDoubleSide'] = true;
            ['bLedgeFlipped'] = false;
            ['bSaved_by_game'] = false;
            ['fCornerEndAdjustAmount'] = 0.5;
            ['fCornerMaxAngle'] = 130;
        };
        ['ShapeMaxPoints'] = function (...) end;
        ['ShapeMinPoints'] = function (...) end;
        ['StartUse'] = function (...) end;
    };
    LedgeObjectStatic = {
        ['Editor'] = {
            ['Icon'] = 'ledge.bmp';
            ['ShowBounds'] = 1;
        };
        ['ExportToGame'] = function (...) end;
        ['IsClosed'] = function (...) end;
        ['IsShapeOnly'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MainSide'] = {
                ['bEndCrouched'] = false;
                ['bEndFalling'] = false;
                ['bUsableByMarines'] = true;
                ['esLedgeType'] = 'Vault';
            };
            ['OppositeSide'] = {
                ['bEndCrouched'] = false;
                ['bEndFalling'] = false;
                ['bUsableByMarines'] = true;
                ['esLedgeType'] = 'Vault';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIsThin'] = true;
            ['bIsWindow'] = false;
            ['bLedgeDoubleSide'] = true;
            ['bLedgeFlipped'] = false;
            ['bSaved_by_game'] = false;
            ['fCornerEndAdjustAmount'] = 0.5;
            ['fCornerMaxAngle'] = 130;
        };
        ['ShapeMaxPoints'] = function (...) end;
        ['ShapeMinPoints'] = function (...) end;
    };
    LevelHolder = {
        ['Editor'] = {
            ['Icon'] = 'LevelHolder.bmp';
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['iLevelId'] = -1;
        };
    };
    Light = {
        ['ActivateLight'] = function (...) end;
        ['CacheResources'] = function (...) end;
        ['Editor'] = {
            ['AbsoluteRadius'] = 1;
            ['Icon'] = 'Light.bmp';
            ['IsScalable'] = false;
            ['ShowBounds'] = 0;
        };
        ['Event_Active'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Active'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Active'] = 'bool';
            };
        };
        ['GetLightDesc'] = function (...) end;
        ['InitTodActiveTable'] = function (...) end;
        ['LoadLightToSlot'] = function (...) end;
        ['NotifySwitchOnOffFromParent'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyAnimated'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSysSpecLightChanged'] = function (...) end;
        ['Properties'] = {
            ['Color'] = {
                ['clrDiffuse'] = {
                    ['x'] = 1;
                    ['y'] = 1;
                    ['z'] = 1;
                };
                ['fDiffuseMultiplier'] = 1;
                ['fGIMultiplier'] = 1;
                ['fSpecularMultiplier'] = 1;
                ['fVolumetricMultiplier'] = 1;
            };
            ['Options'] = {
                ['bAffectsThisAreaOnly'] = true;
                ['bAffectsVolumetricFogOnly'] = false;
                ['bAmbient'] = false;
                ['bCutsceneLight'] = false;
                ['bFakeLight'] = false;
                ['bIgnoresVisAreas'] = false;
                ['bVolumetricFog'] = true;
                ['esGIMode'] = 'None';
                ['fFogRadialLobe'] = 0;
                ['fVerticalClipDistanceDownward'] = 0;
                ['fVerticalClipDistanceUpward'] = 0;
                ['file_deferred_clip_geom'] = '';
            };
            ['Projector'] = {
                ['bSpotShadow'] = false;
                ['bSpotShadowBack'] = false;
                ['bSpotShadowBottom'] = false;
                ['bSpotShadowLeft'] = false;
                ['bSpotShadowRight'] = false;
                ['bSpotShadowTop'] = false;
                ['fProjectorFov'] = 90;
                ['fProjectorNearPlane'] = 0;
                ['texture_Texture'] = '';
            };
            ['Radius'] = 10;
            ['Shadows'] = {
                ['bDisableShadowCutoff'] = false;
                ['fShadowAutoBiasScale'] = 1;
                ['fShadowBias'] = 1;
                ['fShadowJitterWH'] = 0;
                ['fShadowResolutionScale'] = 1;
                ['fShadowSlopeBias'] = 1;
                ['fShadowUpdateMinRadius'] = 10;
                ['fShadowUpdateRatio'] = 1;
                ['nCastShadows'] = 0;
                ['nShadowMinResPercent'] = 0;
            };
            ['Shape'] = {
                ['bAreaLight'] = false;
                ['bAreaPhysicalAttenuation'] = false;
                ['fFadeInRadius'] = 0;
                ['fNearClip'] = 0;
                ['fPlaneHeight'] = 1;
                ['fPlaneWidth'] = 1;
                ['fWallChamferHorizontal'] = 45;
                ['fWallChamferVertical'] = 45;
                ['fWallThickness'] = 0;
                ['fWindowMarginHorizontal'] = 0;
                ['fWindowMarginVertical'] = 0;
            };
            ['Style'] = {
                ['_fTimeScrubbed'] = 0;
                ['bAttachToSun'] = false;
                ['bFlareEnable'] = true;
                ['bTimeScrubbingInTrackView'] = false;
                ['esLightAnimType'] = 'LoopConstantSeed';
                ['fAnimationSpeed'] = 1;
                ['fFlareFOV'] = 360;
                ['flare_Flare'] = '';
                ['lightanimation_LightAnimation'] = '';
                ['nAnimationPhase'] = 0;
                ['nLightStyle'] = 0;
            };
            ['bActive'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['fAttenuationBulbSize'] = 0.05;
            ['sToDActive'] = '';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['SetColorParams'] = function (...) end;
        ['UpdateLightTOD'] = function (...) end;
    };
    Lightning = {
        ['CacheResources'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Lightning.bmp';
            ['Model'] = 'Editor/Objects/Particles.cgf';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_Strike'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Strike'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Strike'] = 'bool';
            };
        };
        ['GetValueWithVariation'] = function (...) end;
        ['LoadLightToSlot'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStartGame'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['Audio'] = {
                ['audioRTPCDistanceRtpc'] = '';
                ['audioRTPCIntensityRtpc'] = 'lightning_intensity';
                ['audioTriggerPlayTrigger'] = 'lightning';
                ['audioTriggerStopTrigger'] = '';
                ['fSpeedOfSoundScale'] = 1;
            };
            ['Effects'] = {
                ['LightIntensity'] = 0;
                ['LightRadius'] = 0;
                ['ParticleEffect'] = 'WH_Particels.weather.lightning_1';
                ['ParticleScale'] = 0.5;
                ['ParticleScaleVariation'] = 0.2;
                ['SkyHighlightAtten'] = 0.2;
                ['SkyHighlightMultiplier'] = 1;
                ['SkyHighlightVerticalOffset'] = 1000;
                ['color_SkyHighlightColor'] = {
                    ['x'] = 0.8;
                    ['y'] = 0.8;
                    ['z'] = 1;
                };
            };
            ['Timing'] = {
                ['fDelay'] = 20;
                ['fDelayVariation'] = 0.8;
                ['fLightningDuration'] = 0.5;
            };
            ['bActive'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bRelativeToPlayer'] = 1;
            ['bSaved_by_game'] = true;
            ['fDistance'] = 2000;
            ['fDistanceVariation'] = 0.5;
        };
        ['ScheduleNextStrike'] = function (...) end;
        ['StopStrike'] = function (...) end;
        ['TempPos'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['UpdateLightningParams'] = function (...) end;
        ['_KillAllAudioTimers'] = function (...) end;
        ['_LightTable'] = {
            ['diffuse_color'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
            ['specular_color'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
        };
        ['_LookupControlIDs'] = function (...) end;
        ['_SkyHighlight'] = {
            ['color'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['position'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['size'] = 0;
        };
        ['_StrikeCount'] = 0;
        ['nAudioTimerMinID'] = 2;
        ['nNumAuxAudioProxies'] = 4;
        ['nNumThunder'] = 1;
    };
    LoadAllScripts = function (...) end;
    LocationPoint = {
        ['Editor'] = {
            ['Icon'] = 'TagPoint.bmp';
        };
        ['OnInit'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['guidLocationId'] = '';
        };
        ['type'] = 'LocationPoint';
    };
    Lockpickable = {
        ['DoPlaySound'] = function (...) end;
        ['DoStopSound'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'lockpickable.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Hide'] = function (...) end;
        ['Event_Lock'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Unlock'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Lock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Unlock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hide'] = 'bool';
                ['Lock'] = 'bool';
                ['UnHide'] = 'bool';
                ['Unlock'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetLockDifficulty'] = function (...) end;
        ['GetUsableEvent'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['Lock'] = function (...) end;
        ['LockType'] = 'pillory';
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Lock'] = {
                ['bCanLockPick'] = true;
                ['bLocked'] = true;
                ['bSendMessage'] = false;
                ['esLockFanciness'] = 'Common';
                ['fLockDifficulty'] = 0.1;
                ['guidItemClassId'] = '';
            };
            ['Phase'] = {
                ['bChangeAfterPlayerInteract'] = false;
                ['object_ModelAfterInteract'] = '';
            };
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractableThroughCollision'] = false;
            ['bOwnedByHome'] = true;
            ['bSaved_by_game'] = true;
            ['bSkipAngleCheck'] = false;
            ['fUseAngle'] = 0.3;
            ['fUseDistance'] = 1.5;
            ['fUseSlotRotationAngle'] = 0;
            ['fUseXOffset'] = 0;
            ['fUseYOffset'] = 0;
            ['fUseZOffset'] = 0;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'Objects/manmade/food/food/egg.cgf';
            ['sPickPlaceAnimTag'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['SetBeingUsedByNPC'] = function (...) end;
        ['SetBeingUsedByPlayer'] = function (...) end;
        ['SetInteractive'] = function (...) end;
        ['Unlock'] = function (...) end;
        ['bLocked'] = false;
        ['bNeedUpdate'] = 0;
        ['bUseableMsgChanged'] = 0;
        ['nSoundId'] = 0;
        ['nUserId'] = 0;
    };
    LuaUtils = {
        ['IsInt'] = function (...) end;
        ['IsNumber'] = function (...) end;
        ['IsStr'] = function (...) end;
        ['IsTable'] = function (...) end;
        ['NativeToStr'] = function (...) end;
        ['NumberToBool'] = function (...) end;
        ['Pick'] = function (...) end;
        ['StrToNative'] = function (...) end;
    };
    MaterialEffects = {
        ['ExecuteEffect'] = function (...) end;
        ['GetEffectId'] = function (...) end;
        ['GetEffectIdByLibName'] = function (...) end;
        ['PrintEffectIdByMatIndex'] = function (...) end;
    };
    MergeInternal = function (...) end;
    MissileWeapon = {
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = true;
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['Use'] = function (...) end;
        ['__super'] = {
            ['GetActions'] = function (...) end;
            ['GetUsableName'] = function (...) end;
            ['InteractorPriority'] = 2;
            ['IsCrossCenteringEnabled'] = function (...) end;
            ['OnEnablePhysics'] = function (...) end;
            ['OnLevelLoaded'] = function (...) end;
            ['OnPropertyChange'] = function (...) end;
            ['OnUsed'] = function (...) end;
            ['OnUsedHold'] = function (...) end;
            ['PhysicalizeThis'] = function (...) end;
            ['Properties'] = {
                ['Script'] = {
                    ['Misc'] = '';
                };
                ['bExported_to_game'] = true;
                ['bExported_to_test'] = true;
                ['bInteractiveCollisionClass'] = false;
                ['bSaved_by_game'] = true;
            };
            ['SetInteractiveCollisionType'] = function (...) end;
            ['Use'] = function (...) end;
            ['npcOnly'] = false;
        };
        ['npcOnly'] = false;
    };
    MissionObjective = {
        ['Activated'] = {
            ['OnBeginState'] = function (...) end;
            ['OnEndState'] = function (...) end;
        };
        ['Completed'] = {
            ['OnBeginState'] = function (...) end;
        };
        ['Deactivated'] = {
            ['OnBeginState'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'TagPoint.bmp';
            ['Model'] = 'Editor/Objects/T.cgf';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Completed'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['Event_Failed'] = function (...) end;
        ['Event_SilentActivate'] = function (...) end;
        ['Event_SilentDeactivate'] = function (...) end;
        ['Failed'] = {
            ['OnBeginState'] = function (...) end;
        };
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Completed'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Failed'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['SilentActivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['SilentDeactivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activated'] = 'bool';
                ['Completed'] = 'bool';
                ['Deactivated'] = 'bool';
                ['Failed'] = 'bool';
            };
        };
        ['OnDestroy'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIsPathHelper'] = 0;
            ['bSaved_by_game'] = true;
            ['bShowOnRadar'] = 1;
            ['mission_MissionID'] = '';
            ['sTrackedEntityName'] = '';
        };
        ['Reset'] = function (...) end;
        ['States'] = {
            [04] = 'Completed';
            [01] = 'Deactivated';
            [03] = 'Failed';
            [02] = 'Activated';
        };
    };
    Movie = {
        ['AbortSequence'] = function (...) end;
        ['PauseSequences'] = function (...) end;
        ['PlaySequence'] = function (...) end;
        ['ResumeSequences'] = function (...) end;
        ['StopAllCutScenes'] = function (...) end;
        ['StopAllSequences'] = function (...) end;
        ['StopSequence'] = function (...) end;
    };
    MovingSmartObjectHolder = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bMovingSmartObject'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    MusicCutscene = {
        ['Editor'] = {
            ['Icon'] = 'AudioAreaEntity.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
        };
    };
    NPC = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Alerted'] = {
                    ['Run'] = {
                        [02] = 3.5;
                        [01] = 3.5;
                        [03] = 3.5;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 0.8;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [03] = 5;
                        [01] = 5;
                    };
                    ['Walk'] = {
                        [02] = 1.4;
                        [01] = 1.4;
                        [03] = 1.4;
                    };
                };
                ['Combat'] = {
                    ['Run'] = {
                        [01] = 4.5;
                        [03] = 4.5;
                        [02] = 4.5;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 0.8;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [01] = 6;
                        [02] = 6;
                        [03] = 6;
                    };
                    ['Walk'] = {
                        [01] = 1.7;
                        [03] = 1.7;
                        [02] = 1.7;
                    };
                };
                ['Crouch'] = {
                    ['Run'] = {
                        [02] = 2;
                        [01] = 2;
                        [03] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 0.8;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 2;
                        [01] = 2;
                        [03] = 2;
                    };
                    ['Walk'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 1.3;
                    };
                };
                ['HighCover'] = {
                    ['Run'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Slow'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 1.3;
                    };
                    ['Sprint'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Walk'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 1.3;
                    };
                };
                ['LowCover'] = {
                    ['Run'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 0.9;
                        [02] = 0.9;
                    };
                    ['Sprint'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Walk'] = {
                        [01] = 0.9;
                        [03] = 0.9;
                        [02] = 0.9;
                    };
                };
                ['Relaxed'] = {
                    ['Run'] = {
                        [02] = 3.5;
                        [01] = 3.5;
                        [03] = 3.5;
                    };
                    ['Slow'] = {
                        [02] = 0.6;
                        [03] = 0.6;
                        [01] = 0.6;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [03] = 5;
                        [01] = 5;
                    };
                    ['Walk'] = {
                        [01] = 1.1;
                        [02] = 1.1;
                        [03] = 1.1;
                    };
                };
                ['Swim'] = {
                    ['Run'] = {
                        [02] = 3.5;
                        [01] = 3.5;
                        [03] = 3.5;
                    };
                    ['Slow'] = {
                        [01] = 1;
                        [02] = 1;
                        [03] = 1;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [03] = 5;
                        [01] = 5;
                    };
                    ['Walk'] = {
                        [01] = 1;
                        [02] = 1;
                        [03] = 1;
                    };
                };
            };
            ['aimTurnSpeed'] = -1;
            ['allowEntityClampingByAnimation'] = 1;
            ['avoidanceAbilities'] = 65535;
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['directionalScaleRefSpeedMax'] = 8;
            ['directionalScaleRefSpeedMin'] = 1;
            ['distanceToCover'] = 0.5;
            ['effectiveCoverHeight'] = 0.55;
            ['effectiveHighCoverHeight'] = 1.75;
            ['fireTurnSpeed'] = -1;
            ['inCoverRadius'] = 0.075;
            ['lightAffectsSpeed'] = 1;
            ['lookCombatTurnSpeed'] = 50;
            ['lookIdleTurnSpeed'] = 30;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 0.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.25;
            ['pathRegenIntervalDuringTrace'] = 1;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 1;
            ['pushableObstacleAvoidanceRadius'] = 0.4;
            ['pushableObstacleWeakAvoidance'] = true;
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 2;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_male_controllerdefs.xml';
        ['ActorCanTalk'] = function (...) end;
        ['AddLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_male_database.adb';
        ['CombatOpponentMnTag'] = 'oppMale';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetCanTalkHintType'] = function (...) end;
        ['GetChatActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsableMsgChanged'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnChat'] = function (...) end;
        ['OnChatOpen'] = function (...) end;
        ['OnChatRequestAccepted'] = function (...) end;
        ['OnChatWithFocus'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnFollow'] = function (...) end;
        ['OnGrabCorpse'] = function (...) end;
        ['OnHorsePullDown'] = function (...) end;
        ['OnKnockout'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMercyKill'] = function (...) end;
        ['OnPickpocketing'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStealthKill'] = function (...) end;
        ['OnTalk'] = function (...) end;
        ['OpponentMnTag'] = 'relatedMale';
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 0.8;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 0.8;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys_npc';
                ['footstepEffect'] = 'footsteps_npc';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_CreateSituationSubsystem'] = true;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['eiSoundObstructionType'] = 2;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'male2';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['perInstanceStreamingPriority'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['voiceType'] = 'enemy';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionDamageThreshold'] = 2;
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['lookFOV'] = 180;
            ['minimumAngleForTurnWithoutDelay'] = 20;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['lastCanTalkHintFlag'] = true;
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    NPC_Female = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Alerted'] = {
                    ['Run'] = {
                        [02] = 3.5;
                        [01] = 3.5;
                        [03] = 3.5;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 0.8;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [03] = 5;
                        [01] = 5;
                    };
                    ['Walk'] = {
                        [02] = 1.4;
                        [01] = 1.4;
                        [03] = 1.4;
                    };
                };
                ['Combat'] = {
                    ['Run'] = {
                        [01] = 4.5;
                        [03] = 4.5;
                        [02] = 4.5;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 0.8;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [01] = 6;
                        [02] = 6;
                        [03] = 6;
                    };
                    ['Walk'] = {
                        [01] = 1.7;
                        [03] = 1.7;
                        [02] = 1.7;
                    };
                };
                ['Crouch'] = {
                    ['Run'] = {
                        [02] = 2;
                        [01] = 2;
                        [03] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.8;
                        [03] = 0.8;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 2;
                        [01] = 2;
                        [03] = 2;
                    };
                    ['Walk'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 1.3;
                    };
                };
                ['HighCover'] = {
                    ['Run'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Slow'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 1.3;
                    };
                    ['Sprint'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Walk'] = {
                        [03] = 1.3;
                        [01] = 1.3;
                        [02] = 1.3;
                    };
                };
                ['LowCover'] = {
                    ['Run'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 0.9;
                        [02] = 0.9;
                    };
                    ['Sprint'] = {
                        [02] = 1.8;
                        [01] = 1.8;
                        [03] = 1.8;
                    };
                    ['Walk'] = {
                        [01] = 0.9;
                        [03] = 0.9;
                        [02] = 0.9;
                    };
                };
                ['Relaxed'] = {
                    ['Run'] = {
                        [02] = 3.5;
                        [01] = 3.5;
                        [03] = 3.5;
                    };
                    ['Slow'] = {
                        [02] = 0.6;
                        [03] = 0.6;
                        [01] = 0.6;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [03] = 5;
                        [01] = 5;
                    };
                    ['Walk'] = {
                        [01] = 1.1;
                        [02] = 1.1;
                        [03] = 1.1;
                    };
                };
                ['Swim'] = {
                    ['Run'] = {
                        [02] = 3.5;
                        [01] = 3.5;
                        [03] = 3.5;
                    };
                    ['Slow'] = {
                        [01] = 1;
                        [02] = 1;
                        [03] = 1;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [03] = 5;
                        [01] = 5;
                    };
                    ['Walk'] = {
                        [01] = 1;
                        [02] = 1;
                        [03] = 1;
                    };
                };
            };
            ['aimTurnSpeed'] = -1;
            ['allowEntityClampingByAnimation'] = 1;
            ['avoidanceAbilities'] = 65535;
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['directionalScaleRefSpeedMax'] = 8;
            ['directionalScaleRefSpeedMin'] = 1;
            ['distanceToCover'] = 0.5;
            ['effectiveCoverHeight'] = 0.55;
            ['effectiveHighCoverHeight'] = 1.75;
            ['fireTurnSpeed'] = -1;
            ['inCoverRadius'] = 0.075;
            ['lightAffectsSpeed'] = 1;
            ['lookCombatTurnSpeed'] = 50;
            ['lookIdleTurnSpeed'] = 30;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 0.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.25;
            ['pathRegenIntervalDuringTrace'] = -1;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 1;
            ['pushableObstacleAvoidanceRadius'] = 0.4;
            ['pushableObstacleWeakAvoidance'] = true;
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 2;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/wh_female_controllerdefs.xml';
        ['ActorCanTalk'] = function (...) end;
        ['AddLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/wh_female_database.adb';
        ['CombatOpponentMnTag'] = 'oppFemale';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetCanTalkHintType'] = function (...) end;
        ['GetChatActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsableMsgChanged'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnChat'] = function (...) end;
        ['OnChatOpen'] = function (...) end;
        ['OnChatRequestAccepted'] = function (...) end;
        ['OnChatWithFocus'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnFollow'] = function (...) end;
        ['OnGrabCorpse'] = function (...) end;
        ['OnHorsePullDown'] = function (...) end;
        ['OnKnockout'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMercyKill'] = function (...) end;
        ['OnPickpocketing'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStealthKill'] = function (...) end;
        ['OnTalk'] = function (...) end;
        ['OpponentMnTag'] = 'relatedFemale';
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 0.8;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 0.8;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_npc';
                ['footstepEffect'] = 'footsteps_npc';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_CreateSituationSubsystem'] = true;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['eiSoundObstructionType'] = 2;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'female2';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/female/skeleton/female.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['perInstanceStreamingPriority'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['voiceType'] = 'enemy';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['defaultSoulArchetype'] = 'NPC_Female';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['lookFOV'] = 180;
            ['minimumAngleForTurnWithoutDelay'] = 20;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.5;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.5;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.5;
                    };
                };
            };
        };
        ['lastCanTalkHintFlag'] = true;
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    NPC_NAI = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 6;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 3.5;
            ['sprintSpeed'] = 6.4;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_male_controllerdefs.xml';
        ['ActorCanTalk'] = function (...) end;
        ['AddLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_male_database.adb';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetCanTalkHintType'] = function (...) end;
        ['GetChatActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitNPC_NAI'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['NPC_NAI_OnInit'] = function (...) end;
        ['NPC_NAI_OnReset'] = function (...) end;
        ['NPC_NAI_Reset'] = function (...) end;
        ['NPC_NAI_ResetCommon'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnChat'] = function (...) end;
        ['OnChatOpen'] = function (...) end;
        ['OnChatRequestAccepted'] = function (...) end;
        ['OnChatWithFocus'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnFollow'] = function (...) end;
        ['OnGrabCorpse'] = function (...) end;
        ['OnHorsePullDown'] = function (...) end;
        ['OnKnockout'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMercyKill'] = function (...) end;
        ['OnPickpocketing'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStealthKill'] = function (...) end;
        ['OnTalk'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_npc';
                ['footstepEffect'] = 'footsteps_npc';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'male2';
            ['esCommConfig'] = 'npc_default';
            ['esFaction'] = 'Civilians';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['voiceType'] = 'enemy';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['defaultSoulArchetype'] = 'NPC';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    NavigationSeedPoint = {
        ['Editor'] = {
            ['Icon'] = 'Seed.bmp';
        };
        ['OnInit'] = function (...) end;
        ['type'] = 'NavigationSeedPoint';
    };
    NavigationUtils = {
        ['DotProduct'] = function (...) end;
        ['GetChasingPoint'] = function (...) end;
        ['GetChasingPointInOpposingQuadrant'] = function (...) end;
        ['GetChasingPointOpposingTwoQuadrants'] = function (...) end;
        ['GetSurroundingChasingPoint'] = function (...) end;
    };
    Negotiation = {
        ['CalcAcceptableTolerance'] = function (...) end;
        ['CalcDominance'] = function (...) end;
        ['CalcImpatienceIncMod'] = function (...) end;
        ['CalcPriceRatio'] = function (...) end;
        ['CalcReaction'] = function (...) end;
        ['CalcStep'] = function (...) end;
        ['CheckImpatienceOverLimit'] = function (...) end;
        ['GetMerchantMoney'] = function (...) end;
        ['GetPlayerMoney'] = function (...) end;
        ['HasSecondChance'] = function (...) end;
        ['Init'] = function (...) end;
        ['InitControls'] = function (...) end;
        ['InitDominance'] = function (...) end;
        ['OpenWithBaseProposition'] = function (...) end;
        ['ReactToPlayerProposition'] = function (...) end;
        ['RecalcIntermediateValues'] = function (...) end;
        ['RecalcPlayerSellsValue'] = function (...) end;
        ['Round'] = function (...) end;
        ['SpendSecondChance'] = function (...) end;
        ['UpdateUiState'] = function (...) end;
        ['new'] = function (...) end;
    };
    NegotiationOrientation = {
    };
    NegotiationProposition = {
        ['GetImpatience'] = function (...) end;
        ['GetPrice'] = function (...) end;
        ['new'] = function (...) end;
    };
    NegotiationReactionKind = {
        ['Accept'] = {
            ['index'] = 1;
        };
        ['Counter'] = {
            ['index'] = 2;
        };
        ['Mock'] = {
            ['index'] = 3;
        };
        ['Refuse'] = {
            ['index'] = 4;
        };
    };
    NegotiationReason = {
        ['Bathhouse'] = {
            ['index'] = 5;
        };
        ['Bribe'] = {
            ['index'] = 2;
        };
        ['Haggle'] = {
            ['index'] = 1;
        };
        ['Sleepover'] = {
            ['index'] = 3;
        };
        ['Trainer'] = {
            ['index'] = 4;
        };
    };
    NegotiationUtils = {
        ['PlayTransactionSound'] = function (...) end;
        ['SetupNegotiation'] = function (...) end;
    };
    Nest = {
        ['AfterReset'] = function (...) end;
        ['AfterShot'] = function (...) end;
        ['AssignInventory'] = function (...) end;
        ['CanBeUsed'] = function (...) end;
        ['Client'] = {
            ['OnHit'] = function (...) end;
        };
        ['Close'] = function (...) end;
        ['DoPlaySound'] = function (...) end;
        ['DoStopSound'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Stash.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Close'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Open'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Close'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Open'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Close'] = 'bool';
                ['Hide'] = 'bool';
                ['Open'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetSoundTriggerID'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Open'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Database'] = {
                ['bReadOnly'] = false;
                ['guidInventoryDBId'] = 0;
                ['sInventoryPreset'] = 'inventory_birdNest';
            };
            ['Lock'] = {
                ['bCanLockPick'] = false;
                ['bCanUnlockWithDynamicKey'] = false;
                ['bLockDifficultyOverride'] = false;
                ['bLocked'] = false;
                ['bSendMessage'] = false;
                ['esLockFanciness'] = 'Common';
                ['fLockDifficulty'] = 1;
                ['guidItemClassId'] = '';
            };
            ['ParticleEffect'] = '';
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = 1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['Sounds'] = {
                ['snd_Birds'] = 'a_l_poi_birdnest';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['isShootingTarget'] = true;
            ['object_Model'] = 'Objects/natural/animal/bird_nest.cgf';
        };
        ['Reset'] = function (...) end;
        ['StartParticleEffect'] = function (...) end;
        ['__super'] = {
            ['AssignInventory'] = function (...) end;
            ['Client'] = {
                ['OnHit'] = function (...) end;
            };
            ['Close'] = function (...) end;
            ['DoPlaySound'] = function (...) end;
            ['DoStopSound'] = function (...) end;
            ['Editor'] = {
                ['Icon'] = 'Stash.bmp';
                ['IconOnTop'] = 1;
                ['ShowBounds'] = 1;
            };
            ['Event_Close'] = function (...) end;
            ['Event_Hide'] = function (...) end;
            ['Event_Open'] = function (...) end;
            ['Event_UnHide'] = function (...) end;
            ['FlowEvents'] = {
                ['Inputs'] = {
                    ['Close'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Hide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Open'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['UnHide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                };
                ['Outputs'] = {
                    ['Close'] = 'bool';
                    ['Hide'] = 'bool';
                    ['Open'] = 'bool';
                    ['UnHide'] = 'bool';
                };
            };
            ['GetSoundTriggerID'] = function (...) end;
            ['IsUsable'] = function (...) end;
            ['NeedSerialize'] = function (...) end;
            ['OnInventoryClosed'] = function (...) end;
            ['OnPropertyChange'] = function (...) end;
            ['OnReset'] = function (...) end;
            ['OnSave'] = function (...) end;
            ['OnSpawn'] = function (...) end;
            ['OnUsed'] = function (...) end;
            ['Open'] = function (...) end;
            ['PhysicalizeThis'] = function (...) end;
            ['Properties'] = {
                ['Database'] = {
                    ['bReadOnly'] = false;
                    ['guidInventoryDBId'] = 0;
                    ['sInventoryPreset'] = '';
                };
                ['Lock'] = {
                    ['bCanLockPick'] = false;
                    ['bCanUnlockWithDynamicKey'] = false;
                    ['bLockDifficultyOverride'] = false;
                    ['bLocked'] = false;
                    ['bSendMessage'] = false;
                    ['esLockFanciness'] = 'Common';
                    ['fLockDifficulty'] = 1;
                    ['guidItemClassId'] = '';
                };
                ['ParticleEffect'] = '';
                ['Physics'] = {
                    ['Density'] = -1;
                    ['Mass'] = 1;
                    ['bPhysicalize'] = true;
                    ['bPushableByPlayers'] = false;
                    ['bRigidBody'] = true;
                };
                ['object_Model'] = 'Objects/natural/animal/bird_nest.cgf';
            };
            ['Reset'] = function (...) end;
            ['StartParticleEffect'] = function (...) end;
            ['bLocked'] = false;
            ['inventoryId'] = 0;
            ['shot'] = 0;
        };
        ['bLocked'] = false;
        ['inventoryId'] = 0;
        ['shot'] = 0;
    };
    Net = {
        ['DelegateAuthority'] = function (...) end;
        ['Expose'] = function (...) end;
    };

    NewHomesEntity = {
        ['CreateGameCore'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Seed.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['LoadState'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['PrepareBookData'] = function (...) end;
        ['PrepareBookMetaData'] = function (...) end;
        ['RequestAddonBuilding'] = function (...) end;
        ['RequestStructureBuilding'] = function (...) end;
    };
    NullAI = {
        ['AIMovementAbility'] = {
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 1e+06;
            ['maxDecel'] = 1e+06;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathLookAhead'] = 2;
            ['pathRadius'] = 0.3;
            ['pathRegenIntervalDuringTrace'] = -1;
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 4;
            ['sprintSpeed'] = 6.4;
            ['walkSpeed'] = 2;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_male_controllerdefs.xml';
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_male_database.adb';
        ['AnimationGraph'] = '';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitNullAI'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['NotifyRemoval'] = function (...) end;
        ['NullAI_OnInit'] = function (...) end;
        ['NullAI_OnReset'] = function (...) end;
        ['NullAI_OnSpawn'] = function (...) end;
        ['NullAI_Reset'] = function (...) end;
        ['NullAI_ResetCommon'] = function (...) end;
        ['NullAI_SetActorModel'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys';
                ['footstepEffect'] = 'footsteps';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = 'Player';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = '';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = '';
            ['fileModel'] = '';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UpperBodyGraph'] = '';
        ['_Parent'] = {
            ['OnReset'] = function (...) end;
            ['OnSpawn'] = function (...) end;
            ['Reset'] = function (...) end;
            ['ResetCommon'] = function (...) end;
            ['SetActorModel'] = function (...) end;
        };
        ['ai'] = 1;
        ['defaultSoulArchetype'] = 'NPC';
        ['gameParams'] = {
            ['physicsParams'] = {
                ['Living'] = {
                    ['inertia'] = 0;
                    ['inertiaAccel'] = 0;
                };
            };
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['hitDeathReactionsParamsDefFile'] = '';
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
    };
    OnInit = function (...) end;
    OnShutdown = function (...) end;
    Particle = {
        ['CreateDecal'] = function (...) end;
        ['CreateEffect'] = function (...) end;
        ['CreateMatDecal'] = function (...) end;
        ['DeleteEffect'] = function (...) end;
        ['IsEffectAvailable'] = function (...) end;
        ['SpawnEffect'] = function (...) end;
        ['SpawnEffectLine'] = function (...) end;
        ['SpawnParticles'] = function (...) end;
    };
    PathfindDebugUtils = {
        ['Data'] = {
            ['Speed'] = 'walk';
        };
        ['FindDataTable'] = function (...) end;
        ['GenerateSpawnParams'] = function (...) end;
        ['GetNPCSpeed'] = function (...) end;
        ['Presets'] = {
            ['SoulName'] = 'test_pathfollower_dummy';
            ['SoulSharedGUID'] = '88bee0ec-f164-4282-ae1e-6576a76b9bac';
        };
        ['SaveDestinationPos'] = function (...) end;
        ['SaveOriginPos'] = function (...) end;
        ['SetNPCSpeed'] = function (...) end;
        ['SpawnNPC'] = function (...) end;
        ['SpawnOrMoveTagPointToPlayerPos'] = function (...) end;
    };
    PersuadeByPlayer = function (...) end;
    Physics = {
        ['RayTraceCheck'] = function (...) end;
        ['RayWorldIntersection'] = function (...) end;
        ['RegisterExplosionCrack'] = function (...) end;
        ['RegisterExplosionShape'] = function (...) end;
        ['SamplePhysEnvironment'] = function (...) end;
        ['SimulateExplosion'] = function (...) end;
    };
    Pick = function (...) end;
    PickableArea = {
        ['Activate'] = function (...) end;
        ['Amount'] = 0;
        ['ArePickableAreasEnabledInGeneral'] = function (...) end;
        ['DisablePickableAreasInGeneral'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Seed.bmp';
            ['IconOnTop'] = 1;
        };
        ['EnablePickableAreasInGeneral'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                };
                ['UnHide'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Hide'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['Gather'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['GuidItemPicked'] = '';
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['PickingTime'] = 1;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHasUsableFlag'] = true;
            ['bSaved_by_game'] = true;
            ['sUsableMessage'] = '@ui_pickherb';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['UsableName'] = '';
    };
    Pig = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_pig_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_pig_database.adb';
        ['CombatOpponentMnTag'] = 'oppPig';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Sheep';
                ['footstepEffect'] = 'footsteps_Sheep';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'pig';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/pig/pig_female.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.8;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.15;
                ['z'] = 0.6;
            };
            ['posCarcass'] = {
                ['x'] = 0.25;
                ['y'] = 0.1;
                ['z'] = 0.25;
            };
            ['radius'] = 0.25;
        };
        ['collisionClass'] = 524288;
        ['defaultSoulArchetype'] = 'Pig';
        ['defaultSoulClass'] = 'pig';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['relaxed'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'relaxed';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 100;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 100;
            ['stiffness_scale'] = 73;
        };
    };
    Player = {
        ['AIMovementAbility'] = {
            ['collisionAvoidanceObstacleRadius'] = 0.7;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_male_controllerdefs.xml';
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_male_database.adb';
        ['CheatEngine'] = function (...) end;
        ['CheatEngine_animal'] = function (...) end;
        ['CheatEngine_equipweapon'] = function (...) end;
        ['CheatEngine_money'] = function (...) end;
        ['CheatEngine_skill'] = function (...) end;
        ['CheatEngine_stat'] = function (...) end;
        ['CheatEngine_time'] = function (...) end;
        ['CheatGiveBow'] = function (...) end;
        ['Client'] = {
            ['OnInit'] = function (...) end;
        };
        ['CombatOpponentMnTag'] = 'oppMale';
        ['GetDogActions'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['OnAction'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OpponentMnTag'] = 'relatedMale';
        ['PRTelep'] = function (...) end;
        ['PRTelepShowMessage'] = function (...) end;
        ['PRTelep_unlock'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys_player';
                ['footstepEffect'] = 'footsteps_player';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 1;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SoundPack'] = 'ai_player_default';
            ['aicharacter_character'] = 'Player';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['clientFileModel'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['commrange'] = 40;
            ['esClothingConfig'] = 'male2';
            ['esCommConfig'] = 'player_default';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'player_default';
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/male/skeleton/male.cdf';
            ['fpItemHandsModel'] = '';
            ['physicMassMult'] = 1;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = 'PlayerIdle';
        };
        ['Reset'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['SetModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['defaultSoulClass'] = 'player';
        ['foreignCollisionDamageMult'] = 0.1;
        ['gameParams'] = {
            ['canUseComplexLookIK'] = false;
            ['lookAtSimpleHeadBone'] = 'LookIK';
            ['lookFOV'] = 720;
            ['slopeSlowdown'] = 3;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
        ['type'] = 'Player';
        ['vehicleCollisionDamageMult'] = 7.5;
    };
    PlayerFemale = {
        ['AIMovementAbility'] = {
            ['collisionAvoidanceObstacleRadius'] = 0.7;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/wh_female_controllerdefs.xml';
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/wh_female_database.adb';
        ['CheatEngine'] = function (...) end;
        ['CheatEngine_animal'] = function (...) end;
        ['CheatEngine_equipweapon'] = function (...) end;
        ['CheatEngine_money'] = function (...) end;
        ['CheatEngine_skill'] = function (...) end;
        ['CheatEngine_stat'] = function (...) end;
        ['CheatEngine_time'] = function (...) end;
        ['CheatGiveBow'] = function (...) end;
        ['Client'] = {
            ['OnInit'] = function (...) end;
        };
        ['CombatOpponentMnTag'] = 'oppFemale';
        ['GetDogActions'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['OnAction'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OpponentMnTag'] = 'relatedFemale';
        ['PRTelep'] = function (...) end;
        ['PRTelepShowMessage'] = function (...) end;
        ['PRTelep_unlock'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foleys_player';
                ['footstepEffect'] = 'footsteps_player';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 1;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SoundPack'] = 'ai_player_default';
            ['aicharacter_character'] = 'Player';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIsDummy'] = false;
            ['bSaved_by_game'] = true;
            ['clientFileModel'] = 'Objects/Characters/humans/female/skeleton/female.cdf';
            ['commrange'] = 40;
            ['esClothingConfig'] = 'female2';
            ['esCommConfig'] = 'player_default';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'player_default';
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_SkeletonMale.xml';
            ['fileModel'] = 'Objects/Characters/humans/female/skeleton/female.cdf';
            ['fpItemHandsModel'] = '';
            ['physicMassMult'] = 1;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = 'PlayerIdle';
        };
        ['Reset'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['SetModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['defaultSoulArchetype'] = 'NPC_Female';
        ['defaultSoulClass'] = 'NPC_Female';
        ['foreignCollisionDamageMult'] = 0.1;
        ['gameParams'] = {
            ['canUseComplexLookIK'] = false;
            ['lookAtSimpleHeadBone'] = 'LookIK';
            ['lookFOV'] = 720;
            ['slopeSlowdown'] = 3;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 80;
                ['max_climb_angle'] = 50;
                ['max_jump_angle'] = 40;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 90;
                ['min_slide_angle'] = 49;
                ['timeImpulseRecover'] = 1;
            };
            ['flags'] = 0;
            ['mass'] = 80;
            ['stiffness_scale'] = 73;
        };
        ['type'] = 'PlayerFemale';
        ['vehicleCollisionDamageMult'] = 7.5;
    };
    PlayerStateHandler = {
        ['ChangeStance'] = function (...) end;
        ['ChangeUnstance'] = function (...) end;
        ['ChangeUnstanceJoined'] = function (...) end;
        ['EndHostResourcesPlayAnimationAction'] = function (...) end;
        ['HostResourcesPlayAnimationAction'] = function (...) end;
        ['PlayAnimationAction'] = function (...) end;
        ['PlayAnimationActionJoined'] = function (...) end;
        ['StartMinigame'] = function (...) end;
    };
    PlayerWeapon = {
        ['Client'] = {
            ['ClEvent_ResetAnimation'] = function (...) end;
            ['ClEvent_StartAnimation'] = function (...) end;
            ['ClSync'] = function (...) end;
            ['OnLevelLoaded'] = function (...) end;
            ['OnPhysicsBreak'] = function (...) end;
            ['OnTimer'] = function (...) end;
        };
        ['CorrectTiming'] = function (...) end;
        ['DoStartAnimation'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 0;
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_ModelLoad'] = function (...) end;
        ['Event_ModelUnload'] = function (...) end;
        ['Event_Ragdollize'] = function (...) end;
        ['Event_RagdollizeDerived'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_RenderAlwaysDisable'] = function (...) end;
        ['Event_RenderAlwaysEnable'] = function (...) end;
        ['Event_ResetAnimation'] = function (...) end;
        ['Event_StartAnimation'] = function (...) end;
        ['Event_StopAnimation'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['DisableUsable'] = {
                    [02] = 'bool';
                };
                ['EnableUsable'] = {
                    [02] = 'bool';
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ModelLoad'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ModelUnload'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Ragdollize'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['ResetAnimation'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['StartAnimation'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['StopAnimation'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Used'] = {
                    [02] = 'bool';
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Break'] = 'int';
                ['DisableUsable'] = 'bool';
                ['EnableUsable'] = 'bool';
                ['Hide'] = 'bool';
                ['Ragdollized'] = 'bool';
                ['Remove'] = 'bool';
                ['UnHide'] = 'bool';
                ['Used'] = 'bool';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsRigidBody'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['LoadAndPhysicalizeModel'] = function (...) end;
        ['LoadModelOnDemand'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnFlowGraphAnimationEnd'] = function (...) end;
        ['OnFlowGraphAnimationStart'] = function (...) end;
        ['OnFlowGraphAnimationStop'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnObjectUnslaved'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSequenceAnimationStart'] = function (...) end;
        ['OnSequenceAnimationStop'] = function (...) end;
        ['OnSequenceStart'] = function (...) end;
        ['OnSequenceStop'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PHYSICALIZEAFTER_TIMER'] = 1;
        ['POSTQL_TIMER'] = 2;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['ActivatePhysicsDist'] = 50;
            ['ActivatePhysicsThreshold'] = 0;
            ['Animation'] = {
                ['Animation'] = 'Default';
                ['BlendTime'] = 0;
                ['Speed'] = 1;
                ['bAlwaysUpdate'] = false;
                ['bLoop'] = true;
                ['bPhysicalizeAfterAnimation'] = false;
                ['bPlaying'] = true;
                ['bResetOnUnslaved'] = false;
                ['playerAnimationState'] = '';
            };
            ['Cinematic'] = {
                ['bOnDemandModelLoad'] = false;
                ['bRenderAlways'] = false;
            };
            ['DmgFactorWhenCollidingAI'] = 1;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['Physics'] = {
                ['CollisionFiltering'] = {
                    ['collisionIgnore'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                    ['collisionType'] = {
                        ['bT_collision_class_articulated'] = 0;
                        ['bT_collision_class_living'] = 0;
                        ['bT_collision_class_particle'] = 0;
                        ['bT_collision_class_soft'] = 0;
                        ['bT_collision_class_terrain'] = 0;
                        ['bT_collision_class_wheeled'] = 0;
                        ['bT_gcc_ai'] = 0;
                        ['bT_gcc_animal'] = 0;
                        ['bT_gcc_decoy_projectile'] = 0;
                        ['bT_gcc_horse'] = 0;
                        ['bT_gcc_horse_bridle'] = 0;
                        ['bT_gcc_ignore_z_correction'] = 0;
                        ['bT_gcc_interactive'] = 0;
                        ['bT_gcc_item'] = 0;
                        ['bT_gcc_ledge'] = 0;
                        ['bT_gcc_npc_ignored_type'] = 0;
                        ['bT_gcc_npc_reported_type'] = 0;
                        ['bT_gcc_player_body'] = 0;
                        ['bT_gcc_player_capsule'] = 0;
                        ['bT_gcc_player_ghostable_type'] = 0;
                        ['bT_gcc_player_type'] = 0;
                        ['bT_gcc_ragdoll'] = 0;
                        ['bT_gcc_rigid'] = 0;
                        ['bT_gcc_vehicle'] = 0;
                    };
                };
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bArticulated'] = false;
                ['bBulletCollisionEnabled'] = true;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = false;
            };
            ['Script'] = {
                ['bDefaultOpen'] = false;
            };
            ['UseMessage'] = '';
            ['bCanTriggerAreas'] = false;
            ['bExcludeCover'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHeavyObject'] = false;
            ['bInteractLargeObject'] = false;
            ['bInteractiveCollisionClass'] = false;
            ['bMissionCritical'] = false;
            ['bNoFriendlyFire'] = false;
            ['bPickable'] = false;
            ['bSaved_by_game'] = true;
            ['bUpdateOnlyByScript'] = false;
            ['bUsable'] = false;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'objects/nature/vegetable/carrot_2.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['ResetOnUsed'] = function (...) end;
        ['RestorePhysicalState'] = function (...) end;
        ['SavePhysicalState'] = function (...) end;
        ['SendSyncToClient'] = function (...) end;
        ['Server'] = {
            ['OnPostInitClient'] = function (...) end;
            ['SVSync'] = function (...) end;
        };
        ['SetFromProperties'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetUpdatePolicyInternal'] = function (...) end;
        ['SetupModel'] = function (...) end;
        ['StartEntityAnimation'] = function (...) end;
        ['UnloadModel'] = function (...) end;
        ['__client_dispatch'] = {
            [01] = 'ClEvent_ResetAnimation:';
            [03] = 'ClEvent_StartAnimation:f';
            [02] = 'ClSync:fff';
            ['ClEvent_ResetAnimation'] = function (...) end;
            ['ClEvent_StartAnimation'] = function (...) end;
            ['ClSync'] = function (...) end;
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            [01] = 'SVSync:';
            ['SVSync'] = function (...) end;
            ['__validated'] = false;
        };
        ['__super'] = {
            ['Client'] = {
                ['ClEvent_ResetAnimation'] = function (...) end;
                ['ClEvent_StartAnimation'] = function (...) end;
                ['ClSync'] = function (...) end;
                ['OnLevelLoaded'] = function (...) end;
                ['OnPhysicsBreak'] = function (...) end;
                ['OnTimer'] = function (...) end;
            };
            ['CorrectTiming'] = function (...) end;
            ['DoStartAnimation'] = function (...) end;
            ['Editor'] = {
                ['Icon'] = 'animobject.bmp';
                ['IconOnTop'] = 0;
            };
            ['Event_DisableUsable'] = function (...) end;
            ['Event_EnableUsable'] = function (...) end;
            ['Event_Hide'] = function (...) end;
            ['Event_ModelLoad'] = function (...) end;
            ['Event_ModelUnload'] = function (...) end;
            ['Event_Ragdollize'] = function (...) end;
            ['Event_RagdollizeDerived'] = function (...) end;
            ['Event_Remove'] = function (...) end;
            ['Event_RenderAlwaysDisable'] = function (...) end;
            ['Event_RenderAlwaysEnable'] = function (...) end;
            ['Event_ResetAnimation'] = function (...) end;
            ['Event_StartAnimation'] = function (...) end;
            ['Event_StopAnimation'] = function (...) end;
            ['Event_UnHide'] = function (...) end;
            ['Event_Used'] = function (...) end;
            ['FlowEvents'] = {
                ['Inputs'] = {
                    ['DisableUsable'] = {
                        [02] = 'bool';
                    };
                    ['EnableUsable'] = {
                        [02] = 'bool';
                    };
                    ['Hide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['ModelLoad'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['ModelUnload'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Ragdollize'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Remove'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['ResetAnimation'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['StartAnimation'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['StopAnimation'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['UnHide'] = {
                        [02] = 'bool';
                        [01] = function (...) end;
                    };
                    ['Used'] = {
                        [02] = 'bool';
                    };
                };
                ['Outputs'] = {
                    ['Activate'] = 'bool';
                    ['Break'] = 'int';
                    ['DisableUsable'] = 'bool';
                    ['EnableUsable'] = 'bool';
                    ['Hide'] = 'bool';
                    ['Ragdollized'] = 'bool';
                    ['Remove'] = 'bool';
                    ['UnHide'] = 'bool';
                    ['Used'] = 'bool';
                };
            };
            ['GetUsableMessage'] = function (...) end;
            ['IsRigidBody'] = function (...) end;
            ['IsUsable'] = function (...) end;
            ['LoadAndPhysicalizeModel'] = function (...) end;
            ['LoadModelOnDemand'] = function (...) end;
            ['NeedSerialize'] = function (...) end;
            ['OnEnablePhysics'] = function (...) end;
            ['OnFlowGraphAnimationEnd'] = function (...) end;
            ['OnFlowGraphAnimationStart'] = function (...) end;
            ['OnFlowGraphAnimationStop'] = function (...) end;
            ['OnLoad'] = function (...) end;
            ['OnObjectUnslaved'] = function (...) end;
            ['OnPropertyChange'] = function (...) end;
            ['OnReset'] = function (...) end;
            ['OnSave'] = function (...) end;
            ['OnSequenceAnimationStart'] = function (...) end;
            ['OnSequenceAnimationStop'] = function (...) end;
            ['OnSequenceStart'] = function (...) end;
            ['OnSequenceStop'] = function (...) end;
            ['OnSpawn'] = function (...) end;
            ['OnUsed'] = function (...) end;
            ['PHYSICALIZEAFTER_TIMER'] = 1;
            ['POSTQL_TIMER'] = 2;
            ['PhysicalizeThis'] = function (...) end;
            ['Properties'] = {
                ['ActivatePhysicsDist'] = 50;
                ['ActivatePhysicsThreshold'] = 0;
                ['Animation'] = {
                    ['Animation'] = 'Default';
                    ['BlendTime'] = 0;
                    ['Speed'] = 1;
                    ['bAlwaysUpdate'] = false;
                    ['bLoop'] = true;
                    ['bPhysicalizeAfterAnimation'] = false;
                    ['bPlaying'] = true;
                    ['bResetOnUnslaved'] = false;
                    ['playerAnimationState'] = '';
                };
                ['Cinematic'] = {
                    ['bOnDemandModelLoad'] = false;
                    ['bRenderAlways'] = false;
                };
                ['DmgFactorWhenCollidingAI'] = 1;
                ['MultiplayerOptions'] = {
                    ['bNetworked'] = false;
                };
                ['Physics'] = {
                    ['CollisionFiltering'] = {
                        ['collisionIgnore'] = {
                            ['bT_collision_class_articulated'] = 0;
                            ['bT_collision_class_living'] = 0;
                            ['bT_collision_class_particle'] = 0;
                            ['bT_collision_class_soft'] = 0;
                            ['bT_collision_class_terrain'] = 0;
                            ['bT_collision_class_wheeled'] = 0;
                            ['bT_gcc_ai'] = 0;
                            ['bT_gcc_animal'] = 0;
                            ['bT_gcc_decoy_projectile'] = 0;
                            ['bT_gcc_horse'] = 0;
                            ['bT_gcc_horse_bridle'] = 0;
                            ['bT_gcc_ignore_z_correction'] = 0;
                            ['bT_gcc_interactive'] = 0;
                            ['bT_gcc_item'] = 0;
                            ['bT_gcc_ledge'] = 0;
                            ['bT_gcc_npc_ignored_type'] = 0;
                            ['bT_gcc_npc_reported_type'] = 0;
                            ['bT_gcc_player_body'] = 0;
                            ['bT_gcc_player_capsule'] = 0;
                            ['bT_gcc_player_ghostable_type'] = 0;
                            ['bT_gcc_player_type'] = 0;
                            ['bT_gcc_ragdoll'] = 0;
                            ['bT_gcc_rigid'] = 0;
                            ['bT_gcc_vehicle'] = 0;
                        };
                        ['collisionType'] = {
                            ['bT_collision_class_articulated'] = 0;
                            ['bT_collision_class_living'] = 0;
                            ['bT_collision_class_particle'] = 0;
                            ['bT_collision_class_soft'] = 0;
                            ['bT_collision_class_terrain'] = 0;
                            ['bT_collision_class_wheeled'] = 0;
                            ['bT_gcc_ai'] = 0;
                            ['bT_gcc_animal'] = 0;
                            ['bT_gcc_decoy_projectile'] = 0;
                            ['bT_gcc_horse'] = 0;
                            ['bT_gcc_horse_bridle'] = 0;
                            ['bT_gcc_ignore_z_correction'] = 0;
                            ['bT_gcc_interactive'] = 0;
                            ['bT_gcc_item'] = 0;
                            ['bT_gcc_ledge'] = 0;
                            ['bT_gcc_npc_ignored_type'] = 0;
                            ['bT_gcc_npc_reported_type'] = 0;
                            ['bT_gcc_player_body'] = 0;
                            ['bT_gcc_player_capsule'] = 0;
                            ['bT_gcc_player_ghostable_type'] = 0;
                            ['bT_gcc_player_type'] = 0;
                            ['bT_gcc_ragdoll'] = 0;
                            ['bT_gcc_rigid'] = 0;
                            ['bT_gcc_vehicle'] = 0;
                        };
                    };
                    ['Density'] = -1;
                    ['Mass'] = -1;
                    ['bArticulated'] = false;
                    ['bBulletCollisionEnabled'] = true;
                    ['bPhysicalize'] = true;
                    ['bPushableByPlayers'] = false;
                    ['bRigidBody'] = false;
                };
                ['Rendering'] = {
                    ['bWrinkleMap'] = false;
                };
                ['Script'] = {
                    ['bDefaultOpen'] = false;
                };
                ['UseMessage'] = '';
                ['bCanTriggerAreas'] = false;
                ['bExcludeCover'] = false;
                ['bExported_to_game'] = true;
                ['bExported_to_test'] = true;
                ['bHeavyObject'] = false;
                ['bInteractLargeObject'] = false;
                ['bInteractiveCollisionClass'] = false;
                ['bMissionCritical'] = false;
                ['bNoFriendlyFire'] = false;
                ['bPickable'] = false;
                ['bSaved_by_game'] = true;
                ['bUpdateOnlyByScript'] = false;
                ['bUsable'] = false;
                ['guidSmartObjectType'] = '';
                ['object_Model'] = 'objects/props/maritime/windsock/windsock.cga';
                ['sWH_AI_EntityCategory'] = '';
                ['soclass_SmartObjectHelpers'] = '';
                ['soclasses_SmartObjectClass'] = '';
            };
            ['ResetOnUsed'] = function (...) end;
            ['RestorePhysicalState'] = function (...) end;
            ['SavePhysicalState'] = function (...) end;
            ['SendSyncToClient'] = function (...) end;
            ['Server'] = {
                ['OnPostInitClient'] = function (...) end;
                ['SVSync'] = function (...) end;
            };
            ['SetFromProperties'] = function (...) end;
            ['SetInteractiveCollisionType'] = function (...) end;
            ['SetUpdatePolicyInternal'] = function (...) end;
            ['SetupModel'] = function (...) end;
            ['StartEntityAnimation'] = function (...) end;
            ['UnloadModel'] = function (...) end;
            ['__client_dispatch'] = {
                [02] = 'ClSync:fff';
                [01] = 'ClEvent_ResetAnimation:';
                [03] = 'ClEvent_StartAnimation:f';
                ['ClEvent_ResetAnimation'] = function (...) end;
                ['ClEvent_StartAnimation'] = function (...) end;
                ['ClSync'] = function (...) end;
                ['__validated'] = false;
            };
            ['__server_dispatch'] = {
                [01] = 'SVSync:';
                ['SVSync'] = function (...) end;
                ['__validated'] = false;
            };
        };
    };
    PositioningAreaShape = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['type'] = 'PositioningAreaShape';
    };
    PrecacheCamera = {
        ['Editor'] = {
            ['Icon'] = 'PrecacheCamera.bmp';
        };
        ['OnSpawn'] = function (...) end;
    };
    PredefinedNavigationPath = {
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['sWH_AI_EntityCategory'] = '';
        };
        ['type'] = 'PredefinedNavigationPath';
    };
    PrefabPort = {
        ['Editor'] = {
            ['Icon'] = 'PrefabPort/defaultIn.bmp';
        };
        ['Properties'] = {
            ['esForwardedLinkName'] = 'Merged';
            ['esPrefabPort_Icon'] = '_default';
            ['esPrefabPort_Type'] = 'In';
        };
        ['noGameObject'] = 1;
    };
    PresetSettings = {
        ['Bats'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = 'a_o_netopyr_idle';
                        ['snd_scared'] = 'a_o_netopyr_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.bats';
                        ['bIgnoreDaytimeCheck'] = true;
                        ['esBirdsTakeoffType'] = 'TowardsPlayer';
                        ['fMaxRandomSpread'] = 45;
                        ['fSpeedScale'] = 1.5;
                        ['iCooldownSeconds'] = 600;
                    };
                };
            };
        };
        ['Buzzard_takeoff_only'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = '';
                        ['snd_scared'] = 'a_o_kane_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.bird_big_single';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 180;
                        ['fSpeedScale'] = 3;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['Crows'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = 'a_o_kavka_idle';
                        ['snd_scared'] = 'a_o_kavka_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.crows_tree';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 90;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['Crows_no_sound'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = '';
                        ['snd_scared'] = '';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.crows';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 180;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['Crows_static_angle'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = '';
                        ['snd_scared'] = '';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.birds_small_tree';
                        ['esBirdsTakeoffType'] = 'StaticAngle';
                        ['fMaxRandomSpread'] = 0;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['Crows_takeoff_only'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = 'a_o_kavka_idle';
                        ['snd_scared'] = 'a_o_kavka_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.crows';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 180;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['Nightjar'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = 'a_o_lelek_idle';
                        ['snd_scared'] = 'a_o_lelek_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.birds_small_tree';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 45;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['None'] = {
        };
        ['Nuthatchs'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = 'a_o_brhlik_idle';
                        ['snd_scared'] = 'a_o_brhlik_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.birds_small_tree';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 45;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
        ['Starlings'] = {
            ['Properties'] = {
                ['Settings'] = {
                    ['Audio'] = {
                        ['snd_idle'] = 'a_o_spacek_idle';
                        ['snd_scared'] = 'a_o_spacek_scared';
                    };
                    ['ManualValues'] = {
                        ['ParticleEffect'] = 'WH_Particels.other.birds_small_tree';
                        ['esBirdsTakeoffType'] = 'AwayFromPlayer';
                        ['fMaxRandomSpread'] = 45;
                        ['fSpeedScale'] = 2.5;
                        ['iCooldownSeconds'] = 300;
                    };
                };
            };
        };
    };
    PressurizedObject = {
        ['CacheResources'] = function (...) end;
        ['CheckDamage'] = function (...) end;
        ['ClearLeaks'] = function (...) end;
        ['Client'] = {
            ['AddLeak'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnUpdate'] = function (...) end;
        };
        ['Event_Dead'] = function (...) end;
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Hit'] = function (...) end;
        ['Event_MakeInvulnerable'] = function (...) end;
        ['Event_MakeVulnerable'] = function (...) end;
        ['Event_ResetHealth'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hit'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['MakeInvulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['MakeVulnerable'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['ResetHealth'] = {
                    [01] = function (...) end;
                    [02] = 'any';
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Dead'] = 'bool';
                ['Health'] = 'float';
                ['Hide'] = 'bool';
                ['Hit'] = 'bool';
                ['Scanned'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['GetHealthRatio'] = function (...) end;
        ['GetMaxHealth'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['HasBeenScanned'] = function (...) end;
        ['IsDead'] = function (...) end;
        ['IsInvulnerable'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['DamageMultipliers'] = {
                ['fBullet'] = 1;
                ['fCollision'] = 1;
            };
            ['Health'] = {
                ['MaxHealth'] = 500;
                ['bInvulnerable'] = false;
                ['bOnlyEnemyFire'] = true;
            };
            ['Leak'] = {
                ['Damage'] = 100;
                ['DamageHitType'] = 'fire';
                ['DamageRange'] = 3;
                ['Effect'] = {
                    ['AttachForm'] = 'none';
                    ['AttachType'] = 'none';
                    ['CountScale'] = 1;
                    ['ParticleEffect'] = 'smoke_and_fire.geysir.intense_steam_small';
                    ['PulsePeriod'] = 0;
                    ['Scale'] = 1;
                    ['bCountPerUnit'] = false;
                    ['bPrime'] = true;
                    ['bSizePerUnit'] = 0;
                };
                ['ImpulseScale'] = 1;
                ['MaxLeaks'] = 10;
                ['Pressure'] = 1000;
                ['PressureDecay'] = 10;
                ['PressureImpulse'] = 100;
                ['Volume'] = 10;
                ['VolumeDecay'] = 1;
            };
            ['PhysicsBuoyancy'] = {
                ['water_damping'] = 1.5;
                ['water_density'] = 1;
                ['water_resistance'] = 0;
            };
            ['PhysicsSimulation'] = {
                ['damping'] = 0;
                ['max_time_step'] = 0.01;
                ['sleep_speed'] = 0.04;
            };
            ['TacticalInfo'] = {
                ['LookupName'] = '';
                ['bScannable'] = 0;
            };
            ['UseMessage'] = '';
            ['Vulnerability'] = {
                ['bBullet'] = 1;
                ['bCollision'] = 1;
                ['bExplosion'] = 1;
                ['bMelee'] = 1;
                ['bOther'] = 1;
            };
            ['bAutoGenAIHidePts'] = 0;
            ['bCanBreakOthers'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractLargeObject'] = false;
            ['bPickable'] = false;
            ['bPlayerOnly'] = 1;
            ['bPushableByPlayers'] = false;
            ['bResting'] = 1;
            ['bRigidBody'] = false;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
            ['esFaction'] = '';
            ['fDamageTreshold'] = 0;
            ['fDensity'] = 1000;
            ['fMass'] = 10;
            ['objModel'] = 'objects/library/props/fire extinguisher/fire_extinguisher.cgf';
        };
        ['RegisterWithAI'] = function (...) end;
        ['ResetOnUsed'] = function (...) end;
        ['Server'] = {
            ['OnHit'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['OnUpdate'] = function (...) end;
        };
        ['SetInvulnerability'] = function (...) end;
        ['SetupHealthProperties'] = function (...) end;
        ['StartLeaking'] = function (...) end;
        ['StopLeaking'] = function (...) end;
        ['UpdateLeak'] = function (...) end;
        ['UpdateLeaks'] = function (...) end;
        ['__client_dispatch'] = {
            [01] = 'AddLeak:VV';
            ['AddLeak'] = function (...) end;
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            ['__validated'] = false;
        };
    };
    PrismObject = {
        ['Create'] = function (...) end;
        ['Delete'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Clouds.bmp';
            ['Model'] = 'Editor/Objects/Particles.cgf';
        };
        ['Event_Hide'] = function (...) end;
        ['Event_Show'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Show'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hide'] = 'bool';
                ['Show'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['type'] = 'PrismObject';
    };
    ProximityTrigger = {
        ['CanTrigger'] = function (...) end;
        ['CheckAIDeaths'] = function (...) end;
        ['Client'] = {
            ['ClEnter'] = function (...) end;
            ['ClLeave'] = function (...) end;
            ['OnEnterArea'] = function (...) end;
            ['OnLeaveArea'] = function (...) end;
            ['OnTimer'] = function (...) end;
        };
        ['CreateAIDeathsCheckTrigger'] = function (...) end;
        ['CreateTimer'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
            ['IsRotatable'] = false;
            ['IsScalable'] = false;
            ['Model'] = 'Editor/Objects/T.cgf';
            ['ShowBounds'] = 1;
        };
        ['Enable'] = function (...) end;
        ['EnteredArea'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_Enter'] = function (...) end;
        ['Event_Leave'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enter'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Leave'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
                ['Enter'] = 'entity';
                ['Faction'] = 'string';
                ['Leave'] = 'entity';
                ['NrOfEntitiesInside'] = 'int';
                ['Sender'] = 'entity';
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['LeftArea'] = function (...) end;
        ['LockUsability'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['DimX'] = 5;
            ['DimY'] = 5;
            ['DimZ'] = 5;
            ['EnterDelay'] = 0;
            ['ExitDelay'] = 0;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
                ['bPerPlayer'] = 0;
            };
            ['OnlySelectedEntity'] = 'None';
            ['PlaySequence'] = '';
            ['ScriptCommand'] = '';
            ['UsableMessage'] = '';
            ['bActivateWithUseButton'] = 0;
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInVehicleOnly'] = 0;
            ['bOnlyAI'] = 0;
            ['bOnlyMyPlayer'] = 0;
            ['bOnlyOneEntity'] = 0;
            ['bOnlyPlayer'] = 1;
            ['bOnlySpecialAI'] = 0;
            ['bRemoveOnTrigger'] = 0;
            ['bSaved_by_game'] = true;
            ['bTriggerOnce'] = 0;
            ['esFactionFilter'] = '';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['Server'] = {
            ['OnEnterArea'] = function (...) end;
            ['OnLeaveArea'] = function (...) end;
            ['OnTimer'] = function (...) end;
            ['SvRequestUse'] = function (...) end;
        };
        ['Trigger'] = function (...) end;
        ['__client_dispatch'] = {
            [02] = 'ClLeave:Eb';
            [01] = 'ClEnter:Eb';
            ['ClEnter'] = function (...) end;
            ['ClLeave'] = function (...) end;
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            [01] = 'SvRequestUse:E';
            ['SvRequestUse'] = function (...) end;
            ['__validated'] = false;
        };
    };
    Rain = {
        ['Editor'] = {
            ['Icon'] = 'shake.bmp';
        };
        ['Event_Amount'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Amount'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['Properties'] = {
            ['bDisableOcclusion'] = false;
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIgnoreVisareas'] = false;
            ['bSaved_by_game'] = true;
            ['clrColor'] = {
                ['x'] = 1;
                ['y'] = 1;
                ['z'] = 1;
            };
            ['fAmount'] = 1;
            ['fDiffuseDarkening'] = 0.5;
            ['fFakeGlossiness'] = 0.5;
            ['fFakeReflectionsAmount'] = 1.5;
            ['fMistAmount'] = 3;
            ['fMistHeight'] = 8;
            ['fPuddlesAmount'] = 1.5;
            ['fPuddlesMaskAmount'] = 1;
            ['fPuddlesRippleAmount'] = 2;
            ['fRadius'] = 10000;
            ['fRainDropsAmount'] = 0.5;
            ['fRainDropsLighting'] = 1;
            ['fRainDropsSpeed'] = 1;
            ['fSplashesAmount'] = 1.3;
        };
        ['type'] = 'Rain';
    };
    RandomEvent = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['fDespawnDistance'] = 100;
            ['gpGameProfile'] = '';
            ['nRandomEventDBId'] = 0;
        };
    };
    RandomEventPlace = {
        ['Editor'] = {
            ['Icon'] = 'RandomEventPlace.bmp';
        };
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    Raptors = {
        ['Animations'] = {
            [08] = 'hen_run_fwd';
            [01] = 'hen_walk_fwd';
            [04] = 'hen_idle_03_eating';
            [06] = 'throw';
            [02] = 'hen_idle_01_look_around';
            [03] = 'hen_idle_02_look_around';
            [07] = 'rooster_crowing';
            [05] = 'pickup';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['GetFlockType'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['SpecialModel'] = 'objects/characters/animals/hen_v2/hen_raptor.cdf';
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '18ff9093-2cc4-4ab3-9f34-7cb0dd7cd30a';
                ['nCount'] = 10;
                ['object_Model'] = 'objects/characters/animals/hen_v2/hen_raptor.cdf';
                ['object_Model1'] = 'objects/characters/animals/hen_v2/hen_raptor.cdf';
                ['object_Model2'] = 'objects/characters/animals/hen_v2/hen_raptor.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 20;
                ['AttractDistMin'] = 5;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 1;
                ['FactorSeparation'] = 1;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = true;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 15;
                ['FactorHeight'] = 1;
                ['FactorOrigin'] = 0.3;
                ['HeightMax'] = 1;
                ['HeightMin'] = 0;
                ['IgnoreTerrainElevation'] = false;
                ['MaxAnimSpeed'] = 1;
                ['MaxDistFromOrigin'] = 30;
                ['SpeedMax'] = 0.55;
                ['SpeedMin'] = 0.55;
                ['SpeedScared'] = 0.8;
            };
            ['Options'] = {
                ['ActiveHoursBegin'] = 4;
                ['ActiveHoursEnd'] = 21;
                ['PickableMessage'] = '';
                ['Radius'] = 6;
                ['VisibilityDist'] = 40;
                ['bActivate'] = true;
                ['bAvoidWater'] = true;
                ['bDisableOnRain'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = true;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'def0005e-0000-0000-0000-def00000005e';
        };
        ['Sounds'] = {
            [01] = '';
            [03] = 'b_hen_death';
            [04] = 'c_torch_whoosh1';
            [02] = 'b_hen_scared';
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Boids';
    };
    Rats = {
        ['Animations'] = {
            [01] = 'rat_run';
            [03] = 'rat_idle_var01';
            [02] = 'rat_idle';
            [07] = '';
            [08] = 'rat_run_jump';
            [04] = 'rat_idle_var02';
            [06] = 'throw';
            [05] = 'pickup';
        };
        ['CreateFlock'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Bird.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['GetFlockType'] = function (...) end;
        ['MapVisMask'] = 0;
        ['OnInit'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Boid'] = {
                ['Mass'] = 10;
                ['bInvulnerable'] = false;
                ['gravity_at_death'] = '-9.81';
                ['guidItemSpawnedOnKill'] = '18ff9093-2cc4-4ab3-9f34-7cb0dd7cd30a';
                ['nCount'] = 3;
                ['object_Model'] = 'Objects/characters/animals/rat/rat.cdf';
            };
            ['Flocking'] = {
                ['AttractDistMax'] = 10;
                ['AttractDistMin'] = 0.1;
                ['FactorAlign'] = 1;
                ['FactorCohesion'] = 1;
                ['FactorSeparation'] = 1;
                ['FieldOfViewAngle'] = 250;
                ['bEnableFlocking'] = true;
            };
            ['Movement'] = {
                ['FactorAvoidLand'] = 50000;
                ['FactorHeight'] = 10;
                ['FactorOrigin'] = 1e+08;
                ['HeightMax'] = 0;
                ['HeightMin'] = 0;
                ['IgnoreTerrainElevation'] = true;
                ['IgnoreWallsBehindPlayer'] = true;
                ['MaxAnimSpeed'] = 1;
                ['MaxDistFromOrigin'] = 10;
                ['RandomMovement'] = 1;
                ['RunAnimationSpeed'] = 2.5;
                ['RunThreshold'] = 2.2;
                ['SpeedMax'] = 1.8;
                ['SpeedMin'] = 1.5;
                ['SpeedScared'] = 2.7;
                ['WalkAnimationSpeed'] = 2;
            };
            ['Options'] = {
                ['PickableMessage'] = '';
                ['Radius'] = 2;
                ['VisibilityDist'] = 20;
                ['bActivate'] = true;
                ['bAvoidWater'] = true;
                ['bFollowPlayer'] = false;
                ['bNoLanding'] = false;
                ['bObstacleAvoidance'] = true;
                ['bPickableWhenAlive'] = true;
                ['bPickableWhenDead'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['Sounds'] = {
            [02] = 'b_rat_scared';
            [01] = 'b_rat_idle';
            [03] = '';
        };
        ['params'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'Boids';
    };
    RecipesBook = {
        ['AnimClose'] = 'alchemy_close_book';
        ['AnimOpen'] = 'alchemy_place_book';
        ['AnimPageNext'] = 'alchemy_flip_alchemy_book_fwd';
        ['AnimPagePrev'] = 'alchemy_flip_alchemy_book_bwd';
        ['Editor'] = {
            ['Icon'] = 'ledge.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['GfxName'] = 'AlchemyBook';
        ['InteractorPriority'] = 2;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['Model'] = 'objects/characters/assets/book/book_01.cdf';
        ['OnEnablePhysics'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUse'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PageAnimationTransitionTime'] = 0.4;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['alchemy_type'] = 19;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHasHerbal'] = false;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['slot_name'] = 'dummy_alchemy_book';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['SubMtl'] = 'book01';
        ['SubMtlId'] = 1;
        ['TexSlot'] = 11;
        ['Use'] = function (...) end;
        ['bDoublePage'] = false;
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
        ['npcOnly'] = false;
    };
    RedDeerDoe = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 1.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_deerDoe_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_deerDoe_database.adb';
        ['CombatOpponentMnTag'] = 'oppDeer';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 0.8;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 0.8;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_DeerDoe';
                ['footstepEffect'] = 'footsteps_DeerDoe';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'red_deer_doe';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/red_deer/deer_doe.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.8;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0.88;
            };
            ['posCarcass'] = {
                ['x'] = '-0.1';
                ['y'] = '-0.1';
                ['z'] = 0.15;
            };
            ['radius'] = 0.22;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'RedDeerDoe';
        ['defaultSoulClass'] = 'red_deer_doe';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 30;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 30;
            ['stiffness_scale'] = 73;
        };
    };
    RedDeerStag = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceAgentMinRadius'] = 0.8;
            ['collisionAvoidanceAgentRadius'] = 1.25;
            ['collisionAvoidanceObstacleOffest'] = {
                ['x'] = 0;
                ['y'] = 0.3;
                ['z'] = 0;
            };
            ['collisionAvoidanceObstacleRadius'] = 0.5;
            ['collisionAvoidanceObstacleTravel'] = 0.8;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['collisionAvoidanceRagdollMode'] = 1;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 0.5;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_redDeer_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_redDeer_database.adb';
        ['CombatOpponentMnTag'] = 'oppDeer';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 0.8;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 0.8;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_RedDeer';
                ['footstepEffect'] = 'footsteps_RedDeer';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'red_deer_stag';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/red_deer/red_deer.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 1.3;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.2;
                ['z'] = 1.05;
            };
            ['posCarcass'] = {
                ['x'] = 0;
                ['y'] = 0.2;
                ['z'] = 0.2;
            };
            ['radius'] = 0.26;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'RedDeerStag';
        ['defaultSoulClass'] = 'red_deer_stag';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 30;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 30;
            ['stiffness_scale'] = 73;
        };
    };
    ReflexLight = {
        ['ActivateLight'] = function (...) end;
        ['CacheResources'] = function (...) end;
        ['Editor'] = {
            ['AbsoluteRadius'] = 1;
            ['IsScalable'] = false;
            ['ShowBounds'] = 0;
        };
        ['Event_Active'] = function (...) end;
        ['Event_DiffuseColor'] = function (...) end;
        ['Event_DiffuseMultiplier'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_Radius'] = function (...) end;
        ['Event_SpecularMultiplier'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Active'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['DiffuseColor'] = {
                    [02] = 'vec3';
                    [01] = function (...) end;
                };
                ['DiffuseMultiplier'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Radius'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['SpecularMultiplier'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Active'] = 'bool';
            };
        };
        ['LoadLightToSlot'] = function (...) end;
        ['NotifySwitchOnOffFromParent'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyAnimated'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSysSpecLightChanged'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['Properties'] = {
            ['Color'] = {
                ['clrDiffuse'] = {
                    ['x'] = 1;
                    ['y'] = 1;
                    ['z'] = 1;
                };
                ['fDiffuseMultiplier'] = 2;
                ['fGIMultiplier'] = 2;
                ['fSpecularMultiplier'] = 2;
                ['fToDMulWeight'] = 1;
                ['fVolumetricMultiplier'] = 0.012;
            };
            ['Options'] = {
                ['bAffectsThisAreaOnly'] = true;
                ['bAffectsVolumetricFogOnly'] = false;
                ['bAmbient'] = false;
                ['bDeferredClipBounds'] = false;
                ['bFakeLight'] = false;
                ['bIgnoresVisAreas'] = false;
                ['bVolumetricFog'] = true;
                ['esGIMode'] = 'StaticLight';
                ['fFogRadialLobe'] = 0;
                ['fVerticalClipDistanceDownward'] = 5;
                ['fVerticalClipDistanceUpward'] = 5;
                ['file_deferred_clip_geom'] = '';
            };
            ['Projector'] = {
                ['fProjectorFov'] = 90;
                ['fProjectorNearPlane'] = 0.02;
                ['texture_Texture'] = '';
            };
            ['Radius'] = 10;
            ['Shadows'] = {
                ['bDisableShadowCutoff'] = false;
                ['fShadowAutoBiasScale'] = 1;
                ['fShadowBias'] = 1;
                ['fShadowJitterWH'] = 0;
                ['fShadowResolutionScale'] = 1;
                ['fShadowSlopeBias'] = 1;
                ['fShadowUpdateMinRadius'] = 10;
                ['fShadowUpdateRatio'] = 1;
                ['nCastShadows'] = 4;
                ['nShadowMinResPercent'] = 0;
            };
            ['Shape'] = {
                ['bAreaLight'] = true;
                ['bAreaPhysicalAttenuation'] = true;
                ['fFadeInRadius'] = 0.35;
                ['fNearClip'] = 0;
                ['fPlaneHeight'] = 1;
                ['fPlaneWidth'] = 1;
                ['fWallChamferHorizontal'] = 0;
                ['fWallChamferVertical'] = 0;
                ['fWallThickness'] = 0.2;
                ['fWindowMarginHorizontal'] = 0;
                ['fWindowMarginVertical'] = 0;
                ['vFadeDimensionsBottom'] = 0;
                ['vFadeDimensionsFar'] = 0;
                ['vFadeDimensionsLeft'] = 0;
                ['vFadeDimensionsNear'] = 0;
                ['vFadeDimensionsRight'] = 0;
                ['vFadeDimensionsTop'] = 0;
            };
            ['ToDData'] = {
                ['T00'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T01'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T02'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T03'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T04'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T05'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T06'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T07'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T08'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T09'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T10'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
                ['T11'] = {
                    ['clrColor'] = {
                        ['x'] = 1;
                        ['y'] = 1;
                        ['z'] = 1;
                    };
                    ['fMult'] = 1;
                };
            };
            ['bActive'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['fAttenuationBulbSize'] = 0.7;
        };
    };
    RigidBody = {
        ['Editor'] = {
            ['Icon'] = 'physicsobject.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Activate'] = function (...) end;
        ['Event_AddImpulse'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_OnTouch'] = function (...) end;
        ['Event_Show'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['AddImpulse'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['OnTouch'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Show'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['AddImpulse'] = 'bool';
                ['Hide'] = 'bool';
                ['OnTouch'] = 'bool';
                ['Show'] = 'bool';
            };
        };
        ['MapVisMask'] = 0;
        ['OnContact'] = function (...) end;
        ['OnDamage'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['OnUpdate'] = function (...) end;
        ['PhysParams'] = {
            ['density'] = 0;
            ['mass'] = 0;
        };
        ['Properties'] = {
            ['Density'] = 5000;
            ['Impulse'] = {
                ['X'] = 0;
                ['Y'] = 0;
                ['Z'] = 0;
            };
            ['Mass'] = 1;
            ['bActivateOnRocketDamage'] = 0;
            ['bAutoGenAIHidePts'] = 0;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bResting'] = 1;
            ['bRigidBodyActive'] = true;
            ['bSaved_by_game'] = true;
            ['bVisible'] = 1;
            ['damping'] = 0;
            ['max_time_step'] = 0.01;
            ['objModel'] = 'Objects/box.cgf';
            ['sleep_speed'] = 0.04;
            ['soclasses_SmartObjectClass'] = '';
            ['water_damping'] = 1.5;
            ['water_resistance'] = 0;
        };
        ['gravityUpdate'] = 0;
        ['temp_vec'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
        ['type'] = 'RigidBody';
        ['updateTime'] = 500;
    };
    RoeDeerBuck = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 1.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_roebuck_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_roebuck_database.adb';
        ['CombatOpponentMnTag'] = 'oppRoebuck';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 0.8;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 0.8;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['bFootstepGearEffect'] = true;
                ['foleyEffect'] = 'foley_Roebuck';
                ['footstepEffect'] = 'footsteps_Roebuck';
                ['footstepIndGearAudioSignal_Run'] = '';
                ['footstepIndGearAudioSignal_Walk'] = '';
                ['remoteFootstepEffect'] = 'footsteps_Roebuck';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'roe_deer_buck';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/roebuck/roebuck.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.6;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0.65;
            };
            ['posCarcass'] = {
                ['x'] = '-0.05';
                ['y'] = '-0.15';
                ['z'] = 0.15;
            };
            ['radius'] = 0.15;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'RoeDeerBuck';
        ['defaultSoulClass'] = 'roe_deer_buck';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 30;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 30;
            ['stiffness_scale'] = 73;
        };
    };
    RoeDeerHind = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['passRadius'] = 1.25;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_roebuck_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_roebuck_database.adb';
        ['CombatOpponentMnTag'] = 'oppRoebuck';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 0;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 0.8;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 0.8;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Roebuck';
                ['footstepEffect'] = 'footsteps_Roebuck';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'roe_deer_hind';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/roebuck/roebuck.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.6;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0.65;
            };
            ['posCarcass'] = {
                ['x'] = '-0.05';
                ['y'] = '-0.15';
                ['z'] = 0.15;
            };
            ['radius'] = 0.15;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'RoeDeerHind';
        ['defaultSoulClass'] = 'roe_deer_hind';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 30;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 30;
            ['stiffness_scale'] = 73;
        };
    };
    RopeEntity = {
        ['Event_BreakEnd'] = function (...) end;
        ['Event_BreakStart'] = function (...) end;
        ['Event_GetLength'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Length'] = function (...) end;
        ['Event_MaxForce'] = function (...) end;
        ['Event_PhysIdEnd'] = function (...) end;
        ['Event_PhysIdStart'] = function (...) end;
        ['Event_PtEnd'] = function (...) end;
        ['Event_PtStart'] = function (...) end;
        ['Event_Radius'] = function (...) end;
        ['Event_Remove'] = function (...) end;
        ['Event_SegCount'] = function (...) end;
        ['Event_SleepSpeed'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['BreakEnd'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['BreakStart'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['GetLength'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Length'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['MaxForce'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['PhysIdEnd'] = {
                    [02] = 'int';
                    [01] = function (...) end;
                };
                ['PhysIdStart'] = {
                    [02] = 'int';
                    [01] = function (...) end;
                };
                ['PtEnd'] = {
                    [02] = 'Vec3';
                    [01] = function (...) end;
                };
                ['PtStart'] = {
                    [02] = 'Vec3';
                    [01] = function (...) end;
                };
                ['Radius'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['Remove'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['SegCount'] = {
                    [02] = 'int';
                    [01] = function (...) end;
                };
                ['SleepSpeed'] = {
                    [02] = 'float';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Break'] = 'int';
                ['Hide'] = 'bool';
                ['Length'] = 'float';
                ['Remove'] = 'bool';
                ['Strained'] = 'bool';
                ['UnHide'] = 'bool';
            };
        };
        ['OnPhysicsBreak'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
        };
    };
    RuntimePrefab = {
        ['CreateOnLoad'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'RuntimePrefab.bmp';
            ['ShowBounds'] = 1;
        };
        ['OnDestroy'] = function (...) end;
        ['OnHidden'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnMove'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUnHidden'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['guidPrefabTemplate'] = 0;
            ['nMaxSpawn'] = 0;
        };
        ['Reset'] = function (...) end;
        ['Spawn'] = function (...) end;
        ['type'] = 'RuntimePrefab';
    };
    RuntimePrefabAutoPhase = {
        ['Editor'] = {
            ['Icon'] = 'RuntimePrefabAutoPhase.bmp';
            ['ShowBounds'] = 1;
        };
        ['Properties'] = {
            ['bChangeWhenVisible'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esAutoPhaseChangeCategory'] = 'fireplace_burning';
            ['sAutoPhaseChangeTimeOfDayPhases'] = '(5h,1);(21h,2)';
            ['sAutoPhaseChangeWorldTimeDelayStdDev'] = '30m';
        };
        ['type'] = 'RuntimePrefabAutoPhase';
    };
    SO_ActionSettings = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['CameraLimitHorizontal'] = 75;
            ['CameraLimitVerticalMax'] = 70;
            ['CameraLimitVerticalMin'] = -75;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = '5d76491c-c52a-42cf-ba9c-4dbdd35d475a';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    SO_AnimationAndBark = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['Animation'] = {
                ['sAnimationFragment'] = '';
                ['sAnimationTags'] = '';
            };
            ['Bark'] = {
                ['sAlias'] = '';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    SO_CheeringSpot_Leaning = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['GetGenderVariantLimit'] = function (...) end;
        ['GetVariantData'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CheeringSpot'] = {
                ['bDisable_Force_Look'] = false;
                ['esCheeringSpot_Leaning_Variant'] = 'random';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
    };
    SO_CheeringSpot_Standing = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['GetGenderVariantLimit'] = function (...) end;
        ['GetVariantData'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CheeringSpot'] = {
                ['bDisable_Force_Look'] = false;
                ['esCheeringSpot_Standing_Variant'] = 'random';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
    };
    SO_DeadBody_Horse = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fHead'] = 0;
                    ['fLegs'] = 0;
                    ['fTorso'] = 0;
                };
                ['bRagdollOnly'] = false;
                ['esDeadBody_Horse_Variant'] = 'horse_lyingOnLeftSide_01';
                ['fAddDirt'] = 0;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
    };
    SO_DeadBody_Human = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fArm_left'] = 0;
                    ['fArm_right'] = 0;
                    ['fHead'] = 0;
                    ['fLeg_left'] = 0;
                    ['fLeg_right'] = 0;
                    ['fTorso'] = 0;
                };
                ['bLootableByPlayer'] = true;
                ['bPickableByPlayer'] = true;
                ['bRagdollOnly'] = false;
                ['bRagdollOnly_DontPosition'] = false;
                ['esDeadBody_Human_Variant'] = 'male_lyingOnBack_01';
                ['fAddDirt'] = 0;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
    };
    SO_DeadBody_Human_Hanged = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fArm_left'] = 0;
                    ['fArm_right'] = 0;
                    ['fHead'] = 0;
                    ['fLeg_left'] = 0;
                    ['fLeg_right'] = 0;
                    ['fTorso'] = 0;
                };
                ['bLootableByPlayer'] = true;
                ['bPickableByPlayer'] = false;
                ['bRagdollOnly'] = false;
                ['bRagdollOnly_DontPosition'] = false;
                ['esDeadBody_Human_Hanged_Variant'] = 'male_hanged_01';
                ['fAddDirt'] = 0;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
        ['useItem_left'] = false;
    };
    SO_DeadBody_Human_Interactable = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fArm_left'] = 0;
                    ['fArm_right'] = 0;
                    ['fHead'] = 0;
                    ['fLeg_left'] = 0;
                    ['fLeg_right'] = 0;
                    ['fTorso'] = 0;
                };
                ['bAlwaysFastForwardIntoInteracting'] = true;
                ['bLootableByPlayer'] = true;
                ['bPickableByPlayer'] = false;
                ['bRagdollOnly'] = false;
                ['bRagdollOnly_DontPosition'] = false;
                ['esDeadBody_Human_Interactable_Variant'] = 'male_looting_male_lyingOnBack_01';
                ['fAddDirt'] = 0;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['sequenceName'] = '';
        ['unstanceName'] = '';
        ['unstanceName_beingInteracted'] = 'deadBody_male_looting_male_lyingOnBack_01_beingInteracted';
        ['unstanceName_interactant'] = 'deadBody_male_looting_male_lyingOnBack_01_interactant';
    };
    SO_DeadBody_WolfDog = {
        ['ApplyDirtAndBlood'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'DeadBody.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['DeadBody'] = {
                ['AddBlood'] = {
                    ['fTorso'] = 0;
                };
                ['esDeadBody_WolfDog_Variant'] = 'wolfDog_lyingOnRightSide_01';
                ['fAddDirt'] = 0;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['unstanceName'] = '';
    };
    SO_DiggingSpot = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['DiggingSpot'] = {
                ['bGetShovelFromInventory'] = false;
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    SO_HostageSituation = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetAnimationSet'] = function (...) end;
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['HostageSituation'] = {
                ['esHostageSituation_Variant'] = 'maleHoldsFemale';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['useRealWeapon'] = true;
    };
    SO_LeaningRail = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['LeaningRail'] = {
                ['esLeaningRail_Variant'] = 'LeaningRail1';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['unstanceName'] = 'leaningRail1';
    };
    SO_LyingHarmed = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['LyingHarmed'] = {
                ['esLyingHarmedPose'] = 'male_lyingWounded_01';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['unstanceName'] = 'lyingWounded_01';
    };
    SO_LyingHarmed_Healing = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['LyingHarmed_Healing'] = {
                ['esLyingHarmed_Healing_Variant'] = 'male_lyingInjured_bed_low';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['unstanceName'] = 'lyingInjured_bedLow';
    };
    SO_LyingHarmed_Wounded = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['LyingHarmed_Wounded'] = {
                ['esLyingHarmed_Wounded_Variant'] = 'male_lyingWounded_01_bed_low';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['unstanceName'] = 'lyingWounded_01_bedLow';
    };
    SO_Party_Duo_Sitting = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Party'] = {
                ['esParty_Duo_Sitting_Variant'] = 'male_male_talkingAndDrinkingAndCheering_pickingCup_01';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['gesturesCount'] = 0;
        ['gesturesFragmentID_leader'] = 'Party_Duo_Sitting_TalkingAndDrinkingAndCheering_PickingCup_01_Gestures_Leader';
        ['gesturesFragmentID_minion'] = 'Party_Duo_Sitting_TalkingAndDrinkingAndCheering_PickingCup_01_Gestures_Minion';
        ['unstanceName_leader'] = 'party_duo_sitting_talkingAndDrinkingAndCheering_pickingCup_01_leader';
        ['unstanceName_minion'] = 'party_duo_sitting_talkingAndDrinkingAndCheering_pickingCup_01_minion';
    };
    SO_Party_Duo_Standing = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Party'] = {
                ['esParty_Duo_Standing_Variant'] = 'male_male_talking_01';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['__super'] = {
            ['Editor'] = {
                ['Icon'] = 'smartObjectHolder.bmp';
            };
            ['GetEditorModel'] = function (...) end;
            ['OnInit'] = function (...) end;
            ['Properties'] = {
                ['Script'] = {
                    ['Misc'] = '';
                };
                ['bExported_to_game'] = true;
                ['bExported_to_test'] = true;
                ['bNo_POI'] = false;
                ['bOwnedByHome'] = false;
                ['bPOI_discoverable_by_location'] = true;
                ['bSaved_by_game'] = false;
                ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
                ['object_editorModel'] = '';
                ['sWH_AI_EntityCategory'] = '';
                ['soclass_SmartObjectHelpers'] = '';
            };
        };
        ['gesturesCount'] = 0;
        ['gesturesFragmentID_leader'] = '';
        ['gesturesFragmentID_minion'] = '';
        ['holdingItem'] = false;
        ['unstanceName_leader'] = 'party_duo_standing_talking_01_leader';
        ['unstanceName_minion'] = 'party_duo_standing_talking_01_minion';
    };
    SO_Party_Lying = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Party'] = {
                ['esParty_Lying_Variant'] = 'male_drunk_resting_01';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['unstanceName'] = 'party_lying_drunk_resting_01';
    };
    SO_Party_Sitting = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Party'] = {
                ['esParty_Sitting_Variant'] = 'male_talking_01';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['unstanceName'] = 'party_sitting_talking_01';
    };
    SO_Party_Standing = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Party'] = {
                ['esParty_Standing_Variant'] = 'male_talking_01';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['holdingItem'] = false;
        ['unstanceName_female'] = 'party_standing_talking_01_female';
        ['unstanceName_male'] = 'party_standing_talking_01_male';
    };
    SO_SpecialSittingActivity = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['SpecialSittingActivity'] = {
                ['esSpecialSittingActivity_Variant'] = 'female_noTable_crying';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['unstanceName'] = 'specialSittingActivity_female_noTable_crying';
    };
    SO_Test_AnimationPreview = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['AnimationPreview'] = {
                ['bAligned'] = false;
                ['bSitting'] = false;
                ['sOneshot_Animation_Fragment'] = '';
                ['sOneshot_Animation_Tags'] = '';
                ['sUnstance_Name'] = '';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    SO_TrackviewMessage = {
        ['Editor'] = {
            ['Icon'] = 'trackviewMessage.bmp';
        };
        ['Event_DisableUsable'] = function (...) end;
        ['Event_EnableUsable'] = function (...) end;
        ['Event_SendAIMessage'] = function (...) end;
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['SendAIMessage'] = {
                    [02] = 'string';
                    [01] = function (...) end;
                };
            };
        };
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['EntityName'] = {
                ['esReceiverEntityName'] = '';
                ['esSecondaryParametr'] = '';
            };
            ['UseMessage'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['bUsable'] = false;
        };
        ['ResetOnUsed'] = function (...) end;
    };
    SO_WaitingSpot = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnEditorLayerLoaded'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['MovementDetails'] = {
                ['esMovementSpeed'] = 'b_Walk';
            };
            ['Script'] = {
                ['Misc'] = '';
            };
            ['WaitingSpot'] = {
                ['esWaitingSpot_Variant'] = 'male_armAkimbo';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['UpdateData'] = function (...) end;
        ['UpdateGhosts'] = function (...) end;
        ['movementSpeed'] = 'Walk';
        ['unstanceName_female'] = 'waiting_holdingArm';
        ['unstanceName_male'] = 'waiting_armAkimbo';
    };

    Script = {
        ['DumpLoadedScripts'] = function (...) end;
        ['KillTimer'] = function (...) end;
        ['LoadScript'] = function (...) end;
        ['ReloadEntityScript'] = function (...) end;
        ['ReloadScript'] = function (...) end;
        ['ReloadScripts'] = function (...) end;
        ['SetTimer'] = function (...) end;
        ['SetTimerForFunction'] = function (...) end;
        ['UnloadScript'] = function (...) end;
    };
    ScriptCommand = {
        ['Category'] = 'advanced';
        ['Implementation'] = function (...) end;
        ['Inputs'] = {
            [01] = {
                [01] = 't_Activate';
                [02] = 'bool';
            };
            [02] = {
                [01] = 'Command';
                [02] = 'string';
            };
        };
        ['Outputs'] = {
            [01] = {
                [01] = 'Done';
                [02] = 'bool';
            };
        };
    };
    ScriptLoader = {
        ['IsLuaScript'] = function (...) end;
        ['LoadFolder'] = function (...) end;
        ['LoadFromInclude'] = function (...) end;
        ['LoadScript'] = function (...) end;
        ['ShouldIgnore'] = function (...) end;
        ['ignoredPaths'] = {
            [01] = 'Scripts/Utils/ScriptLoader.lua';
        };
    };
    Sequence = {
        ['FreezeGame'] = function (...) end;
        ['UnfreezeGame'] = function (...) end;
    };
    SequenceArea = {
        ['Editor'] = {
            ['Icon'] = 'Sequencearea.bmp';
            ['IconOnTop'] = 1;
        };
        ['OnPropertyChange'] = function (...) end;
        ['Properties'] = {
            ['bCreate_Obstacle'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bHide_Actors'] = true;
            ['bHide_Items'] = true;
            ['bHide_Other_Entities'] = false;
            ['bSaved_by_game'] = false;
        };
        ['type'] = 'SequenceArea';
    };
    SequenceObject = {
        ['Editor'] = {
            ['Icon'] = 'sequence.bmp';
        };
        ['OnPropertyChange'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['bSaved_by_game'] = false;
    };
    SequenceTrigger = {
        ['BaseReportUse'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '';
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['Sequence'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    Set = {
        ['Add'] = function (...) end;
        ['Check'] = function (...) end;
        ['DeserializeEntities'] = function (...) end;
        ['DeserializeItems'] = function (...) end;
        ['DeserializeValues'] = function (...) end;
        ['Get'] = function (...) end;
        ['Merge'] = function (...) end;
        ['New'] = function (...) end;
        ['Remove'] = function (...) end;
        ['RemoveAll'] = function (...) end;
        ['SanityCheck'] = function (...) end;
        ['SerializeEntities'] = function (...) end;
        ['SerializeItems'] = function (...) end;
        ['SerializeValues'] = function (...) end;
        ['Set'] = function (...) end;
        ['Size'] = function (...) end;
        ['Test'] = function (...) end;
    };
    SetRPGProfile = function (...) end;
    SetupBribe = function (...) end;
    SetupHaggle = function (...) end;
    Sharpening = {
        ['DoStepOnGrindstone'] = function (...) end;
        ['GetTotalQuality'] = function (...) end;
        ['GetWheelSpeed'] = function (...) end;
        ['IsActive'] = function (...) end;
        ['MoveToWorstZone'] = function (...) end;
        ['SetGrindstone'] = function (...) end;
        ['SetOptimalRotation'] = function (...) end;
        ['SetPosition'] = function (...) end;
        ['SetPressure'] = function (...) end;
        ['SetRotation'] = function (...) end;
        ['SetWheelSpeed'] = function (...) end;
        ['Start'] = function (...) end;
        ['Stop'] = function (...) end;
    };
    SheepEwe = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/wh_sheep_controllerdefs.xml';
        ['ActorCanTalk'] = function (...) end;
        ['AddAnimalLootAction'] = function (...) end;
        ['AddLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/wh_sheep_database.adb';
        ['CombatOpponentMnTag'] = 'oppSheep';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetCanTalkHintType'] = function (...) end;
        ['GetChatActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnChat'] = function (...) end;
        ['OnChatOpen'] = function (...) end;
        ['OnChatRequestAccepted'] = function (...) end;
        ['OnChatWithFocus'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnFollow'] = function (...) end;
        ['OnGrabCorpse'] = function (...) end;
        ['OnHorsePullDown'] = function (...) end;
        ['OnKnockout'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMercyKill'] = function (...) end;
        ['OnPickpocketing'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStealthKill'] = function (...) end;
        ['OnTalk'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Sheep';
                ['footstepEffect'] = 'footsteps_Sheep';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'sheep_ewe';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/sheep/sheep_female.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.65;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.1;
                ['z'] = 0.55;
            };
            ['posCarcass'] = {
                ['x'] = 0.27;
                ['y'] = 0.1;
                ['z'] = 0.1;
            };
            ['radius'] = 0.25;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'SheepEwe';
        ['defaultSoulClass'] = 'sheep_ewe';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 100;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 100;
            ['stiffness_scale'] = 73;
        };
    };
    SheepRam = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/wh_sheep_controllerdefs.xml';
        ['ActorCanTalk'] = function (...) end;
        ['AddAnimalLootAction'] = function (...) end;
        ['AddLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/wh_sheep_database.adb';
        ['CombatOpponentMnTag'] = 'oppSheep';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['ForceUsable'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetCanTalkHintType'] = function (...) end;
        ['GetChatActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnChat'] = function (...) end;
        ['OnChatOpen'] = function (...) end;
        ['OnChatRequestAccepted'] = function (...) end;
        ['OnChatWithFocus'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnFollow'] = function (...) end;
        ['OnGrabCorpse'] = function (...) end;
        ['OnHorsePullDown'] = function (...) end;
        ['OnKnockout'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnLoot'] = function (...) end;
        ['OnMercyKill'] = function (...) end;
        ['OnPickpocketing'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnStealthKill'] = function (...) end;
        ['OnTalk'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Sheep';
                ['footstepEffect'] = 'footsteps_Sheep';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = false;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = true;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'sheep_ram';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/sheep/sheep_female.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.65;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.1;
                ['z'] = 0.55;
            };
            ['posCarcass'] = {
                ['x'] = 0.27;
                ['y'] = 0.1;
                ['z'] = 0.1;
            };
            ['radius'] = 0.25;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'SheepRam';
        ['defaultSoulClass'] = 'sheep_ram';
        ['gameParams'] = {
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.9;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.4;
                        ['y'] = 0.4;
                        ['z'] = 0.15;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.8;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.35;
                        ['y'] = 0;
                        ['z'] = 0.1;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0;
                        ['z'] = 1.1;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 13;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 100;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 100;
            ['stiffness_scale'] = 73;
        };
    };
    ShootingContest = {
        ['HideHorseShootingContestTable'] = function (...) end;
        ['HideShootingContestTable'] = function (...) end;
        ['ShowHorseShootingContestTable'] = function (...) end;
        ['ShowShootingContestTable'] = function (...) end;
        ['ShowShootingHit'] = function (...) end;
        ['UpdateHorseShootingContestTable'] = function (...) end;
        ['UpdateShootingContestTable'] = function (...) end;
    };
    ShootingTarget = {
        ['AddPhysicalImpulse'] = function (...) end;
        ['Client'] = {
            ['OnHit'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'ShootingTarget.bmp';
        };
        ['Event_Hide'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Init'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = 20;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bRigidBody'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['fileModel'] = 'objects/manmade/task_specific_props/combat/archery/target_small.cgf';
            ['hitMsgListener'] = '';
            ['iHitScoreValue'] = 1;
            ['iPhysicalizeMode'] = 0;
            ['isShootingTarget'] = true;
        };
        ['ResetPosition'] = function (...) end;
        ['shotDown'] = 0;
    };
    ShootingTargetOld = {
        ['Client'] = {
            ['OnHit'] = function (...) end;
        };
        ['Editor'] = {
            ['Icon'] = 'Item.bmp';
            ['ShowBounds'] = 1;
        };
        ['Event_Activated'] = function (...) end;
        ['Event_Deactivated'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['bTurningMode'] = false;
            ['fIntervallMax'] = 5;
            ['fIntervallMin'] = 3;
            ['fLightUpTime'] = 2;
            ['fScoreScale'] = 10;
            ['fTurnSpeed'] = 0.5;
            ['fileModel'] = 'objects/manmade/task_specific_props/combat/archery/target.cgf';
        };
        ['Server'] = {
            ['Activated'] = {
                ['OnBeginState'] = function (...) end;
                ['OnTimer'] = function (...) end;
            };
            ['Deactivated'] = {
                ['OnBeginState'] = function (...) end;
                ['OnTimer'] = function (...) end;
            };
            ['Init'] = {
                ['OnBeginState'] = function (...) end;
                ['OnTimer'] = function (...) end;
            };
            ['OnHit'] = function (...) end;
            ['OnInit'] = function (...) end;
        };
        ['States'] = {
            [04] = 'Init';
            [02] = 'Deactivated';
            [03] = 'Turning';
            [01] = 'Activated';
        };
    };
    Shop = {
        ['Editor'] = {
            ['Icon'] = 'bug.bmp';
        };
        ['OnPropertyChange'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bOwnerIsSpawned'] = false;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = '';
            ['iShopId'] = 0;
            ['sShopName'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
    };
    Shops = {
        ['AcceptTransaction'] = function (...) end;
        ['CancelTransaction'] = function (...) end;
        ['DoMoneyTransaction'] = function (...) end;
        ['FindItemInShop'] = function (...) end;
        ['FindShopInventoryForItem'] = function (...) end;
        ['GetShopDBIdByKeeper'] = function (...) end;
        ['GetShopDBIdByLinkedEntityId'] = function (...) end;
        ['GetShopMoney'] = function (...) end;
        ['IsLinkedWithShop'] = function (...) end;
        ['IsShopOpened'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['OpenInventoryForItem'] = function (...) end;
    };
    SimpleBribeTransaction = function (...) end;
    SinglePlayer = {
        ['AreUsable'] = function (...) end;
        ['Client'] = {
            ['OnHit'] = function (...) end;
        };
        ['ClientViewShake'] = function (...) end;
        ['CreateHit'] = function (...) end;
        ['EndLevel'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableByDog'] = function (...) end;
        ['IsUsableForChat'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['OnChatUsableMessage'] = function (...) end;
        ['OnDogUsableMessage'] = function (...) end;
        ['OnShoot'] = function (...) end;
        ['OnUsableMessage'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = 0;
        };
        ['Server'] = {
            ['OnClientConnect'] = function (...) end;
            ['OnStartLevel'] = function (...) end;
        };
        ['ViewShake'] = function (...) end;
        ['tempVec'] = {
            ['x'] = 0;
            ['y'] = 0;
            ['z'] = 0;
        };
    };
    SkillCheck = function (...) end;
    SkipTime = {
        ['GetSkipTimeMessageUIString'] = function (...) end;
    };
    SkipTimeCutsceneData = {
        ['Editor'] = {
            ['Icon'] = 'sequence.bmp';
        };
        ['Properties'] = {
            ['Duration'] = '';
            ['TargetTime'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esSkipTimeType'] = '';
        };
    };
    SmartAreaShape = {
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['EventIds'] = '';
            ['Label'] = '';
            ['Script'] = {
                ['Misc'] = '';
                ['bValidWithoutTemplate'] = false;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['fEventDespawnDistance'] = 500;
            ['guidLocationId'] = '';
            ['guidSmartAreaTemplate'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['layerEventLayer'] = '';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['type'] = 'SmartAreaShape';
    };
    SmartObject = {
        ['Editor'] = {
            ['Icon'] = 'smartobject.bmp';
            ['IconOnTop'] = 1;
            ['Model'] = 'Editor/Objects/anchor.cgf';
        };
        ['Event_Used'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Used'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['NavigationStarted'] = 'entity';
                ['Used'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnNavigationStarted'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['sWH_AI_EntityCategory'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['type'] = 'SmartObject';
    };
    SmartObjectCondition = {
        ['Editor'] = {
            ['Model'] = 'Editor/Objects/Pyramid.cgf';
        };
        ['OnInit'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['Properties'] = {
            ['Action'] = {
                ['soaction_Name'] = '';
                ['sostate_ObjectState'] = 'Busy';
                ['sostate_UserState'] = 'Busy';
            };
            ['Delay'] = {
                ['fMaximum'] = 15;
                ['fMemory'] = 1;
                ['fMinimum'] = 0.5;
            };
            ['Limits'] = {
                ['fDistance'] = 10;
                ['fOrientation'] = 360;
            };
            ['Multipliers'] = {
                ['fOrientation'] = 0;
                ['fProximity'] = 1;
                ['fRandomness'] = 0.25;
                ['fVisibility'] = 0;
            };
            ['Object'] = {
                ['object_Model'] = '';
                ['soclass_Class'] = 'BasicEntity';
                ['sostate_State'] = 'Idle';
            };
            ['User'] = {
                ['object_Model'] = '';
                ['soclass_Class'] = 'AIOBJECT_ACTOR';
                ['sostate_State'] = 'Idle';
            };
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIncludeInNavigation'] = true;
            ['bRelativeToTarget'] = false;
            ['bSaved_by_game'] = true;
        };
        ['Register'] = function (...) end;
        ['type'] = 'SmartObjectCondition';
    };
    SmartObjectTrigger = {
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '';
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    Smithery = {
        ['Editor'] = {
            ['Icon'] = 'animobject.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetLinkedSmartObject'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['object_Model'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUseTrigger'] = true;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    Sound = {
        ['GetAudioEnvironmentID'] = function (...) end;
        ['GetAudioRtpcID'] = function (...) end;
        ['GetAudioSwitchID'] = function (...) end;
        ['GetAudioSwitchStateID'] = function (...) end;
        ['GetAudioTriggerID'] = function (...) end;
        ['SetAudioRtpcValue'] = function (...) end;
    };
    SpawnBattle = function (...) end;
    SpawnEnemy = function (...) end;
    SpawnFriend = function (...) end;
    SpawnGroup = {
        ['AddSpawnPoints'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'spawngroup.bmp';
        };
        ['Enable'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
        };
        ['IsEnabled'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['NetSetup'] = {
        };
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bDefault'] = 0;
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['objModelForSpawnGroup'] = '';
            ['teamName'] = '';
        };
        ['RemoveSpawnPoints'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
            ['OnStartGame'] = function (...) end;
        };
        ['__client_dispatch'] = {
            ['__validated'] = false;
        };
        ['__server_dispatch'] = {
            ['__validated'] = false;
        };
    };
    SpawnParticleEffect = {
        ['Category'] = 'approved';
        ['Implementation'] = function (...) end;
        ['Inputs'] = {
            [03] = {
                [02] = 'string';
                [01] = 'Effect';
            };
            [02] = {
                [02] = 'vec3';
                [01] = 'Position';
            };
            [01] = {
                [01] = 't_Activate';
                [02] = 'bool';
            };
        };
        ['Outputs'] = {
            [01] = {
                [01] = 'Done';
                [02] = 'bool';
            };
        };
    };
    SpawnPoint = {
        ['Client'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['Editor'] = {
            ['DisplayArrow'] = 1;
            ['Icon'] = 'SpawnPoint.bmp';
            ['Model'] = 'Editor/Objects/spawnpointhelper.cgf';
        };
        ['Enable'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_Spawn'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disabled'] = 'bool';
                ['Enabled'] = 'bool';
                ['Spawn'] = 'entity';
            };
        };
        ['IsEnabled'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['Properties'] = {
            ['bDoVisTest'] = true;
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInitialSpawn'] = false;
            ['bSaved_by_game'] = false;
            ['groupName'] = '';
            ['teamName'] = '';
        };
        ['Server'] = {
            ['OnInit'] = function (...) end;
            ['OnShutDown'] = function (...) end;
        };
        ['Spawned'] = function (...) end;
    };
    SpeedLimiter = {
        ['CanTrigger'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'forbiddenarea.bmp';
            ['IsRotatable'] = false;
            ['IsScalable'] = false;
            ['Model'] = 'Editor/Objects/T.cgf';
            ['ShowBounds'] = 1;
        };
        ['Enable'] = function (...) end;
        ['OnEnterArea'] = function (...) end;
        ['OnLeaveArea'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bAllowRun'] = 1;
            ['bAllowSprint'] = 0;
            ['bEnabled'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bOnlyPlayers'] = 1;
            ['bSaved_by_game'] = true;
        };
        ['Trigger'] = function (...) end;
    };
    StanceSmartObject = {
        ['Editor'] = {
            ['Icon'] = 'smartObjectHolder.bmp';
        };
        ['GetEditorModel'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['Properties'] = {
            ['Bed'] = {
                ['esReadingQuality'] = 'none';
                ['esSleepQuality'] = 'none';
            };
            ['Script'] = {
                ['Misc'] = '';
                ['esBedTypes'] = 'bench';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bNo_POI'] = false;
            ['bOwnedByHome'] = false;
            ['bPOI_discoverable_by_location'] = true;
            ['bSaved_by_game'] = false;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['object_editorModel'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
    };
    StartFG = {
        ['Editor'] = {
            ['Icon'] = 'stash.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['FlowEvents'] = {
            ['Outputs'] = {
                ['Activate'] = 'bool';
            };
        };
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['object_Model'] = '';
        };
        ['Reset'] = function (...) end;
    };
    Startup = {
        ['CombatTest_Startup'] = function (...) end;
        ['DogTest_startup'] = function (...) end;
        ['DogVsDogTest_startup'] = function (...) end;
        ['Tutorials'] = function (...) end;
    };
    StashCorpse = {
        ['AssignInventory'] = function (...) end;
        ['Close'] = function (...) end;
        ['DoPlayAnimation'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'stash.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Close'] = function (...) end;
        ['Event_Hide'] = function (...) end;
        ['Event_Lock'] = function (...) end;
        ['Event_Open'] = function (...) end;
        ['Event_StartLockPicking'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['Event_Unlock'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Close'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Lock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Open'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Unlock'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Close'] = 'bool';
                ['Hide'] = 'bool';
                ['Lock'] = 'bool';
                ['Open'] = 'bool';
                ['UnHide'] = 'bool';
                ['Unlock'] = 'bool';
            };
        };
        ['GenerateLockDifficulty'] = function (...) end;
        ['GetActions'] = function (...) end;
        ['GetInventoryToOpen'] = function (...) end;
        ['GetLockDifficulty'] = function (...) end;
        ['GetUsableEvent'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadOriginalModel'] = function (...) end;
        ['LoadPhaseModel'] = function (...) end;
        ['Lock'] = function (...) end;
        ['LockType'] = 'chest';
        ['NeedSerialize'] = function (...) end;
        ['OnClose'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnItemAdded'] = function (...) end;
        ['OnItemRemoved'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnLockpicked'] = function (...) end;
        ['OnOpen'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['Open'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Animation'] = {
                ['anim_Close'] = '';
                ['anim_Open'] = '';
                ['bOpenOnly'] = false;
            };
            ['Database'] = {
                ['bReadOnly'] = false;
                ['iMinimalShopItemPrice'] = 0;
                ['nRestockPeriodDays'] = 0;
                ['sGeneratedInventory'] = '';
                ['sInventoryPreset'] = '';
            };
            ['Lock'] = {
                ['bCanLockPick'] = true;
                ['bCanUnlockWithDynamicKey'] = true;
                ['bLockDifficultyOverride'] = false;
                ['bLocked'] = false;
                ['bSendMessage'] = false;
                ['esLockFanciness'] = 'Common';
                ['fLockDifficulty'] = 1;
                ['guidItemClassId'] = '';
            };
            ['Phase'] = {
                ['esStashPhaseChangeEvent'] = 'Never';
                ['object_PhaseModel'] = '';
            };
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bAllowUsageInCombatDanger'] = true;
                ['bTutorial'] = false;
                ['fTutorialMaxThievery'] = 15;
                ['fTutorialMaxThieveryOpenLimit'] = 10;
            };
            ['Sounds'] = {
                ['snd_Close'] = '';
                ['snd_Open'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractableThroughCollision'] = false;
            ['bOwnedByHome'] = true;
            ['bSaved_by_game'] = true;
            ['bSkipAngleCheck'] = true;
            ['esChestContextLabel'] = 'none';
            ['fUseAngle'] = 0.7;
            ['fUseDistance'] = 2.5;
            ['fUseZOffset'] = 0;
            ['guidSmartObjectType'] = '';
            ['object_Model'] = 'Objects/special/primitive_cylinder_nodraw.cgf';
            ['sOpenMessage'] = '@ui_open_stash';
            ['sPickPlaceAnimTag'] = '';
            ['sWH_AI_EntityCategory'] = '';
            ['soclass_SmartObjectHelpers'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetAnimationWithActivation'] = function (...) end;
        ['Server'] = {
            ['OnUpdate'] = function (...) end;
        };
        ['SetBeingUsedByNPC'] = function (...) end;
        ['SetBeingUsedByPlayer'] = function (...) end;
        ['SetInteractive'] = function (...) end;
        ['Unlock'] = function (...) end;
        ['UsesStealUiPrompt'] = function (...) end;
        ['bFirstUpdateAfterResetAnimation'] = false;
        ['bLocked'] = false;
        ['bNeedUpdate'] = 0;
        ['bNoAnims'] = 0;
        ['bOpenAfterUnlock'] = 0;
        ['bOpened'] = 0;
        ['bUseSameAnim'] = 0;
        ['bUseableMsgChanged'] = 0;
        ['fTutorialOpenCount'] = 0;
        ['inventoryId'] = 0;
        ['nDirection'] = -1;
        ['nSoundId'] = 0;
        ['nUserId'] = 0;
        ['objectPhaseChanged'] = false;
    };
    StashInventoryCollector = {
        ['GetHomeInhabitantsData'] = function (...) end;
        ['GetNPCInformation'] = function (...) end;
        ['GetOwnerPrefix'] = function (...) end;
        ['GetOwnersData'] = function (...) end;
        ['GetStashHome'] = function (...) end;
        ['GetStashInformation'] = function (...) end;
        ['GetStashOwner'] = function (...) end;
        ['GetStashWuid'] = function (...) end;
        ['HasClothingLink'] = function (...) end;
        ['IsMasterStash'] = function (...) end;
        ['IsShopStash'] = function (...) end;
    };
    StashInventoryGenerator = {
        ['GetInventoryFromData'] = function (...) end;
    };
    Statistics = {
        ['Increment'] = function (...) end;
        ['Insert'] = function (...) end;
        ['Remove'] = function (...) end;
        ['Reset'] = function (...) end;
        ['Set'] = function (...) end;
    };
    StoneThrowing = {
        ['CanUse'] = function (...) end;
        ['StartMinigame'] = function (...) end;
    };
    StoneThrowingNode = {
        ['Editor'] = {
            ['Icon'] = 'POI.bmp';
        };
    };
    StoneThrowingPile = {
        ['Editor'] = {
            ['Icon'] = 'mine.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['esOrientation'] = 'left';
            ['esThrowType'] = 'hole';
            ['guidSmartObjectType'] = '';
            ['object_Model'] = '';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUseTrigger'] = true;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    StrFormat = function (...) end;
    System = {
        ['ActivateLight'] = function (...) end;
        ['ActivatePortal'] = function (...) end;
        ['AddCCommand'] = function (...) end;
        ['ApplicationTest'] = function (...) end;
        ['ApplyForceToEnvironment'] = function (...) end;
        ['Break'] = function (...) end;
        ['BrowseURL'] = function (...) end;
        ['CheckHeapValid'] = function (...) end;
        ['ClearConsole'] = function (...) end;
        ['ClearKeyState'] = function (...) end;
        ['CreateDownload'] = function (...) end;
        ['DebugStats'] = function (...) end;
        ['DeformTerrain'] = function (...) end;
        ['DeformTerrainUsingMat'] = function (...) end;
        ['Draw2DLine'] = function (...) end;
        ['DrawLabel'] = function (...) end;
        ['DrawLine'] = function (...) end;
        ['DrawText'] = function (...) end;
        ['DumpMMStats'] = function (...) end;
        ['DumpMemStats'] = function (...) end;
        ['DumpMemoryCoverage'] = function (...) end;
        ['DumpWinHeaps'] = function (...) end;
        ['EnableHeatVision'] = function (...) end;
        ['EnableMainView'] = function (...) end;
        ['EnableOceanRendering'] = function (...) end;
        ['EnumAAFormats'] = function (...) end;
        ['EnumDisplayFormats'] = function (...) end;
        ['Error'] = function (...) end;
        ['ExecuteCommand'] = function (...) end;
        ['GetArchetypeProperties'] = function (...) end;
        ['GetCVar'] = function (...) end;
        ['GetConfigSpec'] = function (...) end;
        ['GetCurrAsyncTime'] = function (...) end;
        ['GetCurrTime'] = function (...) end;
        ['GetEntities'] = function (...) end;
        ['GetEntitiesByClass'] = function (...) end;
        ['GetEntitiesInSphere'] = function (...) end;
        ['GetEntitiesInSphereByClass'] = function (...) end;
        ['GetEntity'] = function (...) end;
        ['GetEntityByGUID'] = function (...) end;
        ['GetEntityByName'] = function (...) end;
        ['GetEntityByTextGUID'] = function (...) end;
        ['GetEntityClass'] = function (...) end;
        ['GetEntityIdByName'] = function (...) end;
        ['GetEntityPositionAndDirection'] = function (...) end;
        ['GetFrameID'] = function (...) end;
        ['GetFrameTime'] = function (...) end;
        ['GetLocalOSTime'] = function (...) end;
        ['GetNearestEntityByClass'] = function (...) end;
        ['GetNearestEntityByName'] = function (...) end;
        ['GetOutdoorAmbientColor'] = function (...) end;
        ['GetPhysicalEntitiesInBox'] = function (...) end;
        ['GetPhysicalEntitiesInBoxByClass'] = function (...) end;
        ['GetPostProcessFxParam'] = function (...) end;
        ['GetScreenFx'] = function (...) end;
        ['GetSkyColor'] = function (...) end;
        ['GetSkyHighlight'] = function (...) end;
        ['GetSunColor'] = function (...) end;
        ['GetSurfaceTypeIdByName'] = function (...) end;
        ['GetSurfaceTypeNameById'] = function (...) end;
        ['GetSystemMem'] = function (...) end;
        ['GetTerrainElevation'] = function (...) end;
        ['GetUserName'] = function (...) end;
        ['GetViewCameraAngles'] = function (...) end;
        ['GetViewCameraDir'] = function (...) end;
        ['GetViewCameraFov'] = function (...) end;
        ['GetViewCameraPos'] = function (...) end;
        ['GetViewCameraUpDir'] = function (...) end;
        ['GetViewport'] = function (...) end;
        ['GetWind'] = function (...) end;
        ['IsDevModeEnable'] = function (...) end;
        ['IsEditing'] = function (...) end;
        ['IsEditor'] = function (...) end;
        ['IsFileExist'] = function (...) end;
        ['IsHDRSupported'] = function (...) end;
        ['IsMultiplayer'] = function (...) end;
        ['IsPointIndoors'] = function (...) end;
        ['IsPointVisible'] = function (...) end;
        ['IsValidMapPos'] = function (...) end;
        ['LoadFont'] = function (...) end;
        ['LoadLocalizationXml'] = function (...) end;
        ['LoadTextFile'] = function (...) end;
        ['Log'] = function (...) end;
        ['LogAlways'] = function (...) end;
        ['LogToConsole'] = function (...) end;
        ['PrepareEntityFromPool'] = function (...) end;
        ['ProjectToScreen'] = function (...) end;
        ['Quit'] = function (...) end;
        ['QuitInNSeconds'] = function (...) end;
        ['RayTraceCheck'] = function (...) end;
        ['RayWorldIntersection'] = function (...) end;
        ['RemoveEntity'] = function (...) end;
        ['ResetPoolEntity'] = function (...) end;
        ['ReturnEntityToPool'] = function (...) end;
        ['ScanDirectory'] = function (...) end;
        ['ScreenToTexture'] = function (...) end;
        ['SetBudget'] = function (...) end;
        ['SetCVar'] = function (...) end;
        ['SetConsoleImage'] = function (...) end;
        ['SetGammaDelta'] = function (...) end;
        ['SetOutdoorAmbientColor'] = function (...) end;
        ['SetPostProcessFxParam'] = function (...) end;
        ['SetScissor'] = function (...) end;
        ['SetScreenFx'] = function (...) end;
        ['SetSkyColor'] = function (...) end;
        ['SetSkyHighlight'] = function (...) end;
        ['SetSunColor'] = function (...) end;
        ['SetViewCameraFov'] = function (...) end;
        ['SetVolumetricFogModifiers'] = function (...) end;
        ['SetWaterVolumeOffset'] = function (...) end;
        ['SetWind'] = function (...) end;
        ['ShowConsole'] = function (...) end;
        ['ShowDebugger'] = function (...) end;
        ['SpawnEntity'] = function (...) end;
        ['ViewDistanceGet'] = function (...) end;
        ['ViewDistanceSet'] = function (...) end;
        ['Warning'] = function (...) end;
    };
    TBrutus = function (...) end;
    TDebug = function (...) end;
    TDetail = function (...) end;
    TError = function (...) end;
    TFatal = function (...) end;
    TInfo = function (...) end;
    TWarning = function (...) end;
    TagPointWithScript = {
        ['Editor'] = {
            ['Icon'] = 'TagPoint.bmp';
        };
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['sWH_AI_EntityCategory'] = '';
        };
        ['type'] = 'TagPoint';
    };
    TestScripted = {
        ['Activate_output'] = function (...) end;
        ['Category'] = 'wip';
        ['Inputs'] = {
            [01] = 'input';
        };
        ['OnActivate_input'] = function (...) end;
        ['Outputs'] = {
            [01] = 'output';
        };
    };
    ThreatenByPlayer = function (...) end;
    TimeUtils = {
        ['CheckTimeInBounds'] = function (...) end;
        ['ConvertDecimalHoursToDigitalTimeOfDay'] = function (...) end;
        ['ConvertTimeArrayToDecimalHours'] = function (...) end;
        ['ConvertTimeArrayToMiliseconds'] = function (...) end;
        ['ConvertTimeStringToTimeArray'] = function (...) end;
        ['ConvertTimesStringToNumArray'] = function (...) end;
        ['FloatToTime'] = function (...) end;
        ['ForwardTime'] = function (...) end;
        ['GetOneDayWaitDuration'] = function (...) end;
    };
    Tmax_trace_level = function (...) end;
    ToStr = function (...) end;
    Torch = {
        ['Cleanup'] = function (...) end;
        ['Disable'] = function (...) end;
        ['Enable'] = function (...) end;
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Event_GroundCollision'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['GroundCollision'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
                ['GroundCollision'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableName'] = function (...) end;
        ['GroundCollision'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsCrossCenteringEnabled'] = function (...) end;
        ['OnActivate'] = function (...) end;
        ['OnBurningOut'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnIdle'] = function (...) end;
        ['OnLevelLoaded'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPreBurnOut'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInteractiveCollisionClass'] = false;
            ['bSaved_by_game'] = true;
            ['sHelper'] = 'slt_particle';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['Properties2'] = {
            ['BurningOutParticleEffect'] = 'WH_Particels.fires.torch_burn_out';
            ['HighVisibilityParticleEffect'] = 'WH_Particels.fires.torch_longdistance';
            ['ParticleEffect'] = 'WH_Particels.fires.torch_trailer';
            ['bActive'] = true;
            ['fBurningOutAnimSpeed'] = 30;
            ['fBurnoutDurationSec'] = 20;
            ['fPreBurnoutDurationSec'] = 5;
            ['nBurningOutLightSourceStyle'] = 22;
        };
        ['Server'] = {
            ['Active'] = {
                ['OnBeginState'] = function (...) end;
            };
            ['BurningOut'] = {
                ['OnBeginState'] = function (...) end;
                ['OnUpdate'] = function (...) end;
            };
            ['Idle'] = {
                ['OnBeginState'] = function (...) end;
                ['OnUpdate'] = function (...) end;
            };
            ['PreBurnOut'] = {
                ['OnBeginState'] = function (...) end;
                ['OnUpdate'] = function (...) end;
            };
        };
        ['SetInteractiveCollisionType'] = function (...) end;
        ['StartBurnOut'] = function (...) end;
        ['StartPreBurnOut'] = function (...) end;
        ['States'] = {
            [02] = 'Idle';
            [03] = 'PreBurnOut';
            [01] = 'Active';
            [04] = 'BurningOut';
        };
        ['Use'] = function (...) end;
        ['bIsBurning'] = false;
        ['fBurnOutTime'] = 0;
        ['npcOnly'] = false;
    };
    Trace = {
        ['Brutus'] = function (...) end;
        ['Debug'] = function (...) end;
        ['Detail'] = function (...) end;
        ['Error'] = function (...) end;
        ['Fatal'] = function (...) end;
        ['Info'] = function (...) end;
        ['Msg'] = function (...) end;
        ['PlotXY'] = function (...) end;
        ['TableXY'] = function (...) end;
        ['Warning'] = function (...) end;
        ['max_trace_level'] = function (...) end;
    };
    TranscriptionTable = {
        ['Editor'] = {
            ['Icon'] = 'ledge.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetRandomTranscriptionBook'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = 100;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = false;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['sTranscriptionBooksItemIds'] = '3bed7288-086a-4a62-8291-22f32291b06f|40d029c9-3b81-4758-8aa2-a6c71fc4500b|5b262db6-3fa3-4be6-b0d5-4c50f2d35a5e|5943bccf-03ce-4ced-bef7-b28f4d5f3fb1|dbf96a07-0769-4327-ae31-14a95bdfd603';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['object_Model'] = 'Objects/props/alchemy/bookstand/bookstand.cgf';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetUsable'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUsable'] = false;
        ['bUseTrigger'] = false;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    TriggerArea = {
        ['Properties'] = {
            ['EventIds'] = '';
            ['Label'] = '';
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['bTrackAlways'] = false;
            ['layerEventLayer'] = '';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['type'] = 'TriggerArea';
    };
    TriggerBase = {
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['UseMessage'] = '';
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bQuestSystemTrigger'] = false;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    Tutorials = {
        ['InitData'] = function (...) end;
    };
    UI = {
        ['OnApseLinkNodeDespawn'] = function (...) end;
        ['OnApseLinkNodeSpawn'] = function (...) end;
        ['OnShopLinkNodeDespawn'] = function (...) end;
        ['OnShopLinkNodeSpawn'] = function (...) end;
    };
    UIAction = {
        ['CallFunction'] = function (...) end;
        ['DisableAction'] = function (...) end;
        ['EnableAction'] = function (...) end;
        ['EndAction'] = function (...) end;
        ['GetAlpha'] = function (...) end;
        ['GetArray'] = function (...) end;
        ['GetPos'] = function (...) end;
        ['GetRotation'] = function (...) end;
        ['GetScale'] = function (...) end;
        ['GetVariable'] = function (...) end;
        ['GotoAndPlay'] = function (...) end;
        ['GotoAndPlayFrameName'] = function (...) end;
        ['GotoAndStop'] = function (...) end;
        ['GotoAndStopFrameName'] = function (...) end;
        ['HideElement'] = function (...) end;
        ['IsVisible'] = function (...) end;
        ['RegisterActionListener'] = function (...) end;
        ['RegisterElementListener'] = function (...) end;
        ['RegisterEventSystemListener'] = function (...) end;
        ['ReloadElement'] = function (...) end;
        ['RequestHide'] = function (...) end;
        ['SetAlpha'] = function (...) end;
        ['SetArray'] = function (...) end;
        ['SetPos'] = function (...) end;
        ['SetRotation'] = function (...) end;
        ['SetScale'] = function (...) end;
        ['SetVariable'] = function (...) end;
        ['SetVisible'] = function (...) end;
        ['ShowElement'] = function (...) end;
        ['StartAction'] = function (...) end;
        ['UnloadElement'] = function (...) end;
        ['UnregisterActionListener'] = function (...) end;
        ['UnregisterElementListener'] = function (...) end;
        ['UnregisterEventSystemListener'] = function (...) end;
    };
    UIApseLinkNode = {
        ['Editor'] = {
            ['Icon'] = 'Flash.bmp';
        };
        ['OnDestroy'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
    };
    UIMap = {
        ['GoToCheckpointMark'] = function (...) end;
    };
    UIShopLinkNode = {
        ['Editor'] = {
            ['Icon'] = 'Flash.bmp';
        };
        ['OnDestroy'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
    };
    Variables = {
        ['CreateContext'] = function (...) end;
        ['DecrementGlobal'] = function (...) end;
        ['DecrementLocal'] = function (...) end;
        ['DestroyContext'] = function (...) end;
        ['DiscardContextVariables'] = function (...) end;
        ['GetGlobal'] = function (...) end;
        ['GetLocal'] = function (...) end;
        ['IncrementGlobal'] = function (...) end;
        ['IncrementLocal'] = function (...) end;
        ['SetGlobal'] = function (...) end;
        ['SetLocal'] = function (...) end;
    };
    VectorUtils = {
        ['Copy'] = function (...) end;
        ['CrossProduct'] = function (...) end;
        ['Distance'] = function (...) end;
        ['DistanceSquared'] = function (...) end;
        ['DistanceSquared2D'] = function (...) end;
        ['DotProduct'] = function (...) end;
        ['DotProduct2D'] = function (...) end;
        ['GetAngleBetween'] = function (...) end;
        ['GetAngleBetween2D'] = function (...) end;
        ['GetDirection'] = function (...) end;
        ['IsZero'] = function (...) end;
        ['Length'] = function (...) end;
        ['LengthSquared'] = function (...) end;
        ['Lerp'] = function (...) end;
        ['LogVector'] = function (...) end;
        ['Negate'] = function (...) end;
        ['Normalize'] = function (...) end;
        ['Product'] = function (...) end;
        ['Rotate2D'] = function (...) end;
        ['Rotate90AroundZ'] = function (...) end;
        ['RotateAround'] = function (...) end;
        ['RotateMinus90AroundZ'] = function (...) end;
        ['Scale'] = function (...) end;
        ['Subtract'] = function (...) end;
        ['Sum'] = function (...) end;
        ['ToString'] = function (...) end;
    };
    ViewDist = {
        ['Editor'] = {
            ['Model'] = 'Editor/Objects/T.cgf';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['FadeViewDist'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
            };
        };
        ['OnEnterArea'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLeaveArea'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['Properties'] = {
            ['MaxViewDist'] = 25;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['fFadeTime'] = 1;
        };
        ['ResetValues'] = function (...) end;
        ['type'] = 'ViewDistController';
    };
    VisibilityArea = {
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['linked_to_global_area'] = false;
        };
        ['type'] = 'VisibilityArea';
    };
    VolumeObject = {
        ['Create'] = function (...) end;
        ['Delete'] = function (...) end;
        ['ENTITY_DETAIL_ID'] = 1;
        ['Editor'] = {
            ['Icon'] = 'Clouds.bmp';
            ['Model'] = 'Editor/Objects/Particles.cgf';
        };
        ['Event_Hide'] = function (...) end;
        ['Event_Show'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Show'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hide'] = 'bool';
                ['Show'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['Movement'] = {
                ['bAutoMove'] = 0;
                ['fFadeDistance'] = 0;
                ['vector_SpaceLoopBox'] = {
                    ['x'] = 2000;
                    ['y'] = 2000;
                    ['z'] = 2000;
                };
                ['vector_Speed'] = {
                    ['x'] = 0;
                    ['y'] = 0;
                    ['z'] = 0;
                };
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['file_VolumeObjectFile'] = 'Libs/Clouds/Default.xml';
        };
        ['SetMovementProperties'] = function (...) end;
        ['type'] = 'VolumeObject';
    };
    WHCart = {
        ['Editor'] = {
            ['Icon'] = 'vehicle.bmp';
            ['IconOnTop'] = 1;
        };
        ['GetCartType'] = function (...) end;
        ['GetIsQuestCart'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bIsQuestCart'] = false;
            ['bMovingSmartObject'] = true;
            ['bSaved_by_game'] = true;
            ['guidSmartObjectType'] = 'DEF0005E-0000-0000-0000-DEF00000005E';
            ['sCartType'] = 'fourWheeled';
            ['soclass_SmartObjectHelpers'] = 'Cart';
        };
        ['Reset'] = function (...) end;
        ['cartType'] = 'fourWheeled';
        ['isQuestCart'] = false;
    };
    WHCartMountPoint = {
        ['Editor'] = {
            ['Icon'] = 'Ladder.bmp';
            ['IconOnTop'] = 1;
            ['ShowBounds'] = 1;
        };
        ['Event_Use'] = function (...) end;
        ['Event_User'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Use'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
                ['User'] = {
                    [02] = 'entityid';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['OnUse'] = 'bool';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetUsableMessage'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableMsgChanged'] = function (...) end;
        ['LoadModel'] = function (...) end;
        ['OnEnablePhysics'] = function (...) end;
        ['OnMount'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Physics'] = {
                ['Density'] = -1;
                ['Mass'] = -1;
                ['bPhysicalize'] = true;
                ['bPushableByPlayers'] = false;
                ['bRigidBody'] = true;
            };
            ['bCartFrontSeat'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = false;
            ['fUseAngle'] = 0.92;
            ['fUseDistance'] = 2.2;
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['soclasses_SmartObjectClass'] = '';
        };
        ['Reset'] = function (...) end;
        ['ResetChild'] = function (...) end;
        ['SetInteractiveCollisionType'] = function (...) end;
        ['SetupTrigger'] = function (...) end;
        ['bUseTrigger'] = true;
        ['bUseableMsgChanged'] = 0;
        ['fMinUseDistance'] = 0.7;
        ['fUseAngle'] = 0.7;
        ['nUserId'] = 0;
    };
    WaterPuddle = {
        ['Editor'] = {
            ['Icon'] = 'Water.bmp';
            ['IsRotatable'] = true;
            ['IsScalable'] = false;
            ['Model'] = 'Editor/Objects/T.cgf';
            ['ShowBounds'] = 1;
        };
        ['Event_Hide'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hidden'] = 'bool';
                ['UnHidden'] = 'bool';
            };
        };
        ['IsShapeOnly'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['bThisIsAPuddle'] = 0;
        };
        ['type'] = 'WaterPuddle';
    };
    WaterTubeActionTrigger = {
        ['CanWash'] = function (...) end;
        ['CanWashWithSoap'] = function (...) end;
        ['Editor'] = {
            ['Icon'] = 'Trigger.bmp';
        };
        ['GetActions'] = function (...) end;
        ['GetHint'] = function (...) end;
        ['GetHintHold'] = function (...) end;
        ['GetLinkedSmartObject'] = function (...) end;
        ['GetOwner'] = function (...) end;
        ['InteractorPriority'] = 4;
        ['IsActionAvailable'] = function (...) end;
        ['IsEnabled'] = function (...) end;
        ['IsEnabledByProperties'] = function (...) end;
        ['IsEnabledByScriptPerk'] = function (...) end;
        ['IsEnabledBySoulAbility'] = function (...) end;
        ['IsEnabledFromQuestSystem'] = function (...) end;
        ['IsEnabledHold'] = function (...) end;
        ['IsLegal'] = function (...) end;
        ['IsLegalHold'] = function (...) end;
        ['IsLegalImpl'] = function (...) end;
        ['IsUsable'] = function (...) end;
        ['IsUsableHold'] = function (...) end;
        ['NeedSerialize'] = function (...) end;
        ['OnAction'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnInventoryClosed'] = function (...) end;
        ['OnInventoryItemUsed'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnNPCStateSearchDone'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnResourcesHosted'] = function (...) end;
        ['OnResourcesHostingInterrupted'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnTriggerPoint'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OnUsedHold'] = function (...) end;
        ['OpenInventory'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['Click'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['CannotWashReason'] = '';
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '@ui_hud_use_item';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = true;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'Stance';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = 'sitting';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['Hold'] = {
                ['Angle'] = {
                    ['fAngleTolerance'] = 180;
                    ['fApproachDirection'] = 0;
                };
                ['InventoryFilter'] = '';
                ['InventoryMultiFilter'] = '';
                ['Item'] = {
                    ['bAllowUseWithoutItem'] = false;
                    ['bDeleteAfterUse'] = false;
                    ['guidItemClassId'] = '';
                    ['sAliasToBarkWithoutItem'] = '';
                };
                ['Synchro'] = {
                    ['nNumParticipants'] = 2;
                    ['sKeyContextLinkName'] = '';
                    ['sKeyName'] = '';
                    ['sTimeout'] = '';
                };
                ['UseMessage'] = '';
                ['UseNotOwnerMessage'] = '@ui_hud_use_item_not_owner';
                ['bAllowNoOwner'] = true;
                ['bAllowTorch'] = false;
                ['bCheckOwner'] = false;
                ['bDelayedReportUse'] = false;
                ['bDisableFocusCamera'] = true;
                ['bIsActive'] = false;
                ['bIsActiveInCombat'] = false;
                ['bIsActiveInTenseCircumstance'] = false;
                ['bIsActiveWhileCarryingCorpse'] = false;
                ['bRequireTargetHaveDialog'] = false;
                ['bSaveLock'] = false;
                ['esActionType'] = 'None';
                ['fActiveDistance'] = -1;
                ['fActiveMinDistance'] = -1;
                ['fZToleration'] = -1;
                ['guidRequiredScriptPerk'] = '';
                ['sAction'] = '';
                ['sActionTags'] = '';
                ['sAnimationResourceOverride'] = '';
                ['sRequiredSoulAbility'] = '';
                ['sSendMessageTo'] = '';
                ['sSlaveLinkName'] = '';
                ['sTriggerPointId'] = '';
            };
            ['InteractorPriorityOverride'] = -1;
            ['Script'] = {
                ['Misc'] = '';
            };
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bQuestSystemTrigger'] = false;
            ['bSaved_by_game'] = true;
            ['fMinDirtBloodBody'] = 0.2;
            ['fMinDirtBloodClothing'] = 0.7;
            ['guidSoap'] = '';
            ['object_Model'] = 'objects/special/primitive_cylinder.cgf';
            ['sWH_AI_EntityCategory'] = '';
        };
        ['ReportUse'] = function (...) end;
        ['ResetHoldMessage'] = function (...) end;
        ['ResetUseMessage'] = function (...) end;
        ['SetAvailable'] = function (...) end;
        ['SetAvailableHold'] = function (...) end;
        ['SetHoldMessage'] = function (...) end;
        ['SetUseMessage'] = function (...) end;
        ['UpdateMaterial'] = function (...) end;
        ['UserNoItem'] = function (...) end;
        ['_CheckDialog'] = function (...) end;
        ['_GetSendTargets'] = function (...) end;
    };
    WaterVolume = {
        ['Editor'] = {
            ['Icon'] = 'Water.bmp';
            ['IsRotatable'] = true;
            ['IsScalable'] = false;
            ['Model'] = 'Editor/Objects/T.cgf';
            ['ShowBounds'] = 1;
        };
        ['Event_Hide'] = function (...) end;
        ['Event_PhysicsDisable'] = function (...) end;
        ['Event_PhysicsEnable'] = function (...) end;
        ['Event_UnHide'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Hide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['PhysicsDisable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['PhysicsEnable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['UnHide'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Hidden'] = 'bool';
                ['UnHidden'] = 'bool';
            };
        };
        ['IsShapeOnly'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['Properties'] = {
            ['CausticHeight'] = 0.5;
            ['CausticIntensity'] = 1;
            ['CausticTiling'] = 1;
            ['Depth'] = 5;
            ['FogColorMultiplier'] = 0.5;
            ['FogDensity'] = 0.5;
            ['FogShadowing'] = 0.5;
            ['MaterialLayerMask'] = 0;
            ['MinSpec'] = 0;
            ['MultiplayerOptions'] = {
                ['bNetworked'] = false;
            };
            ['StreamSpeed'] = 0;
            ['UScale'] = 1;
            ['VScale'] = 1;
            ['ViewDistanceRatio'] = 100;
            ['bAwakeAreaWhenMoving'] = false;
            ['bCapFogAtVolumeDepth'] = false;
            ['bCaustics'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bFogColorAffectedBySun'] = true;
            ['bIsRiver'] = false;
            ['bSaved_by_game'] = true;
            ['color_FogColor'] = {
                ['x'] = 0.005;
                ['y'] = 0.01;
                ['z'] = 0.02;
            };
        };
        ['type'] = 'WaterVolume';
    };
    WildDog = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['dashPossibleCheckDistance'] = 12;
            ['dashPossibleCheckRequiredSpeedParam'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_dog_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_dog_database.adb';
        ['CombatOpponentMnTag'] = 'oppDog';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OpponentMnTag'] = 'relatedDog';
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 1;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 1;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Dog';
                ['footstepEffect'] = 'footsteps_Dog';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'wild_dog';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/Dog/dog.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.55;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.05;
                ['z'] = 0.52;
            };
            ['posCarcass'] = {
                ['x'] = 0.1;
                ['y'] = 0.16;
                ['z'] = 0.08;
            };
            ['radius'] = 0.13;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'WildDog';
        ['defaultSoulClass'] = 'wilddog';
        ['gameParams'] = {
            ['animatedCharacterTurnSpeedSmoothingTime'] = 0.2;
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['lookFOV'] = 180;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 30;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 25;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 25;
            ['stiffness_scale'] = 73;
        };
    };
    Wind = {
        ['Editor'] = {
            ['Icon'] = 'Tornado.bmp';
        };
        ['Event_Disable'] = function (...) end;
        ['Event_Enable'] = function (...) end;
        ['Fade'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Disable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Enable'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Disable'] = 'bool';
                ['Enable'] = 'bool';
            };
        };
        ['OnEnterArea'] = function (...) end;
        ['OnInit'] = function (...) end;
        ['OnLeaveArea'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnProceedFadeArea'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['OnShutDown'] = function (...) end;
        ['OnTimer'] = function (...) end;
        ['Properties'] = {
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
            ['fFadeTime'] = 1;
            ['vVelocity'] = {
                ['x'] = 1;
                ['y'] = 0;
                ['z'] = 0;
            };
        };
        ['ResetValues'] = function (...) end;
        ['type'] = 'WindController';
    };
    WindArea = {
        ['Editor'] = {
            ['Icon'] = 'Tornado.bmp';
        };
        ['Event_Activate'] = function (...) end;
        ['Event_Deactivate'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Activate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
                ['Deactivate'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Activate'] = 'bool';
                ['Deactivate'] = 'bool';
            };
        };
        ['OnInit'] = function (...) end;
        ['OnLoad'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSave'] = function (...) end;
        ['PhysicalizeThis'] = function (...) end;
        ['Properties'] = {
            ['AirDensity'] = 0;
            ['AirResistance'] = 0;
            ['Dir'] = {
                ['x'] = 0;
                ['y'] = 0;
                ['z'] = 0;
            };
            ['FalloffInner'] = 0;
            ['Size'] = {
                ['x'] = 10;
                ['y'] = 10;
                ['z'] = 10;
            };
            ['Speed'] = 0;
            ['bActive'] = true;
            ['bEllipsoidal'] = 1;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bSaved_by_game'] = true;
        };
        ['_PhysTable'] = {
        };
    };
    Wolf = {
        ['AIMovementAbility'] = {
            ['AIMovementSpeeds'] = {
                ['Relaxed'] = {
                    ['Run'] = {
                        [03] = 3;
                        [01] = 2.5;
                        [02] = 2;
                    };
                    ['Slow'] = {
                        [01] = 0.9;
                        [03] = 1.3;
                        [02] = 0.8;
                    };
                    ['Sprint'] = {
                        [02] = 5;
                        [01] = 7;
                        [03] = 8;
                    };
                    ['Walk'] = {
                        [01] = 1.5;
                        [03] = 2;
                        [02] = 1.3;
                    };
                };
            };
            ['avoidanceRadius'] = 1.5;
            ['b3DMove'] = 0;
            ['collisionAvoidanceParticipation'] = true;
            ['collisionAvoidanceRadiusIncrement'] = 0;
            ['cornerSlowDown'] = 0.75;
            ['dashPossibleCheckDistance'] = 12;
            ['dashPossibleCheckRequiredSpeedParam'] = 0.75;
            ['maneuverSpeed'] = 1.5;
            ['maneuverTrh'] = 2;
            ['maxAccel'] = 2;
            ['maxDecel'] = 4;
            ['maxTurnRadius'] = 3;
            ['minTurnRadius'] = 0;
            ['pathFindPrediction'] = 0.5;
            ['pathLookAhead'] = 1;
            ['pathRadius'] = 0.4;
            ['pathRegenIntervalDuringTrace'] = 4;
            ['pathSpeedLookAheadPerSpeed'] = '-1.5';
            ['pathType'] = 'AIPATH_HUMAN';
            ['resolveStickingInTrace'] = 1;
            ['runSpeed'] = 2.5;
            ['sprintSpeed'] = 7;
            ['usePredictiveFollowing'] = 1;
            ['velDecay'] = 0.5;
            ['walkSpeed'] = 1.5;
        };
        ['ActionController'] = 'Animations/Mannequin/ADB/kcd_dog_controllerdefs.xml';
        ['AddAnimalLootAction'] = function (...) end;
        ['AnimDatabase3P'] = 'Animations/Mannequin/ADB/kcd_dog_database.adb';
        ['CombatOpponentMnTag'] = 'oppDog';
        ['Editor'] = {
            ['Icon'] = 'User.bmp';
            ['IconOnTop'] = 1;
        };
        ['Event_Spawn'] = function (...) end;
        ['Event_SpawnKeep'] = function (...) end;
        ['Event_Spawn_Internal'] = function (...) end;
        ['Event_Spawned'] = function (...) end;
        ['Expose'] = function (...) end;
        ['FlowEvents'] = {
            ['Inputs'] = {
                ['Spawn'] = {
                    [02] = 'bool';
                    [01] = function (...) end;
                };
            };
            ['Outputs'] = {
                ['Spawned'] = 'entity';
            };
        };
        ['GetActions'] = function (...) end;
        ['GetDogActions'] = function (...) end;
        ['GetFlowgraphForwardingEntity'] = function (...) end;
        ['GetReturnToPoolWeight'] = function (...) end;
        ['InitialSetup'] = function (...) end;
        ['InteractorPriority'] = 2;
        ['IsAIControlled'] = function (...) end;
        ['IsChatUsable'] = 1;
        ['IsDogUsable'] = 1;
        ['IsUsable'] = function (...) end;
        ['NotifyRemoval'] = function (...) end;
        ['OnDestroy'] = function (...) end;
        ['OnDogRequest'] = function (...) end;
        ['OnEditorSetGameMode'] = function (...) end;
        ['OnLoadAI'] = function (...) end;
        ['OnPropertyChange'] = function (...) end;
        ['OnReset'] = function (...) end;
        ['OnSaveAI'] = function (...) end;
        ['OnSpawn'] = function (...) end;
        ['OnUsed'] = function (...) end;
        ['OpponentMnTag'] = 'relatedDog';
        ['ProceduralContextLook'] = {
            ['fadeInSeconds'] = 1;
            ['fadeOutMinDistance'] = 0;
            ['fadeOutSeconds'] = 1;
            ['polarCoordinatesMaxPitchDegreesPerSecond'] = 360;
            ['polarCoordinatesMaxYawDegreesPerSecond'] = 360;
            ['polarCoordinatesSmoothEnable'] = true;
            ['polarCoordinatesSmoothTimeSeconds'] = 0.2;
        };
        ['Properties'] = {
            ['CharacterSounds'] = {
                ['foleyEffect'] = 'foley_Dog';
                ['footstepEffect'] = 'footsteps_Dog';
            };
            ['ControlProfile'] = 0;
            ['LipSync'] = {
                ['TransitionQueueSettings'] = {
                    ['nAnimLayer'] = 12;
                    ['nCharacterSlot'] = 0;
                    ['playbackWeight'] = 0.75;
                    ['sDefaultAnimName'] = 'facial_chewing_01';
                };
                ['bEnabled'] = true;
                ['esLipSyncType'] = 'LipSync_TransitionQueue';
            };
            ['NPC'] = {
                ['aianchorHome'] = '';
                ['eiNPCCategory'] = 1;
            };
            ['Rendering'] = {
                ['bWrinkleMap'] = true;
            };
            ['Script'] = {
                ['Misc'] = '';
                ['bIdleUntilFirstPatch'] = false;
            };
            ['SpawnedEntityName'] = '';
            ['aicharacter_character'] = '';
            ['bCanHoldInformation'] = true;
            ['bExported_to_game'] = true;
            ['bExported_to_test'] = true;
            ['bInvulnerable'] = false;
            ['bIsDummy'] = false;
            ['bNotPlayerMountable'] = false;
            ['bSaved_by_game'] = true;
            ['bSpawner'] = false;
            ['bWH_ListenerObject'] = true;
            ['bWH_PerceptibleObject'] = true;
            ['bWH_PerceptorObject'] = true;
            ['bWH_RequiresHome'] = false;
            ['commrange'] = 30;
            ['eiColliderMode'] = 0;
            ['esBehaviorSelectionTree'] = '';
            ['esClothingConfig'] = 'wolf';
            ['esCommConfig'] = 'npc_default';
            ['esModularBehaviorTree'] = 'IdleSeq';
            ['esNavigationType'] = 'MediumSizedCharacters';
            ['esVoice'] = 'npc_default';
            ['fFmodCharacterTypeParam'] = 0;
            ['fileHitDeathReactionsParamsDataFile'] = 'Libs/HitDeathReactionsData/HitDeathReactions_Default.xml';
            ['fileModel'] = 'Objects/Characters/animals/wolf/wolf.cdf';
            ['guidSharedSoulId'] = '';
            ['nModelVariations'] = 0;
            ['physicMassMult'] = 1;
            ['sWH_AI_EntityCategory'] = '';
            ['sharedSoulInstanceId'] = 0;
        };
        ['PropertiesInstance'] = {
            ['aibehavior_behaviour'] = '';
            ['bAutoDisable'] = false;
            ['esVoice'] = '';
            ['nVariation'] = 0;
            ['soclasses_SmartObjectClass'] = '';
        };
        ['RegisterAI'] = function (...) end;
        ['Reset'] = function (...) end;
        ['ResetAIParameters'] = function (...) end;
        ['ResetCommon'] = function (...) end;
        ['ReviveInEditor'] = function (...) end;
        ['Server'] = {
            ['OnInit'] = function (...) end;
        };
        ['SetActorModel'] = function (...) end;
        ['UseMannequinAGState'] = true;
        ['ai'] = 1;
        ['collisionCapsule'] = {
            ['axis'] = {
                ['x'] = 0;
                ['y'] = 1;
                ['z'] = 0;
            };
            ['height'] = 0.53;
            ['pos'] = {
                ['x'] = 0;
                ['y'] = 0.05;
                ['z'] = 0.52;
            };
            ['posCarcass'] = {
                ['x'] = 0;
                ['y'] = 0.1;
                ['z'] = 0.08;
            };
            ['radius'] = 0.13;
        };
        ['collisionClass'] = 2.09715e+06;
        ['defaultSoulArchetype'] = 'Wolf';
        ['defaultSoulClass'] = 'wolf';
        ['gameParams'] = {
            ['animatedCharacterTurnSpeedSmoothingTime'] = 0.2;
            ['inertia'] = 0;
            ['inertiaAccel'] = 0;
            ['jumpHeight'] = 1;
            ['lookFOV'] = 180;
            ['stance'] = {
                ['carryCorpse'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'carryCorpse';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 9;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['combat'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'combat';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 0;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['crouch'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'crouch';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 1;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['injured'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'injured';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 7;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
                ['normal'] = {
                    ['heightCollider'] = 0.4;
                    ['heightPivot'] = 0;
                    ['name'] = 'normal';
                    ['size'] = {
                        ['x'] = 0.1;
                        ['y'] = 0;
                        ['z'] = 0.01;
                    };
                    ['stanceId'] = 3;
                    ['useCapsule'] = 0;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 0.5;
                    };
                };
                ['stoneThrowing'] = {
                    ['heightCollider'] = 1.05;
                    ['heightPivot'] = 0;
                    ['name'] = 'stoneThrowing';
                    ['size'] = {
                        ['x'] = 0.3;
                        ['y'] = 0;
                        ['z'] = 0.4;
                    };
                    ['stanceId'] = 2;
                    ['useCapsule'] = 1;
                    ['viewOffset'] = {
                        ['x'] = 0;
                        ['y'] = 0.1;
                        ['z'] = 1.6;
                    };
                };
            };
        };
        ['physicsParams'] = {
            ['Living'] = {
                ['air_resistance'] = 0.5;
                ['colliderMat'] = 'mat_player_collider';
                ['gravity'] = 30;
                ['inertia'] = 11;
                ['inertiaAccel'] = 11;
                ['k_air_control'] = 0.1;
                ['mass'] = 25;
                ['max_climb_angle'] = 89;
                ['max_jump_angle'] = 89;
                ['max_vel_ground'] = 16;
                ['min_fall_angle'] = 89;
                ['min_slide_angle'] = 89;
                ['timeImpulseRecover'] = 1;
            };
            ['additionalPhysicsMass'] = 1;
            ['flags'] = 0;
            ['mass'] = 25;
            ['stiffness_scale'] = 73;
        };
    };

} end