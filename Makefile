CC := gcc
SRCDIR := src
BUILDDIR := build
CFLAGS := 
INC := -I include

all : bin/trivial_method bin/kdtree_method

bin/trivial_method: $(BUILDDIR)/table.o $(BUILDDIR)/trivial_method.o $(BUILDDIR)/image.o
	@echo " Linking..."
	@echo " $(CC) $^ -o  bin/trivial_method "; $(CC) $^ -o bin/trivial_method -lm -O3 

bin/kdtree_method: $(BUILDDIR)/image.o $(BUILDDIR)/table.o $(BUILDDIR)/kdtree.o $(BUILDDIR)/nearest.o $(BUILDDIR)/kdtree_method.o
	@echo " Linking..."
	@echo " $(CC) $^ -o bin/kdtree_method "; $(CC) $^ -o bin/kdtree_method -lm -O3
	

$(BUILDDIR)/trivial_method.o: src/trivial_method.c 
	@echo " Building..."
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3

$(BUILDDIR)/kdtree_method.o: src/kdtree_method.c 
	@echo " Building..."
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3

$(BUILDDIR)/table.o: src/table.c 
	@echo " Building..."
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3


$(BUILDDIR)/image.o: src/image.c 
	@echo " Building..."
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3


$(BUILDDIR)/kdtree.o: src/kdtree.c 
	@echo " Building..."
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3


$(BUILDDIR)/nearest.o: src/nearest.c 
	@echo " Building..."
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< -save-temps -O3
clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET)


.PHONY: clean all
