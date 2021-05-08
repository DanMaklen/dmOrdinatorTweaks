# [DM] Ordinator Tweaks
This is a Skyrim Mod. This is intended for personal use mostly.

## Changes
- *General*:
  - Hiding most magic effects from UI. (You already know what you picked).
- *Smithing*:
    - `Advanced Workshop`: Removed Lockout, can have both at the same time.
    - `Smithing Specialist`: Added additional ranks to unlock for all specializations.
- *Light Armor*:
    - `Hissing Dragon`: Added a power that lets you change the element once per day.
- *Lockpicking*:
    - `Nose of Treasure`: Added a power that lets you change the item once per day. Also fixed to use the correct LeveledList
- *Pickpocket*:
    - `Thief's Eye`: Added a power that lets you change the item once per day.
- *Destruction*:
    - `Elemental Specialization`: Added additional ranks to unlock all specializations.
- *Alteration*:
    - `Alter Self: Resistances`: Added additional ranks to unlock all resistances.
    - `Alter Self: Attributes`: Added additional ranks to unlock all attributes.
- `Miracle` 

## Clean Up
- `prkf_ord_smh40_advancedworks_0103bafe` script: Refactored.
- `qf_ord_advancedworkshop_ques_0103bb03` script: Fixed some papyrus errors.
- `ord_advancedworkshop_script` script: Cleaned up redundant code related to `Heart of the Creation` perk.
- `ORD_Smh_AdvancedWorkshop_Global_Type` Global Variable: Removed. No longer used.
- `ORD_Smh_AdvancedWorkshop_Global_Type_Lockout` Global Variable: Removed. No longer used.
- `ORD_Smh_AdvancedWorkshop_Spell_DisassemblePower` Spell and Effect: Removed. Unused.
- `ORD_Smh_AdvancedWorkshop_Package` Package: Removed. Unused.
- `ORD_Smh_AdvancedWorkshop_Message_Want` Message: Removed. Unused.
- `ORD_Smh_AdvancedWorkshop_Message_Ok` Message: Removed. Unused.
- `Iron Lore` Perk: Removed most of the unneded abilities and perks.
- `Iron Lore` Perk: Removed coupling between it and the specialization perks.

- `SneakDetector` mechanism: Partially replaced with `.IsSneaking()`