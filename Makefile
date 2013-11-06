TEMPLATES = $(shell find template -type f | grep -v swp)
TARGETS = $(TEMPLATES:template/%=.weechat/%)

all: $(TARGETS)

.weechat/%: template/% Makefile weechat.yaml
	tt-render \
	    --path=template/ \
	    --data=weechat.yaml \
	    --post-chomp \
	    --strict \
	    $(<:template/%=%) \
	> $@
