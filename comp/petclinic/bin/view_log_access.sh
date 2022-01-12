#!/bin/bash
DATE=$(date "+%Y-%m-%d") && tail -F ../logs/localhost_access_log.$DATE.txt
