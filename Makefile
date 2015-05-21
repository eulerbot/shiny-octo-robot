CPP      = /usr/local/bin/gcc-5
CPPFLAGS = -g -O -Wall -Werror
CPPINC   = -I/usr/include #-I/Users/logansailer/Documents/Work/REFPROP/shiny-octo-robot
GF			= gfortran
#GFFLAGS  =
LIBDIR   = -L/opt/local/lib -L/Users/logansailer/Documents/Work/REFPROP/shiny-octo-robot -L/usr/local/Cellar/gcc/5.1.0/lib/gcc/5
LIBS		= -linline -lfinline -lgfortran
EXE      = test.out

all: main inline finline

main: main.o inline finline.o
	$(CPP) $(LIBDIR) -o $(EXE) main.o $(LIBS)

main.o: main.c
	$(CPP) $(CPPFLAGS) $(CPPINC) -c $<

inline: inline.o
	$(CPP) -shared -o libinline.so $<

inline.o: inline.c
	$(CPP) $(CPPFLAGS) $(CPPINC) -c -fpic $<

finline.o: finline.f90
	$(GF) -c $<

finline: finline.o
	ar cru libfinline.a $<

clean:
	rm *.out *.o *.so *.a