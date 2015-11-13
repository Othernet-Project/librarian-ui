COFFEE_SRC = src/coffee
DEMO_COFFEE_SRC = demo/src/coffee
JSDIR = librarian_ui/static/js
SCSS_SRC = src/scss
COMPASS_CONF = conf/config.rb
SCRIPTS = scripts
EXCLUDE = vendor

COMPASS_PID = .compass_pid
COFFEE_PID = .coffee_pid

.PHONY: watch stop restart recompile

watch: $(COMPASS_PID) $(COFFEE_PID)

stop:
	$(SCRIPTS)/compass.sh stop $(COMPASS_PID)
	$(SCRIPTS)/coffee.sh stop $(COFFEE_PID)

restart: stop watch

recompile: 
	compass compile --force -c $(COMPASS_CONF)
	# NOT USED: compass compile --force -c $(DEMO_COMPASS_CONF)
	find $(JSDIR) -path $(JSDIR)/$(EXCLUDE) -prune -o -name "*.js" -exec rm {} +
	coffee --bare -c --output $(JSDIR) $(COFFEE_SRC)

$(COMPASS_PID): $(SCRIPTS)/compass.sh
	$< start $@ $(COMPASS_CONF)

$(COFFEE_PID): $(SCRIPTS)/coffee.sh
	$< start $@ $(COFFEE_SRC) $(JSDIR)
