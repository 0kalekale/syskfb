# Only X11 for now, wayland later
# uses opengl api by default

CC	= 	gcc -std=gnu11 -DUSE_OPENGL_API 
INC 	=	-Iinclude -Isrc -Isrc/x11
LIN 	=	-lX11
SRC 	= 	src/*.c src/x11/*.c	

syskFB:
	mkdir -p build
	$(CC) -c $(INC) $(LIN) src/MiniFB_common.c -o build/MiniFB_common.o
	$(CC) -c $(INC) $(LIN) src/MiniFB_internal.c -o build/MiniFB_internal.o
	$(CC) -c $(INC) $(LIN) src/MiniFB_linux.c -o build/MiniFB_linux.o 
	$(CC) -c $(INC) $(LIN) src/MiniFB_timer.c -o build/MiniFB_timer.o
	$(CC) -c $(INC) -Iinclude/gl -lGL -lglfw src/gl/MiniFB_GL.c -o build/MiniFB_GL.o
	$(CC) -c $(INC) $(LIN) src/x11/X11MiniFB.c -o build/X11MiniFB.o
	ar rcs build/libsyskFB.a build/*.o

clean: 
	rm -rf build
