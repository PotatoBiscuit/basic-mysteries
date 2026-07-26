GOSUB BASIC_INFO
GOSUB SUBJECT_DESCRIPTION
GOSUB LAB_REPORT
GOSUB BODY_DAMAGE
GOSUB CORONER_REMARKS
END

BASIC_INFO:
  PRINT "Basic info:"
  DIM BASIC_INFO$(3)
  FOR I = 1 TO 3 
    READ BASIC_INFO$(I)
  NEXT I
  PRINT "    Coroner's name: "; BASIC_INFO$(1)
  PRINT "    Subject's name: "; BASIC_INFO$(2)
  PRINT "    Subject's age : "; BASIC_INFO$(3); CHR$(10)
  RETURN

SUBJECT_DESCRIPTION:
  PRINT "Detailed Subject Description:"
  DIM SUBJECT_INFO$(4)
  FOR I = 1 TO 4
    READ SUBJECT_INFO$(I)
  NEXT I
  PRINT "    Height    : "; SUBJECT_INFO$(1); " inches"
  PRINT "    Hair color: "; SUBJECT_INFO$(2)
  PRINT "    Eye color : "; SUBJECT_INFO$(3)
  PRINT "    Sex       : "; SUBJECT_INFO$(4); CHR$(10)
  RETURN

LAB_REPORT:
  PRINT "Lab tests:"
  DIM LAB_INFO$(4)
  FOR I = 1 TO 4
    READ LAB_INFO$(I)
  NEXT I
  PRINT "    Alcohol test    : "; LAB_INFO$(1)
  PRINT "    Salicylates     : "; LAB_INFO$(2)
  PRINT "    Morphine in bile: "; LAB_INFO$(3)
  PRINT "    Gastric content : "; LAB_INFO$(4); CHR$(10)
  RETURN

BODY_DAMAGE:
  PRINT "Damage to body:"
  DIM BODY_INFO$(5)
  FOR I = 1 TO 5
    READ BODY_INFO$(I)
  NEXT I
  PRINT "    Bruises     : "; BODY_INFO$(1)
  PRINT "    Lacerations : "; BODY_INFO$(2)
  PRINT "    Lesions     : "; BODY_INFO$(3)
  PRINT "    Haemorrhages: "; BODY_INFO$(4)
  PRINT "    Fractures   : "; BODY_INFO$(5); CHR$(10)
  RETURN

CORONER_REMARKS:
  PRINT "Coroner's observations:"
  DIM OBSERVATIONS$(3)
  FOR I = 1 TO 3
    READ OBSERVATIONS$(I)
  NEXT I
  PRINT "    "; OBSERVATIONS$(1)
  PRINT "    "; OBSERVATIONS$(2)
  PRINT "    "; OBSERVATIONS$(3)
  RETURN

DATA "Dr. Harrison", "Colin Wiggs", "42", "68", "Black", "Grey", "Male"
DATA "Negative", "Negative", "+", "Negative for organic bases", "Face, neck"
DATA "None", "Neck", "None", "Upper windpipe"
DATA "Subject was apparently struck on the left side of the neck."
DATA "Double fracture of the upper windpipe, just below the larynx,"
DATA "suggesting strangulation. A small scar was detected on the left shoulder."

