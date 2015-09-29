COFFEE_SRC = src/coffee
JSDIR = librarian_ui/static/js
SCSS_SRC = src/scss
COMPASS_CONF = conf/compass.rb
SCRIPTS = scripts

COMPASS_PID = .compass_pid
COFFEE_PID = .coffee_pid

.PHONY: watch stop restart

watch: $(COMPASS_PID) $(COFFEE_PID)

stop:
	$(SCRIPTS)/compass.sh stop $(COMPASS_PID)
	$(SCRIPTS)/coffee.sh stop $(COFFEE_PID)

restart: stop watch

$(COMPASS_PID): $(SCRIPTS)/compass.sh
	$< start $@ $(COMPASS_CONF)

$(COFFEE_PID): $(SCRIPTS)/coffee.sh
	$< start $@ $(COFFEE_SRC) $(JSDIR)

