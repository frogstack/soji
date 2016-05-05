#!/usr/bin/env bash

todays_note_file="$SOJI_NOTE_DIR/engineering-notebook-`date +%Y-%m-%d`.md"
if [ -e $todays_note_file ]; then
  poms=`cat $todays_note_file | grep "### Pom" | wc -l`
  echo
  echo "Today you did $poms Pomodoros"
  echo

  cat $todays_note_file | grep "### Pom"
  echo

  dates=`cat $todays_note_file | sed '/^$/ d' | grep -i -A 1 "### Lunch" | awk -F'-' '{print $NF}'`
  formula=(`date +%s --date "$(echo $dates | awk '{print $2}')"`-`date +%s --date "$(echo $dates | awk '{print $1}')"`)/60
  lunch_min=`echo "$formula" | bc`
  echo "You took a $lunch_min min Lunch at $(echo $dates | awk '{print $1}')"
fi

