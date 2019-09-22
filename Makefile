RESOURCES=$(shell ./list-resources)

# $(info $(RESOURCES))

all: index.html $(RESOURCES)

index.html: README.md style.css refresh-on-change.js ./node_modules/.bin/markdown-to-slides
	./node_modules/.bin/markdown-to-slides -t "$(shell basename `pwd` | tr '-' ' ')" -i README.md -o index.html -s style.css -j refresh-on-change.js

README.md: ~/.config/joplin-desktop/edit-e7faf8f8039c421d8566c1d65fdb98d5.md
	cp $< $@

resources/%: ~/.config/joplin-desktop/resources/%
	cp $< $@

./node_modules/.bin/markdown-to-slides:
	npm i markdown-to-slides

serve:
	python -m http.server

watch:
	while true; do $(MAKE) -q || $(MAKE); sleep 0.1; done

watch-and-serve:
	$(MAKE) -j2 watch serve
