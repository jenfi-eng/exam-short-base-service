# Test Overview

This test is to read a piece of code and display an understanding of it through words & specs.

## Description

The code we're looking at is `app/services/base_service.rb`. 

In Jenfi, Service Objects hold all the key business logic and this file... well I'm hoping you can tell me.

# Test Instruction

1. Read the code
1. Run the [Startup Instructions](#instructions)
1. Write some basic specs
    - Add specs to `specs/services/base_service_spec.rb`.
1. Writeup of quick/dirty thoughts in the [Your Thoughts](#thoughts) section.
    - Bullet points
    - You can tell me this code sucks, but you have to tell me why.
1. Zip up the directory, email it to Justin, justin@jenfi.com.
1. Issues? Justin's Whatsapp: +65-9827-8750

## What NOT to do

- Don't modify/improve the base_service.rb (just write up your thoughts)
- Don't only write specs. Leave time for writing your thoughts.
- Don't get stuck, it's more important to write & create specs for what you understand
    - This thing is like an onion
    - Each layer gets more difficult to reason about
- Don't spend more than 2 hours on this.
# Some Questions to Guide

1. What is the entry point?
1. How is this called?
1. What can the BaseService do?
1. ...

# Startup Instructions<a name="instructions"></a>

1. Install Docker
1. run `docker-compose up --build --remove-orphans`
1. run `docker exec -it exam-short-base-service_app_1 /bin/bash`
1. run `rails db:create && rails db:migrate`
1. run `rspec .`

# Your Thoughts <a name="thoughts"></a>

- 
- 
- 