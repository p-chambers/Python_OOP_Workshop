# Simple Makefile for building teaching material as a static html slideshow

FLAGS=--ExecutePreprocessor.enabled=True --ExecutePreprocessor.allow_errors=True

#NOTEBOOKS=exercises/01-dtypes.html

slides:
	jupyter nbconvert --to slides $(FLAGS) Index

serve:
	jupyter nbconvert --to slides $(FLAGS) Index --post serve

html:
	jupyter nbconvert --to html $(FLAGS) Index

%.html: %.ipynb
	jupyter nbconvert --to html $(FLAGS) $< --output $@

clean:
	rm Index.slides.html