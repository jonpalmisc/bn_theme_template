THEME_NAME	?= template

BN_USER_DIR	?= ~/Library/Application\ Support/Binary\ Ninja
INSTALL_DIR	:= $(BN_USER_DIR)/themes
BUILD_DIR	?= out

THEME_T		:= $(BUILD_DIR)/$(THEME_NAME).bntheme
THEME_S		:= src/theme.json
STYLE_O		:= $(BUILD_DIR)/style.css
STYLE_S		:= src/style.scss

.PHONY: all
all: $(THEME_T)

$(THEME_T): $(THEME_S) $(STYLE_O)
	@mkdir -p $(BUILD_DIR)
	./tools/assemble.py $(THEME_S) $(STYLE_O) >$(THEME_T)

$(STYLE_O): $(STYLE_S)
	@mkdir -p $(BUILD_DIR)
	sass $< >$@

.PHONY: install
install: $(THEME_T)
	@mkdir -p $(INSTALL_DIR)
	install $(THEME_T) $(INSTALL_DIR)

.PHONY: format
format:
	@prettier -w $(THEME_S) $(STYLE_S)

.PHONY: clean
clean:
	@rm -fr $(BUILD_DIR)
