ScriptName dmOT_SelectNPerks extends ActiveMagicEffect

Int property N auto
message property SelectionPrompt auto
Perk[] property PerkList auto

int[] selectedIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
    selectedIndex = PapyrusUtil.IntArray(N, -1)
	int i = 0
	While i < N
		selectedIndex[i] = SelectionPrompt.Show()
		akTarget.AddPerk(PerkList[selectedIndex[i]])
		i += 1
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int i = 0
	While i < N
		akTarget.RemovePerk(PerkList[selectedIndex[i]])
		i += 1
	EndWhile
EndEvent
