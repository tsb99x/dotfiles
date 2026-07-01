#!/bin/sh -eux

qdbus6 org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript \
	"var panel = panelById(panelIds[0]); panel.hiding = 'autohide';"
