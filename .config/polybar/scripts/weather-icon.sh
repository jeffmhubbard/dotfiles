#!/usr/bin/env bash

# weather-icon.sh
#

CITY="4671654"
UNITS="imperial"
SYMBOL=""
COLOR="#7f7f7f"

API="https://api.openweathermap.org/data/2.5"
KEY="5a8ee2a1219f6211e45343a8f8276118"

# use nerd fonts
get_icon() {
  case $1 in
    01d) icon="";;
    01n) icon="";;
    02d) icon="杖";;
    02n) icon="";;
    03*) icon="";;
    04*) icon="";;
    09d) icon="";;
    09n) icon="";;
    10d) icon="";;
    10n) icon="";;
    11d) icon="";;
    11n) icon="";;
    13d) icon="";;
    13n) icon="";;
    50d) icon="";;
    50n) icon="";;
    *) icon="";
  esac
  echo $icon
}

# get weather results
if [ -n "$CITY" ]; then
  if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
    CITY_PARAM="id=$CITY"
  else
    CITY_PARAM="q=$CITY"
  fi
  weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
  location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)
  if [ -n "$location" ]; then
    location_lat="$(echo "$location" | jq '.location.lat')"
    location_lon="$(echo "$location" | jq '.location.lng')"
    weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
  fi
fi

# parse data for icon code and temp
if [ -n "$weather" ]; then
  weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")
  weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
  echo "%{F${COLOR}}%{T2}$(get_icon "$weather_icon")%{T-}%{F-}" "$weather_temp%{T2}$SYMBOL%{T-}"
fi

# vim: ft=sh ts=2 sw=0 et:
