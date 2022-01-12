#!/bin/bash
DATE=$(date "+%Y-%m-%d") && tail -F ../logs/catalina.$DATE.log
