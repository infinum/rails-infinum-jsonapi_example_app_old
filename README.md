[![Maintainability](https://api.codeclimate.com/v1/badges/4149506cc9736f8ae8b7/maintainability)](https://codeclimate.com/repos/55f5e5f26956802431004c66/maintainability)
[![Build Status](https://semaphoreci.com/api/v1/projects/dcaf37ba-7b17-4653-9bf1-67c5a4755d14/866843/badge.svg)](https://semaphoreci.com/infinum/web)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4149506cc9736f8ae8b7/test_coverage)](https://codeclimate.com/repos/55f5e5f26956802431004c66/test_coverage)
[![Issue Count](https://codeclimate.com/repos/56bcf5c3461848007e001c25/badges/4149506cc9736f8ae8b7/issue_count.svg)](https://codeclimate.com/repos/4149506cc9736f8ae8b7/feed)
# README

## Dependencies

### System
  * yarn, eslint

## Setup
Before:
  * ensure you have read permissions for vault

Run:
```bash
./bin/setup
```

Run after each git pull:
```bash
./bin/update
```

## Test suite
Run:
```bash
rspec
```

## Environments
  * staging <stg>: [staging](https://staging.com)
  * production <prod>: [production](https://production.com)

## Deployment
[Semaphore](https://semaphoreci.com)

