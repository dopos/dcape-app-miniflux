# app custom Makefile

# Docker repo & image name without version
IMAGE    ?= miniflux/miniflux
# Docker image version
IMAGE_VER        ?= latest
# Hostname for external access
APP_SITE ?= rss.dev.lan
# App names (db/user name etc)
APP_NAME ?= miniflix

# Enable DB usage:
# * Add DB config part to .env.sample
# * Enable db* targets
# * make db-create inside .drone-default target
USE_DB   ?= yes

# Add user config part to .env.sample
ADD_USER ?= yes

# ------------------------------------------------------------------------------
# app custom config

DCAPE_ROOT   ?= /opt/dcape/var

# ------------------------------------------------------------------------------
# .env template (custom part)
# inserted in .env.sample via 'make config'
define CONFIG_CUSTOM
# ------------------------------------------------------------------------------
# app custom config, generated by make config
# db:$(USE_DB) user:$(ADD_USER)

# Path to /opt/dcape/var. Used only outside drone
#DCAPE_ROOT=$(DCAPE_ROOT)

endef

# ------------------------------------------------------------------------------
# Find and include DCAPE/apps/drone/dcape-app/Makefile
DCAPE_COMPOSE   ?= dcape-compose
DCAPE_MAKEFILE  ?= $(shell docker inspect -f "{{.Config.Labels.dcape_app_makefile}}" $(DCAPE_COMPOSE))
ifeq ($(shell test -e $(DCAPE_MAKEFILE) && echo -n yes),yes)
  include $(DCAPE_MAKEFILE)
else
  include /opt/dcape-app/Makefile
endif

# -----------------------------------------------------------------------------
## Custom app targets
#:

