# Simple Makefile for building teaching material as a static html slideshow

FLAGS=--ExecutePreprocessor.enabled=True --ExecutePreprocessor.allow_errors=True\
		--ExecutePreprocessor.timeout=300

NOTEBOOKS=exercises/01-Classes_basics.html \
		  exercises/02-Classes_pt2.html exercises/03-Predator_prey.html \
		  soln/01-Classes_basics.html \
		  soln/02-Classes_pt2.html soln/03-Predator_prey.html \

slides: $(NOTEBOOKS) 
	jupyter nbconvert --to slides $(FLAGS) index --reveal-prefix http://cdn.jsdelivr.net/reveal.js/2.6.2

serve:
	jupyter nbconvert --to slides $(FLAGS) index --post serve

html: $(NOTEBOOKS)
	jupyter nbconvert --to html $(FLAGS) index

%.html: %.ipynb
	jupyter nbconvert --to html $(FLAGS) $< --output $@

clean:
	rm Index.slides.html