#!/bin/sh -l

[ -z "$SYMFONY_PROJECT_ID" ] && echo "Need to set SYMFONY_PROJECT_ID" && exit 1
[ -z "$SYMFONY_TOKEN" ] && echo "Need to set SYMFONY_TOKEN" && exit 1
[ -z "$GITHUB_REF" ] && echo "Need to set SYMFONY_TOKEN" && exit 1

sh -c "printenv"



SYMFONY_ENVIRONMENT="${GITHUB_REF/refs\/head\//}"

sh -c "symfony version"
sh -c "symfony link $SYMFONY_PROJECT_ID"
sh -c "symfony env:create $SYMFONY_ENVIRONMENT"
sh -c "/usr/local/bin/symfony $*"
