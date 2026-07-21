REM -- Takes in the initial day of the week (eg. Monday) that is at the start of the year and whether
REM -- the year is a leap year, as well as the day of the year (1 - 365).

REM -- Returns the day after X days have passed, as well as the numbered date/month

PRINT "Requires Day_Of_The_Week, Leap_Year_Y_N, Day_Of_The_Year"
INPUT DAY$, LEAP_YEAR, TOTAL_DAYS

DIM DAY_BANK$(7)
LET DAY_BANK$(0) = "Monday"
LET DAY_BANK$(1) = "Tuesday"
LET DAY_BANK$(2) = "Wednesday"
LET DAY_BANK$(3) = "Thursday"
LET DAY_BANK$(4) = "Friday"
LET DAY_BANK$(5) = "Saturday"
LET DAY_BANK$(6) = "Sunday"

DIM MONTH_NAME$(12)
LET MONTH_NAME$(0) = "January"
LET MONTH_NAME$(1) = "February"
LET MONTH_NAME$(2) = "March"
LET MONTH_NAME$(3) = "April"
LET MONTH_NAME$(4) = "May"
LET MONTH_NAME$(5) = "June"
LET MONTH_NAME$(6) = "July"
LET MONTH_NAME$(7) = "August"
LET MONTH_NAME$(8) = "September"
LET MONTH_NAME$(9) = "October"
LET MONTH_NAME$(10) = "November"
LET MONTH_NAME$(11) = "December"

DIM MONTH_DAYS(12)
LET MONTH_DAYS(0) = 31
LET MONTH_DAYS(1) = 28
IF LEAP_YEAR = 1 THEN
  MONTH_DAYS(1) = 29
END IF
LET MONTH_DAYS(2) = 31
LET MONTH_DAYS(3) = 30
LET MONTH_DAYS(4) = 31
LET MONTH_DAYS(5) = 30
LET MONTH_DAYS(6) = 31
LET MONTH_DAYS(7) = 31
LET MONTH_DAYS(8) = 30
LET MONTH_DAYS(9) = 31
LET MONTH_DAYS(10) = 30
LET MONTH_DAYS(11) = 31

LET DAY_INT = 0

IF DAY$ = "Monday" THEN
  LET DAY_INT = 0
ELSEIF DAY$ = "Tuesday" THEN
  LET DAY_INT = 1
ELSEIF DAY$ = "Wednesday" THEN
  LET DAY_INT = 2
ELSEIF DAY$ = "Thursday" THEN
  LET DAY_INT = 3
ELSEIF DAY$ = "Friday" THEN
  LET DAY_INT = 4
ELSEIF DAY$ = "Saturday" THEN
  LET DAY_INT = 5
ELSEIF DAY$ = "Sunday" THEN
  LET DAY_INT = 6
END IF

LET MONTH_COUNTER = 0
LET CURRENT_DAYS_IN_MONTH = 1
REM -- This variable is to make explicit we're handling days as if they are adding on to
REM -- January 1st. The first of January is the first day of the year, so we subtract one
REM -- to account for that.
LET TOTAL_DAYS_ADDED = TOTAL_DAYS - 1
LET TEMP_DAYS = TOTAL_DAYS_ADDED
WHILE TEMP_DAYS > 0
  LET TEMP_DAYS = TEMP_DAYS - 1
  LET CURRENT_DAYS_IN_MONTH = CURRENT_DAYS_IN_MONTH + 1
  
  IF CURRENT_DAYS_IN_MONTH > MONTH_DAYS(MONTH_COUNTER) THEN
    LET MONTH_COUNTER = MONTH_COUNTER + 1
    LET CURRENT_DAYS_IN_MONTH = 1
  END IF
WEND

LET OFFSET_DAYS = TOTAL_DAYS_ADDED + DAY_INT
LET PLANNED_DOTW = OFFSET_DAYS - (INT(OFFSET_DAYS / 7) * 7)
PRINT "The heist shall happen on "; MONTH_NAME$(MONTH_COUNTER); " "; CURRENT_DAYS_IN_MONTH; ", on a "; DAY_BANK$(PLANNED_DOTW); "!"
