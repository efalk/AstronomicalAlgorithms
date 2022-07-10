
#CFLAGS = -O
#CFLAGS = -g
#CFLAGS = -g -Wall
CFLAGS = -g -Wall -Werror

CPPFLAGS = -DASTROALGO

SRCS = AstronomicalAlgorithms.c
OBJS = $(SRCS:.c=.o)

LIBSRCS = DateFromJulianDay.c DateFromYearDay.c DayOfWeek.c DayOfYear.c \
	EasterSunday.c GreenwichSideralTime.c InterpolationDifferences.c \
	IsLeapYear.c JulianDay.c MoonPhasesJDE.c RhoCosPhiTwo.c \
	RhoSinPhiTwo.c SolarCoordinates.c

LIBOBJS = $(LIBSRCS:.c=.o)

AstronomicalAlgorithms: ${OBJS} libastronomicalalgorithms.a
	${CC} -o $@ ${LDOPTIONS} ${OBJS} libastronomicalalgorithms.a -lm

libastronomicalalgorithms.a: ${LIBOBJS}
	-rm -f $@
	${AR} cru $@ ${LIBOBJS}
	ranlib $@
