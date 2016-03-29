Objs            = Amc13Description.o Amc13Interface.o Amc13CU.o
CC              = gcc
CXX             = g++
CCFlags         = -g -O1 -w -Wall -pedantic -fPIC -Wcpp
#DevFlags                   = -D__CBCDAQ_DEV__

AMC13DIR=/opt/cactus/include/amc13

IncludeDirs     =  /opt/cactus/include
IncludePaths            = $(IncludeDirs:%=-I%)

LibraryDirs = /opt/cactus/lib
LibraryPaths = $(LibraryDirs:%=-L%)

ExternalObjects = $(LibraryPaths) -lcactus_uhal_log -lcactus_uhal_grammars -lcactus_uhal_uhal -lboost_system -lcactus_amc13_amc13

.PHONY: clean

%.o: %.cc %.h
	$(CXX) -std=c++0x  $(DevFlags) $(CCFlags) $(UserCCFlags) $(CCDefines) $(IncludePaths) $(ExternalObjects) -c -o $@ $<

all: Amc13CU.exe

Amc13CU.exe: $(Objs) 
	$(CXX) -o $@ $(Objs) $(ExternalObjects)

clean:
	rm -f *.o
