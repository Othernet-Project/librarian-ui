COFFEE_SRC = src/coffee
DEMO_COFFEE_SRC = demo/src/coffee
JSDIR = librarian_ui/static/js
DEMO_JSDIR = demo/static/js
SCSS_SRC = src/scss
DEMO_SCSS_SRC = demo/src/scss
COMPASS_CONF = conf/config.rb
DEMO_COMPASS_CONF = demo/conf/config.rb
SCRIPTS = scripts
EXCLUDE = vendors

COMPASS_PID = .compass_pid
DEMO_COMPASS_PID = .compass_demo_pid
COFFEE_PID = .coffee_pid
DEMO_COFFEE_PID = .coffee_demo_pid

.PHONY: watch stop restart recompile

watch: $(COMPASS_PID) $(COFFEE_PID) $(DEMO_COMPASS_PID) $(DEMO_COFFEE_PID)

stop:
	$(SCRIPTS)/compass.sh stop $(COMPASS_PID)
	$(SCRIPTS)/coffee.sh stop $(COFFEE_PID)
	$(SCRIPTS)/compass.sh stop $(DEMO_COMPASS_PID)
	$(SCRIPTS)/coffee.sh stop $(DEMO_COFFEE_PID)

restart: stop watch

recompile: 
	compass compile --force -c $(COMPASS_CONF)
	find $(JSDIR) -path $(JSDIR)/$(EXCLUDE) -prune -o -name "*.js" -exec rm {} +
	coffee --bare -c --output $(JSDIR) $(COFFEE_SRC)

$(COMPASS_PID): $(SCRIPTS)/compass.sh
	$< start $@ $(COMPASS_CONF)

$(COFFEE_PID): $(SCRIPTS)/coffee.sh
	$< start $@ $(COFFEE_SRC) $(JSDIR)

$(DEMO_COMPASS_PID): $(SCRIPTS)/compass.sh
	$< start $@ $(DEMO_COMPASS_CONF)

$(DEMO_COFFEE_PID): $(SCRIPTS)/coffee.sh
	$< start $@ $(DEMO_COFFEE_SRC) $(JSDIR)
