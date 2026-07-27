DIM SUSPECT$(13)
DIM PERSON$(14)

LET SUSPECT_NAME$ = ""
GOSUB GET_SUSPECT_INFO

GOSUB OPEN_PERSONS_FILE

WHILE SUSPECT_NAME$ = ""
  GOSUB READ_PERSON_FROM_FILE
  GOSUB COMPARE_SUSPECT_TO_PERSON
WEND

PRINT "The killer is most likely "; SUSPECT_NAME$; "!"
END

COMPARE_SUSPECT_TO_PERSON:
  FOR I = 1 TO 13
    IF SUSPECT$(I) <> "Unknown" AND PERSON$(I + 1) <> "Unknown" THEN
      IF SUSPECT$(I) <> PERSON$(I + 1) THEN
        LET SUSPECT_NAME$ = ""
        RETURN
      END IF
    END IF
  NEXT I

  LET SUSPECT_NAME$ = PERSON$(1)
  RETURN

GET_SUSPECT_INFO:
  FOR I = 1 TO 13
    READ SUSPECT$(I)
  NEXT I
  RETURN

READ_PERSON_FROM_FILE:
  IF EOF(1) THEN
    PRINT "Could not find suspect in persons list, the killer will get away at this rate"
    END
  END IF

  FOR I = 1 TO 14
    LINE INPUT #1, L$
    LET COLON_INDEX = 1
    WHILE MID$(L$, COLON_INDEX, 1) <> ":"
      LET COLON_INDEX = COLON_INDEX + 1
    WEND
    LET PERSON$(I) = RIGHT$(L$, LEN(L$) - COLON_INDEX - 1)
  NEXT I

  IF EOF(1) THEN
    RETURN
  END IF

  LINE INPUT #1, L$
  RETURN

OPEN_PERSONS_FILE:
  OPEN "I", #1, "PersonsList.txt"
  RETURN

CLOSE_PERSONS_FILE:
  CLOSE #1
  RETURN

REM -- Suspect info that we know
REM -- Height, Hair color, Eye color, Hat size, Shoe size, Teeth marks, Cigar type, Facial scar, Hand scar
REM -- Eye patch, Bald patch, Leg limp, Tattoo
DATA Unknown, Unknown, Unknown, Unknown, 12, Gold-filled, Unknown, Unknown, Unknown
DATA Unknown, Unknown, Unknown, Unknown
