package tibia.game
{
   import shared.utility.Vector3D;
   import tibia.creatures.Creature;
   import mx.core.IUIComponent;
   import tibia.appearances.ObjectInstance;
   import tibia.worldmap.WorldMapStorage;
   import tibia.creatures.CreatureStorage;
   import tibia.creatures.Player;
   import tibia.container.ContainerStorage;
   import tibia.input.gameaction.PartyActionImpl;
   import tibia.input.gameaction.LookActionImpl;
   import tibia.input.gameaction.UseActionImpl;
   import tibia.input.gameaction.TurnActionImpl;
   import tibia.input.gameaction.BrowseFieldActionImpl;
   import tibia.appearances.AppearanceInstance;
   import tibia.input.gameaction.SafeTradeActionImpl;
   import tibia.input.gameaction.MoveActionImpl;
   import shared.utility.closure;
   import tibia.input.gameaction.PrivateChatActionImpl;
   import tibia.input.gameaction.BuddylistActionImpl;
   import tibia.input.gameaction.NameFilterActionImpl;
   import tibia.reporting.reportType.Type;
   import tibia.reporting.ReportWidget;
   import tibia.input.staticaction.StaticActionList;
   import flash.system.System;
   
   public class ObjectContextMenu extends ContextMenuBase
   {
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const SKILL_STAMINA:int = 16;
      
      protected static const STATE_NONE:int = -1;
      
      protected static const PROFESSION_PALADIN:int = 2;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
      
      protected static const SKILL_FIGHTSHIELD:int = 7;
      
      protected static const SKILL_FIGHTAXE:int = 11;
      
      protected static const WAR_NONE:int = 0;
      
      protected static const SKILL_FIGHTDISTANCE:int = 8;
      
      protected static const PK_EXCPLAYERKILLER:int = 5;
      
      protected static const NUM_CREATURES:int = 1300;
      
      protected static const NUM_TRAPPERS:int = 8;
      
      protected static const SKILL_FED:int = 14;
      
      protected static const SKILL_MAGLEVEL:int = 2;
      
      protected static const SKILL_SOULPOINTS:int = 15;
      
      protected static const SKILL_FISHING:int = 13;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_FAST:int = 6;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_NONE:int = -1;
      
      protected static const SKILL_OFFLINETRAINING:int = 17;
      
      private static const BUNDLE:String = "ObjectContextMenu";
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      protected static const MAX_NAME_LENGTH:int = 29;
      
      protected static const STATE_CURSED:int = 11;
      
      protected static const STATE_FREEZING:int = 9;
      
      protected static const PARTY_LEADER:int = 1;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
      
      protected static const STATE_PZ_ENTERED:int = 14;
      
      protected static const PROFESSION_NONE:int = 0;
      
      protected static const PK_ATTACKER:int = 1;
      
      protected static const STATE_ELECTRIFIED:int = 2;
      
      protected static const SKILL_FIGHTSWORD:int = 10;
      
      protected static const TYPE_MONSTER:int = 1;
      
      protected static const SKILL_CARRYSTRENGTH:int = 6;
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const STATE_FIGHTING:int = 7;
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
       
      private var m_LookTarget:Object = null;
      
      private var m_UseTarget:Object = null;
      
      private var m_Absolute:Vector3D = null;
      
      private var m_CreatureTarget:Creature = null;
      
      public function ObjectContextMenu(param1:Vector3D, param2:Object, param3:Object, param4:Creature)
      {
         super();
         if(param1 == null || param1.x == 65535 && param1.y == 0)
         {
            throw new ArgumentError("MapContextMenu.MapContextMenu: Invalid co-ordinate " + param1 + ".");
         }
         this.m_Absolute = param1;
         if(param2 == null)
         {
            throw new ArgumentError("MapContextMenu.MapContextMenu: Invalid look target.");
         }
         this.m_LookTarget = param2;
         if(param3 == null)
         {
            throw new ArgumentError("MapContextMenu.MapContextMenu: Invalid use target.");
         }
         this.m_UseTarget = param3;
         this.m_CreatureTarget = param4;
      }
      
      override public function display(param1:IUIComponent, param2:Number, param3:Number) : void
      {
         var _Creature:Creature = null;
         var a_Owner:IUIComponent = param1;
         var a_StageX:Number = param2;
         var a_StageY:Number = param3;
         var LookObj:ObjectInstance = this.m_LookTarget.object as ObjectInstance;
         var UseObj:ObjectInstance = this.m_UseTarget.object as ObjectInstance;
         var PartyAction:Function = function(param1:int, param2:Creature, param3:*):void
         {
            new PartyActionImpl(param1,param2).perform();
         };
         if(LookObj != null)
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_LOOK"),function(param1:*):void
            {
               if(m_LookTarget.object != null)
               {
                  new LookActionImpl(m_Absolute,m_LookTarget.object,m_LookTarget.position).perform();
               }
            });
         }
         if(UseObj != null && Boolean(UseObj.type.isContainer))
         {
            if(this.m_Absolute.x == 65535 && this.m_Absolute.y >= 64)
            {
               createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_OPEN"),function(param1:*):void
               {
                  if(m_UseTarget.object != null)
                  {
                     new UseActionImpl(m_Absolute,m_UseTarget.object,m_UseTarget.position,UseActionImpl.TARGET_AUTO).perform();
                  }
               });
               createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_OPEN_NEW_WINDOW"),function(param1:*):void
               {
                  if(m_UseTarget.object != null)
                  {
                     new UseActionImpl(m_Absolute,m_UseTarget.object,m_UseTarget.position,UseActionImpl.TARGET_NEW_WINDOW).perform();
                  }
               });
            }
            else
            {
               createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_OPEN"),function(param1:*):void
               {
                  if(m_UseTarget.object != null)
                  {
                     new UseActionImpl(m_Absolute,m_UseTarget.object,m_UseTarget.position,UseActionImpl.TARGET_NEW_WINDOW).perform();
                  }
               });
            }
         }
         if(UseObj != null && !UseObj.type.isContainer)
         {
            createTextItem(resourceManager.getString(BUNDLE,!!UseObj.type.isMultiUse?"CTX_OBJECT_MULTIUSE":"CTX_OBJECT_USE"),function(param1:*):void
            {
               if(m_UseTarget.object != null)
               {
                  new UseActionImpl(m_Absolute,m_UseTarget.object,m_UseTarget.position,UseActionImpl.TARGET_AUTO).perform();
               }
            });
         }
         if(UseObj != null && Boolean(UseObj.type.isRotateable))
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_TURN"),function(param1:*):void
            {
               if(m_UseTarget.object != null)
               {
                  new TurnActionImpl(m_Absolute,m_UseTarget.object,m_UseTarget.position).perform();
               }
            });
         }
         var _WorldMapStorage:WorldMapStorage = Tibia.s_GetWorldMapStorage();
         var Map:Vector3D = null;
         var FirstObj:ObjectInstance = null;
         if(this.m_Absolute.x != 65535 && _WorldMapStorage != null && (Map = _WorldMapStorage.toMap(this.m_Absolute)) != null && (FirstObj = _WorldMapStorage.getObject(Map.x,Map.y,Map.z,0)) != null && Boolean(FirstObj.type.isBank))
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_BROWSE_FIELD"),function(param1:*):void
            {
               new BrowseFieldActionImpl(m_Absolute).perform();
            });
         }
         createSeparatorItem();
         if(LookObj != null && LookObj.ID != AppearanceInstance.CREATURE && !LookObj.type.isUnmoveable && Boolean(LookObj.type.isTakeable))
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_TRADE"),function(param1:*):void
            {
               if(m_LookTarget.object != null)
               {
                  new SafeTradeActionImpl(m_Absolute,m_LookTarget.object,m_LookTarget.position).perform();
               }
            });
         }
         var _ContainerStorage:ContainerStorage = Tibia.s_GetContainerStorage();
         if(_ContainerStorage != null && LookObj != null && this.m_Absolute.x == 65535 && this.m_Absolute.y >= 64 && Boolean(_ContainerStorage.getContainerView(this.m_Absolute.y - 64).isSubContainer))
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_OBJECT_MOVE_UP"),function(param1:*):void
            {
               var _loc2_:Vector3D = null;
               if(m_LookTarget.object != null)
               {
                  _loc2_ = new Vector3D(m_Absolute.x,m_Absolute.y,254);
                  new MoveActionImpl(m_Absolute,m_LookTarget.object,m_LookTarget.position,_loc2_,MoveActionImpl.MOVE_ALL).perform();
               }
            });
         }
         var _CreatureStorage:CreatureStorage = Tibia.s_GetCreatureStorage();
         var _Player:Player = Tibia.s_GetPlayer();
         if(_CreatureStorage != null && _Player != null && this.m_CreatureTarget != null && this.m_CreatureTarget.ID != _Player.ID)
         {
            _Creature = _CreatureStorage.getAttackTarget();
            createTextItem(resourceManager.getString(BUNDLE,_Creature != null && _Creature.ID == this.m_CreatureTarget.ID?"CTX_CREATURE_ATTACK_STOP":"CTX_CREATURE_ATTACK_START"),closure(null,function(param1:CreatureStorage, param2:Creature, param3:*):void
            {
               param1.toggleAttackTarget(param2,true);
            },_CreatureStorage,this.m_CreatureTarget));
            _Creature = _CreatureStorage.getFollowTarget();
            createTextItem(resourceManager.getString(BUNDLE,_Creature != null && _Creature.ID == this.m_CreatureTarget.ID?"CTX_CREATURE_FOLLOW_STOP":"CTX_CREATURE_FOLLOW_START"),closure(null,function(param1:CreatureStorage, param2:Creature, param3:*):void
            {
               param1.toggleFollowTarget(param2,true);
            },_CreatureStorage,this.m_CreatureTarget));
            if(this.m_CreatureTarget.isHuman)
            {
               createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_CHAT_MESSAGE",[this.m_CreatureTarget.name]),function(param1:*):void
               {
                  if(m_CreatureTarget != null)
                  {
                     new PrivateChatActionImpl(PrivateChatActionImpl.OPEN_MESSAGE_CHANNEL,m_CreatureTarget.name).perform();
                  }
               });
               if(Tibia.s_GetChatStorage().hasOwnPrivateChannel)
               {
                  createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_CHAT_INVITE"),function(param1:*):void
                  {
                     if(m_CreatureTarget != null)
                     {
                        new PrivateChatActionImpl(PrivateChatActionImpl.CHAT_CHANNEL_INVITE,m_CreatureTarget.name).perform();
                     }
                  });
               }
               if(!BuddylistActionImpl.s_IsBuddy(this.m_CreatureTarget.ID))
               {
                  createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_ADD_BUDDY"),function(param1:*):void
                  {
                     if(m_CreatureTarget != null)
                     {
                        new BuddylistActionImpl(BuddylistActionImpl.ADD_BY_NAME,m_CreatureTarget.name).perform();
                     }
                  });
               }
               if(NameFilterActionImpl.s_IsBlacklisted(this.m_CreatureTarget.name))
               {
                  createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_UNIGNORE",[this.m_CreatureTarget.name]),function(param1:*):void
                  {
                     if(m_CreatureTarget != null)
                     {
                        new NameFilterActionImpl(NameFilterActionImpl.UNIGNORE,m_CreatureTarget.name).perform();
                     }
                  });
               }
               else
               {
                  createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_IGNORE",[this.m_CreatureTarget.name]),function(param1:*):void
                  {
                     if(m_CreatureTarget != null)
                     {
                        new NameFilterActionImpl(NameFilterActionImpl.IGNORE,m_CreatureTarget.name).perform();
                     }
                  });
               }
               switch(_Player.partyFlag)
               {
                  case PARTY_LEADER:
                     if(this.m_CreatureTarget.partyFlag == PARTY_MEMBER)
                     {
                        createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_EXCLUDE",[this.m_CreatureTarget.name]),closure(null,PartyAction,PartyActionImpl.EXCLUDE,this.m_CreatureTarget));
                     }
                     break;
                  case PARTY_LEADER_SEXP_ACTIVE:
                  case PARTY_LEADER_SEXP_INACTIVE_GUILTY:
                  case PARTY_LEADER_SEXP_INACTIVE_INNOCENT:
                  case PARTY_LEADER_SEXP_OFF:
                     if(this.m_CreatureTarget.partyFlag == PARTY_MEMBER)
                     {
                        createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_EXCLUDE",[this.m_CreatureTarget.name]),closure(null,PartyAction,PartyActionImpl.EXCLUDE,this.m_CreatureTarget));
                     }
                     else if(this.m_CreatureTarget.partyFlag == PARTY_MEMBER_SEXP_OFF || this.m_CreatureTarget.partyFlag == PARTY_MEMBER_SEXP_ACTIVE || this.m_CreatureTarget.partyFlag == PARTY_MEMBER_SEXP_INACTIVE_GUILTY || this.m_CreatureTarget.partyFlag == PARTY_MEMBER_SEXP_INACTIVE_INNOCENT)
                     {
                        createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_PASS_LEADERSHIP",[this.m_CreatureTarget.name]),closure(null,PartyAction,PartyActionImpl.PASS_LEADERSHIP,this.m_CreatureTarget));
                     }
                     else
                     {
                        createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_INVITE",[this.m_CreatureTarget.name]),closure(null,PartyAction,PartyActionImpl.INVITE,this.m_CreatureTarget));
                     }
                     break;
                  case PARTY_MEMBER_SEXP_ACTIVE:
                  case PARTY_MEMBER_SEXP_INACTIVE_GUILTY:
                  case PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:
                  case PARTY_MEMBER_SEXP_OFF:
                     break;
                  case PARTY_NONE:
                  case PARTY_MEMBER:
                     if(this.m_CreatureTarget.partyFlag == PARTY_LEADER)
                     {
                        createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_JOIN",[this.m_CreatureTarget.name]),closure(null,PartyAction,PartyActionImpl.JOIN,this.m_CreatureTarget));
                     }
                     else
                     {
                        createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_INVITE",[this.m_CreatureTarget.name]),closure(null,PartyAction,PartyActionImpl.INVITE,this.m_CreatureTarget));
                     }
               }
            }
            createSeparatorItem();
            if(this.m_CreatureTarget.isReportTypeAllowed(Type.REPORT_NAME))
            {
               createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_REPORT_NAME"),function(param1:*):void
               {
                  if(m_CreatureTarget != null)
                  {
                     new ReportWidget(Type.REPORT_NAME,m_CreatureTarget).show();
                  }
               });
            }
            if(this.m_CreatureTarget.isReportTypeAllowed(Type.REPORT_BOT))
            {
               createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_REPORT_BOT"),function(param1:*):void
               {
                  if(m_CreatureTarget != null)
                  {
                     new ReportWidget(Type.REPORT_BOT,m_CreatureTarget).show();
                  }
               });
            }
         }
         createSeparatorItem();
         if(this.m_CreatureTarget != null && this.m_CreatureTarget.ID == _Player.ID)
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_PLAYER_SET_OUTFIT"),function(param1:*):void
            {
               StaticActionList.MISC_SHOW_OUTFIT.perform();
            });
            createTextItem(resourceManager.getString(BUNDLE,_Player.mountOutfit == null?"CTX_PLAYER_MOUNT":"CTX_PLAYER_DISMOUNT"),function(param1:*):void
            {
               StaticActionList.PLAYER_MOUNT.perform();
            });
            if(Boolean(_Player.isPartyLeader) && !_Player.isFighting)
            {
               if(_Player.isPartySharedExperienceActive)
               {
                  createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_DISABLE_SHARED_EXPERIENCE"),closure(null,PartyAction,PartyActionImpl.DISABLE_SHARED_EXPERIENCE,null));
               }
               else
               {
                  createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_ENABLE_SHARED_EXPERIENCE"),closure(null,PartyAction,PartyActionImpl.ENABLE_SHARED_EXPERIENCE,null));
               }
            }
            if(Boolean(_Player.isPartyMember) && !_Player.isFighting)
            {
               createTextItem(resourceManager.getString(BUNDLE,"CTX_PARTY_LEAVE"),closure(null,PartyAction,PartyActionImpl.LEAVE,null));
            }
         }
         createSeparatorItem();
         if(this.m_CreatureTarget != null)
         {
            createTextItem(resourceManager.getString(BUNDLE,"CTX_CREATURE_COPY_NAME"),function(param1:*):void
            {
               if(m_CreatureTarget != null)
               {
                  System.setClipboard(m_CreatureTarget.name);
               }
            });
         }
         super.display(a_Owner,a_StageX,a_StageY);
      }
   }
}