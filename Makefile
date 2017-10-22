.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	litecore-wallet-client.min.js

clean:
	rm litecore-wallet-client.js
	rm litecore-wallet-client.min.js

litecore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

litecore-wallet-client.min.js: litecore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
