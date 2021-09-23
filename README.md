# Test Overview

This test is to read a piece of code and display an understanding of it through words & specs.

## Description

The code we're looking at is `app/services/base_service.rb`.

In Jenfi, Service Objects hold all the key business logic and this file underpins it all. We're hoping you can tell us how this works.

## Supporting Materials

- `Account` & `Company` ActiveRecord objects are available.
- Rspec, FactoryBot, Faker

# Test Instruction

1. Read the code.
1. Run the [Startup Instructions](#instructions).
1. Write specs to show understanding.
    - Add specs to `specs/services/base_service_spec.rb`.
    - **Hint**: One spec should cover successfully creating a `Company` w/ an `Account`.
1. Writeup of quick thoughts in the [Your Thoughts](#thoughts) section.
    - Bullet points
    - You can tell me this code sucks, but you have to tell me why.
1. When you're finished - zip up the directory, email it.
1. Issues? Reach out!

## What NOT to do

- Don't modify/improve anything other than the spec.
    - If you have improvements, write them below.
- Don't only write specs. Leave time for your thoughts.
- Don't get stuck, it's more important to write & create specs for what you understand.
    - This thing is like an onion.
    - Each layer gets more difficult to reason about.
- Don't spend more than 2 hours on this.

# Some Questions to Guide

1. What is the entry point/How is this called?
2. Tell me about the interface.
3. What can the BaseService do?
4. Why does the BaseService exist?
5. When is something like the BaseService used?
6. ...

# Startup Instructions<a name="instructions"></a>

**Not required** to use docker - just be able to run `rspec .`

1. Install Docker
1. run `docker-compose up --build --remove-orphans`
1. run `docker exec -it exam-short-base-service_app_1 /bin/bash`
1. run `rails db:create && rails db:migrate`
1. run `rspec .`

# Your Thoughts <a name="thoughts"></a>

- 
- 
- 
