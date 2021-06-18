.PHONY: deploy

init:
	git submodule update && git submodule init
	rm -f /Users/niquola/niquola/reveal/slides
	ln -s /Users/niquola/niquola/slides /Users/niquola/niquola/reveal/slides
	ln -s /Users/niquola/niquola/slides /Users/niquola/niquola/oldreveal/slides
	ln -s /Users/niquola/niquola/reveal/dist /Users/niquola/niquola/dist
	ln -s /Users/niquola/niquola/reveal/plugin /Users/niquola/niquola/plugin

run:
	cd reveal && npm start -- --port=8000

deploy:
	git clone git@github.com:niquola/niquola.github.io.git build || echo 'ok'
	cp -R reveal/dist build
	cp -R reveal/plugin build
	cp -R slides build
	cp -R oldreveal/old build/old
	cp index.html build
	cd build && touch .nojekyll
	cd build && git add . && git ci -m 'update' && git push --set-upstream origin main && git push --force

