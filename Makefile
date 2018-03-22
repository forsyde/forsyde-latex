METAFONT_SRC := fonts
MANUAL_SRC   := doc
SOURCE_SRC   := src
MKDIR        := mkdir -p

##########################################

# Check that given variables are set and all have non-empty values,
# die with an error otherwise.
# 1. Variable name(s) to test.
# 2. (optional) Error message to print.
check_defined = \
    $(strip $(foreach 1,$1, \
        $(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
    $(if $(value $1),, \
      $(error $1$(if $2, ($2))))

KPSEWHICH  := $(shell which kpsewhich)
HOME_PATH  := $(shell $(KPSEWHICH) -var-value TEXMFHOME)
LOCAL_PATH := $(shell $(KPSEWHICH) -var-value TEXMFLOCAL)
TEXMF_PATH := $(if $(shell if [ -w $(LOCAL_PATH) ]; then echo "1"; fi), $(LOCAL_PATH), $(HOME_PATH))

METAFONT_PATH := $(TEXMF_PATH)/fonts/source/public/typeface
FOUNDRY_PATH  := $(TEXMF_PATH)/fonts/tfm/foundry/typeface
MANUAL_PATH   := $(TEXMF_PATH)/doc/forsyde
SOURCE_PATH   := $(TEXMF_PATH)/tex/latex/forsyde

FOUNDRY_SRC = $(foreach size, 8 10 14, $(wildcard $(METAFONT_SRC)/*$(size).mf))
METAFONTS = $(patsubst $(METAFONT_SRC)/%.mf,$(METAFONT_PATH)/%.mf,$(wildcard $(METAFONT_SRC)/*.mf))
FOUNDRIES = $(patsubst $(METAFONT_SRC)/%.mf,$(FOUNDRY_PATH)/%.tfm,$(FOUNDRY_SRC))
SOURCES   = $(patsubst $(SOURCE_SRC)/%.tex,$(SOURCE_PATH)/%.tex,$(wildcard $(SOURCE_SRC)/*.tex))
PACKAGES  = $(patsubst $(SOURCE_SRC)/%.sty,$(SOURCE_PATH)/%.sty,$(wildcard $(SOURCE_SRC)/*.sty))


install : pre-install $(METAFONTS) $(FOUNDRIES) $(SOURCES) $(PACKAGES) post-install
	@echo "Package ForSyDe-LaTex installed in$(TEXMF_PATH)"

pre-install : 
	@:$(call check_defined, KPSEWHICH, Cannot find the program kpsewhich. Aborting... \
		Please refer to the user manual for manual installation.)

post-install:
	@test -f $(shell $(KPSEWHICH) --all forsyde.sty) || echo \
		"Installation did not succeed! Refer to the user manual for installing the package manually."
	@$(MKDIR) $(MANUAL_PATH)
	@if [ -f $(MANUAL_SRC)/refman.pdf ]; then \
		cp $(MANUAL_SRC)/refman.pdf $(MANUAL_PATH)/; \
	fi

uninstall :
	@find $(TEXMF_PATH)/fonts/ -name "forsyde*" -type f -delete
	@rm -rf $(MANUAL_PATH)/* $(SOURCE_PATH)/*
	@echo "Package ForSyDe-LaTeX uninstalled."

docs :
	$(MAKE) -C doc

clean :
	$(MAKE) clean -C doc

superclean :
	$(MAKE) superclean -C doc

view :
	$(MAKE) view -C doc

define install-template
  $(METAFONTS) : $(1)/fonts/source/public/typeface/%.mf : fonts/%.mf
	@$(MKDIR) $(METAFONT_PATH)
	@echo "* installing $$(@F)"
	@cp $$< $$@

  $(FOUNDRIES) : $(1)/fonts/tfm/foundry/typeface/%.tfm : fonts/%.mf
	@$(MKDIR) $(FOUNDRY_PATH)
	@echo "* generating fontmap for $$(@F)"
	@if mf '\mode:=ljfour; nonstopmode; input '"$$<"'' ; then \
		mv $$(@F) $$@; \
	fi
	@rm *log *gf

  $(SOURCES) : $(1)/tex/latex/forsyde/%.tex : src/%.tex
	@$(MKDIR) $(SOURCE_PATH)
	@echo "* installing $$(@F)"
	@cp $$< $$@

  $(PACKAGES) : $(1)/tex/latex/forsyde/%.sty : src/%.sty
	@$(MKDIR) $(SOURCE_PATH)
	@echo "* installing $$(@F)"
	@cp $$< $$@
endef

$(eval $(call install-template, $(TEXMF_PATH)))

.PHONY: uninstall clean superclean
