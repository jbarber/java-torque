.PHONY: all clean run

JDKHOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.4.1.fc20.x86_64
STEM=pbs
PACKAGE=io.github.jbarber

CFLAGS=-fPIC -I$(JDKHOME)/include/ -I$(JDKHOME)/include/linux
LDFLAGS=-shared -ltorque

$(STEM)_wrap.c: $(STEM).i
	swig -java -package $(PACKAGE) -outdir io/github/jbarber $(STEM).i

$(STEM)_wrap.o: $(STEM)_wrap.c

lib$(STEM).so: $(STEM)_wrap.o
	$(LD) $(LDFLAGS) $^ -o $@

io/github/jbarber/pbs.java: $(STEM)_wrap.c

io/github/jbarber/%.class: %.java; javac $^

%.class: %.java; javac $^

main.class: main.java io/github/jbarber/pbs.class
	javac -cp ./ $<

all: main.class lib$(STEM).so

clean:
	rm -f io/github/jbarber/* $(STEM).class $(STEM).java $(STEM)JNI.class $(STEM)JNI.java $(STEM).o $(STEM)_wrap.o lib$(STEM).so $(STEM)_wrap.c main.class

run: main.class lib$(STEM).so
	LD_LIBRARY_PATH=$(PWD) java -cp $(STEM).class:./ main
