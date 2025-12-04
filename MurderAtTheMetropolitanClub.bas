REM -- We don't know who the murderer is yet, so just assign -1
LET murderer = -1

REM -- Results will be stored in a two dimensional table
REM -- Rows are suspects from 1 - 4:
REM -- 1 - Colonel Woodley
REM -- 2 - Mr. Holman
REM -- 3 - Mr. Pope
REM -- 4 - Sir Raymond
REM -- Columns are specific attributes:
REM -- 1 - Hair Color
REM -- 2 - Attire
REM -- 3 - Room
DIM TABLE$(4, 3)
LET MURDERER = -1

FOR I = 1 TO 4
	FOR J = 1 TO 3
		TABLE$(I, J) = "UNKNOWN"
	NEXT J
NEXT I

REM -- Initial conditions
REM -- Sir Raymond in room 10
LET TABLE$(4, 3) = "10"
REM -- Mr. Pope has gold watch
LET TABLE$(3, 2) = "GOLD_WATCH"
REM -- Mr. Holman has ruby ring
LET TABLE$(2, 2) = "RUBY_RING"
REM -- Mr. Holman in room 12
LET TABLE$(2, 3) = "12"

WHILE MURDERER = -1
	REM -- If suspect in room 14, set hair color to black
	FOR I = 1 TO 4
		IF TABLE$(I, 3) = "14" THEN
			LET TABLE$(I, 1) = "BLACK"
		END IF
	NEXT I

	REM -- If Sir Raymond is not wearing the pince-nez, Colonel Woodley is
	IF TABLE$(4, 2) <> "UNKNOWN" THEN
		IF TABLE$(4, 2) <> "PINCENEZ" THEN
			LET TABLE$(1, 2) = "PINCENEZ"
		END IF
	END IF

	REM -- If Colonel Woodley is not wearing the pince-nez, Sir Raymond is
	IF TABLE$(1, 2) <> "UNKNOWN" THEN
		IF TABLE$(1, 2) <> "PINCENEZ" THEN
			LET TABLE$(4, 2) = "PINCENEZ"
		END IF
	END IF

	FOR I = 1 TO 4
		REM -- If a suspect is wearing a pince-nez, his hair is brown
		IF TABLE$(I, 2) = "PINCENEZ" THEN
			LET TABLE$(I, 1) = "BROWN"
		END IF

		REM -- If a suspect is wearing tattered cuffs, his hair is red
		IF TABLE$(I, 2) = "TATTERED_CUFFS" THEN
			LET TABLE$(I, 1) = "RED"
		END IF

		REM -- If a suspect is in room 16, he is wearing tattered cuffs
		IF TABLE$(I, 3) = "16" THEN
			LET TABLE$(I, 2) = "TATTERED_CUFFS"
		END IF

		REM -- If a suspect is in room 12, he has gray hair
		IF TABLE$(I, 3) = "12" THEN
			LET TABLE$(I, 1) = "GRAY"
		END IF

		REM -- If a suspect is wearing a gold watch, he is in room 14
		IF TABLE$(I, 2) = "GOLD_WATCH" THEN
			LET TABLE$(I, 3) = "14"
		END IF

		REM -- Colonel Woodley is in one of two corner rooms (10 or 16)
		REM -- If a suspect is in room 10, and is not Colonel Woodley, then Colonel Woodley is in room 16
		IF TABLE$(I, 3) = "10" THEN
			IF I <> 1 THEN
				LET TABLE$(1, 3) = "16"
			END IF
		END IF

		REM -- If a suspect is in room 16, and is not Colonel Woodley, then Colonel Woodley is in room 10
		IF TABLE$(I, 3) = "16" THEN
			IF I <> 1 THEN
				LET TABLE$(1, 3) = "10"
			END IF
		END IF

		REM - Murderer's hair is brown
		IF TABLE$(I, 1) = "BROWN" THEN
			LET MURDERER = I
		END IF
	NEXT I
WEND

IF MURDERER = 1 THEN
	PRINT "Colonel Woodley did it!"
END IF

IF MURDERER = 2 THEN
	PRINT "Mr. Holman did it!"
END IF

IF MURDERER = 3 THEN
	PRINT "Mr. Pope did it!"
END IF

IF MURDERER = 4 THEN
	PRINT "Sir Raymond did it!"
END IF

