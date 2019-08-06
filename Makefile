test:
ifeq ($(g),)
	node_modules/.bin/mocha --colors --check-leaks --require kaoscript/register --reporter spec "test/*.ks"
else
	node_modules/.bin/mocha --colors --check-leaks --require kaoscript/register --reporter spec -g "$(g)" "test/*.ks"
endif

coverage:
ifeq ($(g),)
	./node_modules/@zokugun/istanbul.cover/src/cli.js
else
	./node_modules/@zokugun/istanbul.cover/src/cli.js "$(g)"
endif

clean:
	npx kaoscript --clean

.PHONY: test coverage