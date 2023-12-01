CC=cc
#CFLAGS
NAME=minitalk

SERVER=server
PATH_SERVER=
SOURCES_SERVER=server.c
SOURCES_SERVER := $(SOURCES_SERVER:%=$(PATH_SERVER)%)
OBJECTS_SERVER=$(SOURCES_SERVER:.c=.o)

CLIENT=client
PATH_CLIENT=
SOURCES_CLIENT=client.c
SOURCES_CLIENT := $(SOURCES_CLIENT:%=$(PATH_CLIENT)%)
OBJECTS_CLIENT := $(SOURCES_CLIENT:.c=.o)

LIBFT_DIR=./libft
LIBFT=libft.a
LIBFT_PATH=$(LIBFT_DIR)/$(LIBFT)

all: $(NAME)

$(NAME): $(SERVER) $(CLIENT) clean

$(SERVER): $(LIBFT) $(OBJECTS_SERVER)
	$(CC) $(LIBFT) $(OBJECTS_SERVER) -o $(SERVER)

$(CLIENT): $(LIBFT) $(OBJECTS_CLIENT)
	$(CC) $(LIBFT) $(OBJECTS_CLIENT) -o $(CLIENT)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)
	cp $(LIBFT_PATH) $(LIBFT)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS_SERVER) $(OBJECTS_CLIENT)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(SERVER) $(CLIENT) $(LIBFT)
	rm -f a.out
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all
