ENGINE=docker
IMAGE=php_app
APP_NAME=example
RUN_FLAGS=-it --rm
#RUN_FLAGS=-d
PORT=8000

build:
	$(ENGINE) build -t $(IMAGE) .

serve:
	$(ENGINE) run $(RUN_FLAGS) -p $(PORT):80 -v $(PWD)/app:/var/www/app -v $(PWD)/logs:/var/log/app --name $(APP_NAME) $(IMAGE) serve

simple:
	$(ENGINE) run $(RUN_FLAGS) -p $(PORT):80 -v $(PWD)/app:/var/www/app -v $(PWD)/logs:/var/log/app --name $(APP_NAME) $(IMAGE) simple

bash:
	$(ENGINE) run $(RUN_FLAGS) -v $(PWD)/app:/var/www/app -v $(PWD)/logs:/var/log/app --name $(APP_NAME) $(IMAGE) bash

stop:
	$(ENGINE) container rm -f $(APP_NAME)
