_ARGS:= $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(_ARGS):;@:)

#
#_SHELL:= /bin/bash
#
#define checkArgs =
#@[ -z "$(_ARGS)" ] && echo Please provide arg && exit 1
#endef

.PHONY: git
git:
	./help/git.sh $(_ARGS)
