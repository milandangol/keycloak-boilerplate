#!/bin/bash
set -e

curl -s http://localhost:8080/health/ready || exit 1 