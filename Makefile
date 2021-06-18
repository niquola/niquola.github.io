.PHONY: deploy

init:
	rm -f /Users/niquola/niquola/reveal/slides
	echo 'hello' && ln -s /Users/niquola/niquola/slides /Users/niquola/niquola/reveal/slides

run:
	cd reveal && npm start -- --port=8000

deploy:
	git clone git@github.com:niquola/niquola.github.io.git build || echo 'ok'
	cp -R reveal/dist build
	cp -R reveal/plugin build
	cp -R slides build
	cp index.html build
	cd build && touch .nojekyll
	cd build && git add . && git ci -m 'update' && git push --set-upstream origin main && git push --force

