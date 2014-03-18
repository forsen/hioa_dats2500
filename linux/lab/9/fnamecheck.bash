#!/bin/bash
find $1 -type f | grep -e '[æÆøØåÅ]\|\s'
