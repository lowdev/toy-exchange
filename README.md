## Thanks to

1. [ddd-by-exmples](https://github.com/ddd-by-examples/library/)
2. [hexagonal-architecture-acerola](https://github.com/ivanpaulovich/hexagonal-architecture-acerola)
3. [ddd-playground](https://github.com/jorge07/ddd-playground/)

# Table of contents

1. [About](#about)
2. [References](#references)
3. [Project structure and architecture](#project-structure-and-architecture)  
   3.1. [Hexagonal Architecture](#hexagonal-architecture)

## About

This project help me to practise different techniques such as
- Architecture hexagonal / onion architecture
- DDD
- Event sourcing
- CQRS

I try to not use getter/setter to have a strong encapsulation (and see what happened :p)

## Domain description

Toy exchange

## Project structure and architecture
### Introduction Hexagonal Architecture
The thing that i like in architecture hexagonal: make sustainable business code.
To do that, we don't want to have framework in our business code.
Just pure java!

Nothing against frameworks. Frameworks will be used outside our business code.

[More info on octo blog](https://blog.octo.com/en/hexagonal-architecture-three-principles-and-an-implementation-example/)

### Terminology
Domain is where I will put business code.
Infrastructure is where I will put all code that not doesn't fit in domain.
Port is interface part of domain.
Adapter is implementation of port part of infrastructure.

There is two type of port: In and Out (trigger and writer)

"Port in" will be used by Rest controller.
"Port out" will be used in domain to save in database to launch event

### Package Structure

```
└── toy-exchange
    ├── booter
    │   └── springBoot
    ├── feature
    │   ├── toy
    │   │   ├── domain
    │   │   └── infrastructure
    │   └── user
    │   │   ├── domain
    │   │   └── infrastructure
    └── ui
        └── flutter
```

## Technology
### Gradle
### Spring Rest
### Futter

## To learn / Question to myself

- Difference yet between application service and domain service
- How to manage transaction in DDD
- For CRUD operations should we pass by domain or use directly infra 

## References

1. [Introducing EventStorming](https://leanpub.com/introducing_eventstorming) by Alberto Brandolini
2. [Domain Modelling Made Functional](https://pragprog.com/book/swdddf/domain-modeling-made-functional) by Scott Wlaschin
3. [Software Architecture for Developers](https://softwarearchitecturefordevelopers.com) by Simon Brown
4. [Clean Architecture](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164) by Robert C. Martin
5. [Domain-Driven Design: Tackling Complexity in the Heart of Software](https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215) by Eric Evans
