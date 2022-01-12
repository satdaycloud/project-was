#!/bin/bash
DATE=$(date "+%Y-%m-%d") && ./startup.sh && tail -F ../logs/catalina.$DATE.log
