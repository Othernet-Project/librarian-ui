COFFEE_SRC = src/coffee
DEMO_COFFEE_SRC = demo/src/coffee
JSDIR = librarian_ui/static/js
DEMO_JSDIR = demo/static/js
SCSS_SRC = src/scss
COMPASS_CONF = conf/compass.rb
SCRIPTS = scripts

COMPASS_PID = .compass_pid
COFFEE_PID = .coffee_pid
DEMO_COFFEE_PID = .coffee_demo_pid

.PHONY: watch stop restart

watch: $(COMPASS_PID) $(COFFEE_PID) $(DEMO_COFFEE_PID)

stop:
	$(SCRIPTS)/compass.sh stop $(COMPASS_PID)
	$(SCRIPTS)/coffee.sh stop $(COFFEE_PID)
	$(SCRIPTS)/coffee.sh stop $(DEMO_COFFEE_PID)

restart: stop watch

$(COMPASS_PID): $(SCRIPTS)/compass.sh
	$< start $@ $(COMPASS_CONF)

$(COFFEE_PID): $(SCRIPTS)/coffee.sh
	$< start $@ $(COFFEE_SRC) $(JSDIR)

$(DEMO_COFFEE_PID): $(SCRIPTS)/coffee.sh
	$< start $@ $(DEMO_COFFEE_SRC) $(JSDIR)
