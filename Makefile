CXX_FLAGS := -O2 -DNDEBUG -Wall -g -march=core2 -std=c++11
CXX       := g++
VPATH	:= dispatcher	timerGUI
INSTALL_DIR := ./
export CXX
export CXX_FLAGS

all:	timer timer-gui

timer-gui: finalTimer.pro mainwindow.ui dependent.ui singletimer.ui
	qmake timerGUI/finalTimer.pro -o timerGUI/Makefile
	$(MAKE) -C timerGUI
	mv timerGUI/$@ ${INSTALL_DIR}

timer:
		$(MAKE) -C dispatcher
		mv dispatcher/$@ ${INSTALL_DIR}

clean:
		-$(MAKE) clean -C timerGUI
		-$(MAKE) clean -C dispatcher
	
	
		
