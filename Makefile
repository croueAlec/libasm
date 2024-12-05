#	Colors
DEFAULT    = \033[0m
BLACK    = \033[0;30m
RED        = \033[0;31m
GREEN    = \033[0;32m
YELLOW    = \033[0;33m
BLUE    = \033[0;34m
PURPLE    = \033[0;35m
CYAN    = \033[0;36m
BWHITE    = \033[1;37m

# Utils
NASM = nasm
OBS = $(SRCS:.asm=.o)
NAME = libasm.a
RM = rm -rf

#	Directories
OBJS_DIR = objs

#	Files
SRCS := srcs/ft_strlen.asm

OBJ := $(patsubst %.asm,$(OBJS_DIR)/%.o,$(SRC))

# Rules
all: $(NAME)

${NAME} : ${OBJS}
	@ar rcs ${NAME} ${OBJS}

-include %(DEPS)
$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	@echo "$(CYAN)- Compiling$(DEFAULT) $<"
	@mkdir -p $(OBJS_DIR)
	@$(NASM) -c $< -o $@

clean:
	@echo "$(RED)! Removing$(DEFAULT) ${OBJS_DIR} files"
	@${RM} ${OBJS_DIR}

fclean: clean
	@echo "$(RED)! Removing$(DEFAULT) $(NAME)"
	@$(RM) $(NAME)
	@echo "$(RED)! Removing$(DEFAULT) $(TEST_PARSING)"

re: fclean all

cre:
	@clear
	@make re --no-print-directory
