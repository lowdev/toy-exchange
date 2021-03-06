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
Why Getter and Setter break encapsulation:
- https://stackoverflow.com/questions/34805276/do-setter-and-getter-methods-breaks-encapsulation#:~:text=Having%20getters%20and%20setters%20does%20not%20in%20itself%20break%20encapsulation.&text=The%20point%20of%20encapsulation%20is,reasonable%20policy%20for%20doing%20it.
- https://www.javaworld.com/article/2073723/why-getter-and-setter-methods-are-evil.html


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

### Communication client / Server
#### Spring Rest HATEOAS
Communication between server and client is in REST.

This is HAL format. [http://stateless.co/hal_specification.html](http://stateless.co/hal_specification.html)
```
{
    _embedded: {
        toys: [
            {
                id: "ebf267b8-28ce-496a-aed7-fbbee956b30f",
                description: "No description",
                title: "Puzzle 1000 p - Photo de groupe Disney (Panorama)",
                numberOfPieces: "1000",
                thumbnail: "https://cdn.ravensburger.de/images/produktseiten/360/15109.jpg",
                _links: {
                    self: {
                        href: "http://localhost:8080/toys/ebf267b8-28ce-496a-aed7-fbbee956b30f"
                    }
                },
            },
            {
                id: "c2f1e2cb-2050-4e26-8222-b188c9795bff",
                description: "No description",
                title: "Puzzle 1000 p - VÃ©los Ã  Amsterdam",
                numberOfPieces: "1000",
                thumbnail: "https://cdn.ravensburger.de/images/produktseiten/360/19606.jpg",
                _links: {
                    self: {
                        href: "http://localhost:8080/toys/c2f1e2cb-2050-4e26-8222-b188c9795bff"
                    }
                }
            }
        ]
    }
}
```

Two controllers :
- ToyController
- MeController
- UserController

Which one should manage to get toys by user ?
- UserController: GET users/1/toys
UserController will need to have toys domain, i don't like this idea to create a link
between this two domains for the moment.

- ToyController: GET toys/current_user
ToyController is a preferable approach in my opinions

- MeController: GET me/toys
MeController will be in toys domain, this approach is class and look like to facebook
rest api.

I will go with MeController


#### GraphQL

### UI
#### Futter

Flutter is a framework to create android, ios and web app
with a source code.

[http://localhost:8080/flutter/index.html](http://localhost:8080/flutter/index.html)

## To learn / Question to myself

- Difference yet between application service and domain service
- How to manage transaction in DDD
- For CRUD operations should we pass by domain or use directly infra
- GraphQL
- Representation with an object (ex: Title vs String)

## References

1. [Introducing EventStorming](https://leanpub.com/introducing_eventstorming) by Alberto Brandolini
2. [Domain Modelling Made Functional](https://pragprog.com/book/swdddf/domain-modeling-made-functional) by Scott Wlaschin
3. [Software Architecture for Developers](https://softwarearchitecturefordevelopers.com) by Simon Brown
4. [Clean Architecture](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164) by Robert C. Martin
5. [Domain-Driven Design: Tackling Complexity in the Heart of Software](https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215) by Eric Evans
