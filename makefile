include ./.env

build:
	webpack && make lint && web-ext build -s ext

run:
	webpack --watch & web-ext run -s ext --bc --firefox-profile ${WEB_EXT_FIREFOX_PROFILE} & wait

runNightly:
	webpack --watch & web-ext run -f nightly -s ext --bc --firefox-profile ${WEB_EXT_FIREFOX_PROFILE} & wait

sign:
	webpack && make lint && web-ext sign -s ext --api-key ${APIKEY} --api-secret ${APISECRET}

lint:
	web-ext lint -s ext

ext/icons/icon.svg: icon.svg.js
	node icon.svg.js > ext/icons/icon.svg