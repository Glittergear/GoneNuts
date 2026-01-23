EXTEND_BOTTOM ~TRINNK01~ 1 14
	IF ~Global("GGNMQ","GLOBAL",1)~ THEN REPLY ~I'm looking for a woman named Tannia's friend. His name is Estelin, and he's a spellcaster with a drinking problem. Have you seen him?~  GOTO seenHim
END

APPEND TRINNK01

IF~~THEN BEGIN seenHim
	SAY ~Seen him? Yeah, I sure have. That mage can't hold his drink and caused all kinds of trouble until I kicked him out! Headed north, towards the fountain. Haven't seen him since. Didn't drown in the fountain though--we'd have seen the body. Maybe he wandered into the crypt and saved us the trouble of a burial. Maybe he had an arcane accident of some kind. Either way, good riddance, I say! Hate those types like him. But that's enough about that--if you ain't interested in a drink or a room, I've got other customers to help.~
	IF ~~ THEN DO ~SetGlobal("GGNMQ","GLOBAL",2) AddJournalEntry(@5101, QUEST) ~ EXIT
END

END
