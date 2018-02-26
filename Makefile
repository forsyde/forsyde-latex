METAFONT_SRC := fonts
MANUAL_SRC   := doc
SOURCE_SRC   := src

HOME_PATH  := $(shell kpsewhich -var-value TEXMFHOME)
LOCAL_PATH := $(shell kpsewhich -var-value TEXMFLOCAL)
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

docs :
	$(MAKE) -C doc

clean :
	$(MAKE) clean -C doc

view :
	$(MAKE) view -C doc

install : $(METAFONTS) $(FOUNDRIES) $(SOURCES) $(PACKAGES)
	@if [ -f $(MANUAL_SRC)/refman.pdf ]; then cp $(MANUAL_SRC)/refman.pdf $(MANUAL_PATH)/; fi
	@echo "Package ForSyDe-LaTex installed in$(TEXMF_PATH)"

uninstall :
	@find $(TEXMF_PATH)/fonts/ -name "forsyde*" -type f -delete
	@rm -rf $(MANUAL_PATH)/* $(SOURCE_PATH)/*
	@echo "Package ForSyDe-LaTeX uninstalled."

define install-template
  $(METAFONTS) : $(1)/fonts/source/public/typeface/%.mf : fonts/%.mf
	@cp $$< $$@

  $(FOUNDRIES) : $(1)/fonts/tfm/foundry/typeface/%.tfm : fonts/%.mf
	@if mf '\mode:=ljfour; nonstopmode; input '"$$<"'' ; then \
		mv $$(@F) $$@; \
	fi
	@rm *log *gf

  $(SOURCES) : $(1)/tex/latex/forsyde/%.tex : src/%.tex
	@cp $$< $$@

  $(PACKAGES) : $(1)/tex/latex/forsyde/%.sty : src/%.sty
	@cp $$< $$@
endef

$(eval $(call install-template, $(TEXMF_PATH)))

.PHONY: uninstall
