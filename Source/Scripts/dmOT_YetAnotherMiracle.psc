ScriptName dmOT_YetAnotherMiracle extends ActiveMagicEffect

GlobalVariable Property ORD_Enc_Miracle_Global_IsCompleted Auto
MiscObject Property Gold001 Auto
int Property PerkPointCost Auto
int Property DragonSoulsCost Auto
int Property SeptimsCost Auto
float Property SuccessRate Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If (ORD_Enc_Miracle_Global_IsCompleted.GetValue() == 0.0)
        Debug.Notification("You already have a discovery. Your next enchantment will perform a miracle.")
        return
    EndIf

    If (Game.GetPerkPoints() < PerkPointCost)
        Debug.Notification("You don't have enough Perk Points to offer.")
        return
    EndIf

    If (akTarget.GetAv("DragonSouls") < DragonSoulsCost)
        Debug.Notification("You don't have enough Dragon Souls to offer.")
        return
    EndIf

    MiscUtil.PrintConsole("Gold: " + akTarget.GetItemCount(Gold001))
    MiscUtil.PrintConsole("SeptimsCost: " + SeptimsCost)
    If (akTarget.GetItemCount(Gold001) < SeptimsCost)
        Debug.Notification("You don't have enough Septims to offer.")
        return
    EndIf

    If (Utility.RandomFloat() < 1 - SuccessRate)
        Debug.Notification("You failed to make a new discovery.")
    EndIf

    Game.ModPerkPoints(-PerkPointCost)
    akTarget.ModAV("DragonSouls", -DragonSoulsCost)
    akTarget.RemoveItem(Gold001, SeptimsCost)
    ORD_Enc_Miracle_Global_IsCompleted.SetValue(0)

    Debug.Notification("You have made a new discovery! Your next enchantment will perform a miracle.")
EndEvent
