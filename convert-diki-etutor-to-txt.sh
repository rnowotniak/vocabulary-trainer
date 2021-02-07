#!/bin/bash

grep -A4 'class="hw"' "$1" \
	| grep -v 'class="hw"' \
	| sed -e 's/<[^>]\+>//g' \
	| sed -e 's/&nbsp;//g' \
	| sed -e 's/^ \+//g'    \
	| sed  ':a;N;$!ba;s/[^-]\n\([^-]\)/,\1/g' \
	| sed -n '/^$/!p' \
	| sed ':a;N;$!ba;s/,\n=,/= /g' \
	| sed -e 's/ \+/ /g' \
	| grep -v '^--$'

